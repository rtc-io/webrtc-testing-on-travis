#!/usr/bin/env bash
FIREFOX_HOME=$HOME/.mozilla/firefox

if [ -f ./firefox-prefs.js ]; then
  rm -rf $FIREFOX_HOME/*.integration-test
  firefox --no-remote -CreateProfile integration-test
  cp ./firefox-prefs.js $FIREFOX_HOME/*.integration-test/prefs.js
fi
# printf "{\n\"created\": $(date +%s%N | cut -b1-13)\n}" > $PROFILE_DIR/times.json

firefox --no-remote -profile integration-test $@