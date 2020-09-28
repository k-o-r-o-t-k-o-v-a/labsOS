#!/bin/bash

echo " Actions of this application:
	calc: the application functions as a calculator. If the second argument is the key sum/sub/mul/div, the application displays the sun/difference/product/quotient og the third and fourth argument, which are integers;
	search: the application recursively searches the contents of files in the directory specified by the second argument, and displays the lines in accordance with the regular expression specified by the third argument;
	reverse: the application writes in reverse order the contents of the file, the name of which is given by the second argument, to the file with the name passed in the third argument;
	strlen: the application displays the number of characters in the string passed as the second argument;
	the application displays the lines of the /var/log/anaconda/X.log file containing warnings and informational messages, replacing the warning and informational message markers with the words Warning: and Information: so that all warnings and then all informational messages appear in the resulting file. When displayed on the screen, the word Warning is displayed in yellow, the word Information - in blue;
"