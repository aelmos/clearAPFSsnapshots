#!/bin/bash
#Run this as root
for i in $(diskutil ap listSnapshots /| grep -i xid|awk -F ":" '{print $2}'); 
   do echo $i; 
   diskutil apfs deleteSnapshot disk1s1 -xid $i; 
done
