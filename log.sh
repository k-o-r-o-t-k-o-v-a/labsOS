#!/bin/bash
if ! [[ -f "/var/log/anaconda/X.log" ]]; then
echo "error: there is no file X.log in such derictory"
exit 3
fi

cat /var/log/anaconda/X.log | grep "(WW)" | grep -v "warning" | sed "s/(WW)/\x1b[1;33mWarning\x1b[0m/g"
cat /var/log/anaconda/X.log | grep "(II)" | grep -v "informational" | sed "s/(II)/\x1b[1;36mInformation\x1b[0m/g"

