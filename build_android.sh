#!/bin/sh

SCROOT=~/bochs/
ZIPDIR="$SCROOT"/ZIPS/
TOOLDIR="$SCROOT"/TOOLS/

ANDROID_HOME="$TOOLDIR"/SDK/
export ANDROID_NDK_HOME="$TOOLDIR"/andk/
export PATH=$ANDROID_NDK_HOME:$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/build-tools/27.0.3:$PATH
 

mkdir "$SCROOT" "$ZIPDIR" "$TOOLDIR"

# download android ndk
init_android_ndk() {
    wget -q -O "$ZIPDIR"/ANNDK.zip https://dl.google.com/android/repository/android-ndk-r27c-linux.zip
    unzip -q "$ZIPDIR"/ANNDK.zip -d "$TOOLDIR"/andk/
    echo "Android NDK unzipped"
}

# download platform sdk tools
init_android_sdk() {
    wget -q -O "$ZIPDIR"/ANTOOLS.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
    unzip -q "$ZIPDIR"/ANTOOLS.zip -d "$TOOLDIR"/SDK
    echo "Android platform tools unzipped"
    "$TOLDIR"/SDK/cmdline-tools/bin/sdkmanager --sdk_root="$ANDROID_HOME" "platforms;android-25" "build-tools;27.0.3" "platform-tools"
    yes | "$TOOLDIR"/SDK/cmdline-tools/bin/sdkmanager --licenses
    "$TOOLDIR"/SDK/cmdline-tools/bin/sdkmanager update
}

# install prerequisite packages
install_prerequisite() {
    sudo apt-get install openjdk-8-jdk
    sudo apt-get install ant
	sudo apt-get install make
	sudo apt-get install g++
	sudo apt-get install git-core
 }

clone_required_repos() {
    git clone git://github.com/pelya/commandergenius androidsdl
}

install_prerequisite
init_android_ndk
init_android_sdk
clone_required_repos

ls
cd build/android
ls
./build-all.sh
