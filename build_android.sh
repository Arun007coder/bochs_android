#!/bin/sh

SCROOT=~/bochs/
ZIPDIR="$SCROOT"/ZIPS/
TOOLDIR="$SCROOT"/TOOLS/

mkdir "$SCROOT" "$ZIPDIR" "$TOOLDIR"

# download android ndk
init_android_ndk() {
    wget -O "$ZIPDIR"/ANNDK.zip https://dl.google.com/android/repository/android-ndk-r27c-linux.zip
    unzip "$ZIPDIR"/ANNDK.zip -d "$TOOLDIR"/andk/
    echo "Android NDK unzipped"
}

# download platform sdk tools
init_android_sdk() {
    wget -O "$ZIPDIR"/ANPTOOLS.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
    unzip "$ZIPDIR"/ANPTOOLS.zip -d "$TOOLDIR"/asdk_tools/
    echo "Android platform tools unzipped"

    
}
