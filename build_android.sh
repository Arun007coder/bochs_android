#!/bin/sh

SCROOT=~/bochs/
ZIPDIR="$SCROOT"/ZIPS/
TOOLDIR="$SCROOT"/TOOLS/

mkdir "$SCROOT" "$ZIPDIR" "$TOOLDIR"

# download android ndk
wget -O "$ZIPDIR"/ANNDK.zip https://dl.google.com/android/repository/android-ndk-r27c-linux.zip

# download platform sdk tools
wget -O "$ZIPDIR"/ANPTOOLS.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
