#!/usr/bin/env bash
FIREFOX_HOME=$HOME/.mozilla/firefox
PROFILE_DIR=$FIREFOX_HOME/rtctest.profile

if [ -f ./firefox-prefs.js ]; then
  rm -rf $PROFILE_DIR
  mkdir -p $PROFILE_DIR
  cp ./firefox-prefs.js $PROFILE_DIR/prefs.js
fi
# printf "{\n\"created\": $(date +%s%N | cut -b1-13)\n}" > $PROFILE_DIR/times.json

AUDIODEV=null firefox -profile $PROFILE_DIR $@