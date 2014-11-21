#!/bin/bash
# Checks on the last time maintenance was noted.
# Created by Ben Bass
# vers="maintchck-0.1"
# Copyright 2014 Ben Bass. All rights reserved.


#check if the plist is there.  If not, return 0.
if [ ! -e /usr/local/munki/maclab.plist ]; then
	configured=0
else
	configured=1
fi
maint_raw_ct="0"
maint_count="0"
maint_last=""
maint_last_date=""
maint_first_date=""
maint_first=""

if [ $configured -eq 1 ]; then
	maint_raw_ct="$(/usr/libexec/PlistBuddy -c "Print :maintenance" /usr/local/munki/maclab.plist | wc -l | sed -e 's/^[ \t]*//')"
	((maint_count= "$maint_raw_ct" - 2 ))
	maint_last_date="$(/usr/libexec/PlistBuddy -c "Print :maintenance" /usr/local/munki/maclab.plist | grep ":" | tail -n1 | sed -e 's/^[ \t]*//')"
	maint_first_date="$( /usr/libexec/PlistBuddy -c "Print :maintenance" /usr/local/munki/maclab.plist | grep ":" | head -1 | sed -e 's/^[ \t]*//')"
	maint_last=`date -j -f "%a %b %d %T %Z %Y" "$maint_last_date" +%s 2>/dev/null`
	maint_first=`date -j -f "%a %b %d %T %Z %Y" "$maint_first_date" +%s 2>/dev/null`

fi

#echo to std out.
echo "maintenance_configured=$configured"
echo "maintenance_count=$maint_count"
echo "maintenance_last_date=$maint_last_date"
echo "maintenance_first_date=$maint_first_date"
echo "maintenance_last=$maint_last"
echo "maintenance_first=$maint_first"
exit 0