#!/usr/bin/env bash
FIREFOX_HOME=$HOME/.mozilla/firefox
PROFILE_DIR=$FIREFOX_HOME/test.profile

rm -rf $PROFILE_DIR
mkdir -p $PROFILE_DIR
cp ./firefox-prefs.js $PROFILE_DIR/prefs.js
printf "{\n\"created\": $(date +%s%N | cut -b1-13)\n}" > $PROFILE_DIR/times.json
printf "[Profile0]\nName=test\nIsRelative=0\nPath=test.profile\nDefault=1" > $FIREFOX_HOME/profiles.ini
# touch $PROFILE_DIR/.parentlock

firefox -profile test $@