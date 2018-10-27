#!/bin/bash

pack_id=$(cat package.json | grep '"name": "' | sed 's/.*: "//gi' |  sed 's/".*//gi');
echo "pack_id: [$pack_id]";

cordova build

echo "adb uninstall $pack_id";
adb uninstall $pack_id

adb install ./platforms/android/app/build/outputs/apk/debug/app-debug.apk

adb logcat
