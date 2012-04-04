def revise_arr(l)
	help_words=['are', 'am', 'is', 'was', 'were', 'has', 'have']
	help_words=help_words.join(' ').upcase.split; match_found=false
	help_words.each do |x|
	if l.include?(x)&&(l.index(x))!=0
	then
	i=l.index(x)-1
	l[i]+=" "+l[i+1];l.delete_at(i+1); match_found=true
	end
	break if match_found==true
	end
	help_words.each{|x| if (match_found==false)&&(l[0]==x) then l[0]+=" "+l[1]; l.delete_at(1); end}
	l
end
file=File.open('lines_db')
file.each do |l|
l=l.upcase.gsub(/[^A-Z' ]/,'').split
rev=revise_arr(l)
puts rev.shuffle.join(' ')
end
