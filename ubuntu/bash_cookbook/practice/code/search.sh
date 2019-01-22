# This shell script demonstrates different kinds of search

# Before running this script these are the commands to be run
# $ wget --recursive --no-parent https://www.packtpub.com www.packtpub.com # Takes awhile
# $ traceroute packtpub.com > traceroute.txt
# $ mkdir -p www.packtpub.com/filedir www.packtpub.com/emptydir
# $ touch www.packtpub.com/filedir/empty.txt
# $ touch www.packtpub.com/findme.xml; echo "<xml>" www.packtpub.com/findme.xml

directory="../data/www.packtpub.com" 
search_term="packet"

# Search the term packet in the home folder recursively and write to a file
grep -r "$search_term" ~/* > ../data/www.packtpub.com/result1.txt 

# Search the term packet in the same folder recursively and write to a file
grep -r $search_term ../data/www.packtpub.com > ../data/www.packtpub.com/result2.txt

# Search more than 1 term 
grep -r -e $search_term -e publishing $directory > ../data/www.packtpub.com/result3.txt

# Using find for a regular expression
# The find utility feeds the input of xargs with a long list of file names.
# xargs then splits this list into sublists and calls rm once for every sublist. 
find $directory -type f -print | xargs grep $search_term > ../data/www.packtpub.com/result4.txt

# Find files only in .xml and .css file
find $directory -type f -name "*.xml" ! -name "*.css" -print | xargs grep $search_term > ../data/www.packtpub.com/result5.txt
