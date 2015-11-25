#!/bin/bash

clear

echo "cat words.txt                         Just print the whole file"
read
cat words.txt
read
clear

echo ""
echo "---- Simple Use & Flags ----"
echo ""
read
clear

echo ""
echo "grep -E 'Sue' words.txt               all lines where 'Sue' occurs"
echo ""
read
grep -E 'Sue' words.txt
read
clear

echo ""
echo "grep -E -c 'Sue' words.txt            counts number of matched lines"
echo ""
read
grep -E -c 'Sue' words.txt
read
clear

echo ""
echo "grep -E -n 'Sue' words.txt            now with line numbers"
echo ""
read
grep -E -n 'Sue' words.txt
read
clear

echo ""
echo "grep -E -o 'Sue' words.txt            just print the match - 'Sue' each on different line"
echo ""
read
grep -E -o 'Sue' words.txt
read
clear

echo ""
echo "grep -E -v 'Sue' words.txt            all lines where 'Sue' does NOT occur"
echo ""
read
grep -E -v 'Sue' words.txt
read
clear

echo ""
echo "---- Anchors ----"
echo ""
read
clear

echo ""
echo "grep -E '^Sue' words.txt              lines that START with 'Sue'"
echo ""
read
grep -E '^Sue' words.txt
read
clear

echo ""
echo "grep -E 'Sue$' words.txt              lines that END with 'Sue'"
echo ""
read
grep -E 'Sue$' words.txt
read
clear

echo ""
echo "grep -E ' Bob ' words.txt             Want single word 'Bob' - Does not always work."
echo ""
read
grep -E ' Bob ' words.txt
read
clear

echo ""
echo "grep -E '\bBob\b' words.txt           Want single word 'Bob' - Use word boundaries"
echo ""
read
grep -E '\bBob\b' words.txt
read
clear

echo ""
echo "---- Special characters - ( ?  \  .  [  ]  ^  $ * ) ----"
echo ""
read
clear

echo ""
echo "grep -E '*' words.txt                 not really what you expect"
echo ""
read
grep -E '*' words.txt
read
clear

echo ""
echo "grep -E '\*' words.txt                Special characters (*) must be '\'"
echo ""
read
grep -E '\*' words.txt
read
clear

echo ""
echo "---- Quantifiers ----"
echo ""
read
clear

echo ""
echo "grep -E 'a b. c' words.txt            '.' any ONE character"
echo ""
read
grep -E 'a b. c' words.txt
read
clear

echo ""
echo "grep -E 'a b.* c' words.txt           * = 0 or more"
echo ""
read
grep -E 'a b.* c' words.txt
read
clear

echo ""
echo "grep -E 'a b.? c' words.txt           ? = 0 or 1"
echo ""
read
grep -E 'a b.? c' words.txt
read
clear

echo ""
echo "grep -E 'a b.+ c' words.txt           + = 1 or more"
echo ""
read
grep -E 'a b.+ c' words.txt
read
clear

echo ""
echo "grep -E 'a b.{3} c' words.txt         {3} exactly 3"
echo ""
read
grep -E 'a b.{3} c' words.txt
read
clear

echo ""
echo "grep -E 'a b.{2,3} c' words.txt       {2,3} between 2 and 3"
echo ""
read
grep -E 'a b.{2,3} c' words.txt
read
clear

echo ""
echo "---- Ranges of Characters [] ----"
echo ""
read
clear

echo ""
echo "grep -E 'a b[a-z]{2} c' words.txt     [a-z] - any lower case letter"
echo ""
read
grep -E 'a b[a-z]{2} c' words.txt
read
clear

echo ""
echo "grep -E 'a b[0-9]{2} c' words.txt     [0-9] any number"
echo ""
read
grep -E 'a b[0-9]{2} c' words.txt
read
clear

echo ""
echo "grep -E 'a b[0-9,a-z]{3} c' words.txt     any number or letter"
echo ""
read
grep -E 'a b[0-9,a-z]{3} c' words.txt
read
clear

echo ""
echo "grep -E '[0-9]{3}-[0-9]{4}' words.txt      Phone Numbers"
echo ""
read
grep -E '[0-9]{3}-[0-9]{4}' words.txt
read
clear

echo ""
echo "grep -E '[0-9]{3}-[0-9]{2}-[0-9]{4}' words.txt       SSN"
echo ""
read
grep -E '[0-9]{3}-[0-9]{2}-[0-9]{4}' words.txt
read
clear

echo ""
echo "---- Matches are greedy - They will match as much as possible ----"
echo ""
read
clear

echo ""
echo "grep -E -o 'TH.*S' words.txt          Matches are greedy"
echo ""
read
grep -E -o 'TH.*S' words.txt
read
clear

echo ""
echo "grep -E -o 'TH[^S]*S' words.txt       [^S] everything that is NOT 'S'"
echo ""
read
grep -E -o 'TH[^S]*S' words.txt
read
clear

echo ""
echo "grep -E -o '<a.*>' words.txt          probably not what you want"
echo ""
read
grep -E -o '<a.*>' words.txt
read
clear

echo ""
echo "grep -E -o '<a[^>]*>' words.txt       pick out the 'anchor' tag"
echo ""
read
grep -E -o '<a[^>]*>' words.txt
read
clear

echo ""
echo "---- Groupings () and | ----"
echo ""
read
clear

echo ""
echo "grep -E '(Bob|Eve)' words.txt           | = or"
echo ""
read
grep -E '(Bob|Eve)' words.txt
read
clear

echo ""
echo "grep -E '(ba){2}' words.txt           the string 'ba' 2 times in a row"
echo ""
read
grep -E '(ba){2}' words.txt
read
clear

echo ""
echo "grep -E 'a b(1|a) c' words.txt"
echo ""
read
grep -E 'a b(1|a) c' words.txt
read
clear

echo ""
echo "grep -E '(From|Subject|Date):' words.txt             () groupings"
echo ""
read
grep -E '(From|Subject|Date):' words.txt
read
clear

echo ""
echo "SED - Stream Editor"
echo ""
read
clear

echo ""
echo "sed 's/Sue/*SUE*/g' words.txt         simple global subtitution (g = global)"
echo ""
read
sed 's/Sue/*SUE*/g' words.txt
read
clear

echo ""
echo "sed 's/[0-9]/(&)/g' words.txt         sub with backreference '&'"
echo ""
read
sed 's/[0-9]/(&)/g' words.txt
read
clear

echo ""
echo "sed '1,22d' words.txt                  deleting lines"
echo ""
read
sed '1,22d' words.txt
read
clear

echo ""
echo "tr - transliterate"
echo ""
read
clear

echo ""
echo "cat words.txt | tr A-Z a-z            quick upper/lowercase exchange"
echo ""
read
cat words.txt | tr A-Z a-z
read
clear

echo ""
echo "cat words.txt | tr Sa  xy             change all S to x and a to y"
echo ""
read
cat words.txt | tr Sa  xy
read
clear

echo ""
echo "uniq - report or omit repeated lines  (-i ignore case, -c count)"
echo ""
read
clear

echo ""
echo "uniq -c -i words.txt"
echo ""
read
uniq -c -i words.txt
read
clear

echo ""
echo "Getting Fancy - A little linguistics"
echo ""
read
clear

echo ""
echo "How many time is each letter used? (letter frequency)"
echo ""
echo "cat words.txt | tr A-Z a-z | grep -o -E '[a-z]' | sort | uniq -c -i | sort -n"
echo ""
echo "     ^               ^               ^              ^          ^         ^"
echo "Start Stream   Lower case    each letter on a     sort   find number    sort"
echo "                             different line              of unique "
echo "                                                         letters"
echo ""
read
cat words.txt | tr A-Z a-z | grep -o -E '[a-z]' | sort | uniq -c -i | sort -n
read
clear

echo ""
echo "How many time is each 4 letter word used? (word frequency)"
echo ""
echo ""
echo "cat words.txt | tr A-Z a-z | grep -o -E '\b\w{4}\b' | sort | uniq -c -i | sort -n"
echo ""
echo "     ^               ^               ^                  ^          ^         ^"
echo "Start Stream   Lower case    each 4 letter word        sort   find number   sort"
echo "                             on a different line              of unique 4"
echo "                                                              letters words"
echo ""
read
cat words.txt | tr A-Z a-z | grep -o -E '\b\w{4}\b' | sort | uniq -c -i | sort -n
read
