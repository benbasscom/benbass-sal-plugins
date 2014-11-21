#!/bin/bash
# Checks on the last time maintenance was noted, and type.
# Created by Ben Bass
# vers="maintchck-0.1"
# Copyright 2014 Ben Bass. All rights reserved.



maint_raw_ct="$(/usr/libexec/PlistBuddy -c "Print :maintenance" /usr/local/munki/maclab.plist | wc -l | sed -e 's/^[ \t]*//')"
((maint_count= "$maint_raw_ct" - 2 ))
maint_last="$(/usr/libexec/PlistBuddy -c "Print :maintenance" /usr/local/munki/maclab.plist | grep ":" | tail -n1 | sed -e 's/^[ \t]*//')"

echo "$maint_count"
echo "$maint_last"

exit 0