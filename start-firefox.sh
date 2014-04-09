#!/usr/bin/env bash
FIREFOX_HOME=$HOME/.mozilla/firefox
PROFILE_DIR=$FIREFOX_HOME/rtctest.profile

rm -rf $PROFILE_DIR
mkdir -p $PROFILE_DIR
cp ./firefox-prefs.js $PROFILE_DIR/prefs.js
# printf "{\n\"created\": $(date +%s%N | cut -b1-13)\n}" > $PROFILE_DIR/times.json

firefox -profile $PROFILE_DIR $@