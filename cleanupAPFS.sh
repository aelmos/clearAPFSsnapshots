#!/bin/bash
#Run this as root
#Set needed disk partition

DISK="disk1s5"
for i in $(diskutil ap listSnapshots /| grep -i xid|awk -F ":" '{print $2}'); 
   do echo $i; 
   diskutil apfs deleteSnapshot $DISK -xid $i; 
done

tmutil disable localsnapshot
$Delete also localsnapshots
for SNAPSHOT in $(tmutil listlocalsnapshots / | egrep '[0-9]{4}\-[0-9]{2}\-[0-9]{2}\-[0-9]{6}' -o | tail -r); 
do tmutil deletelocalsnapshots $SNAPSHOT; 
done
sudo tmutil enable localsnapshot
