#!/bin/bash

/usr/bin/lpstat -p | awk '{print $2}' | while read printer
do
echo "Deleting Printer:" $printer
/usr/sbin/lpadmin -x $printer
done
