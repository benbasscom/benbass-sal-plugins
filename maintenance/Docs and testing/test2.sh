#!/bin/bash

lastsnapshotdate=`/usr/libexec/PlistBuddy -c "Print :Destinations:0:SnapshotDates" /Library/Preferences/com.apple.TimeMachine.plist | grep ":" | tail -n1 | sed 's/^ *//g'`
lastsnapshot=`date -j -f "%a %b %d %T %Z %Y" "$lastsnapshotdate" +%s 2>/dev/null`

echo "$lastsnapshot"