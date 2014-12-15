#!/bin/bash
# Checks on the last time maintenance was noted, and how often. More info to come later
# Created by Ben Bass
vers="maintchck-0.1"
# Copyright 2014 Ben Bass. All rights reserved.

#Enter time in UTC. That seems to get the time right.
defaults write /usr/local/munki/maclab.plist maintenance -array-add -date $(date -u +"%Y-%m-%dT%H:%M:%SZ")

exit 0