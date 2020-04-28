#!/bin/bash
#Run this as root
#Set needed disk partition

DISK="disk1s5"
for i in $(diskutil ap listSnapshots /| grep -i xid|awk -F ":" '{print $2}'); 
   do echo $i; 
   diskutil apfs deleteSnapshot $DISK -xid $i; 
done
