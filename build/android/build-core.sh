#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`
SDL_PATH=~/androidsdl
BOCHS_PATH=~/work/bochs_android

if [ \! -d bochs/bochs ] ; then
   ln -s "$BOCHS_PATH" bochs
fi

if [ \! -d "$SDL_PATH"/project/jni/application/bochs ] ; then
   ln -s "$BOCHS_PATH"/build/android/bochs "$SDL_PATH"/project/jni/application
fi

cd "$SDL_PATH"
./build.sh bochs
mv project/app/build/outputs/apk/release/app-release.apk "$BOCHS_PATH"/build/android/bochs-core-debug.apk
cd "$BOCHS_PATH"/build/android
