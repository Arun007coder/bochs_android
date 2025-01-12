#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

SDL_PATH=~/androidsdl
BOCHS_PATH=~/bochs_android

if [ \! -d BochsLauncher/bochsApp/src ] ; then
   ln -s "$SDL_PATH"/project/src BochsLauncher/bochsApp/src
fi

if [ \! -d BochsLauncher/bochsApp/res ] ; then
   ln -s "$SDL_PATH"/project/res BochsLauncher/bochsApp/res
fi

if [ \! -d BochsLauncher/app/src/main/jniLibs ] ; then
   ln -s "$SDL_PATH"/project/libs BochsLauncher/app/src/main/jniLibs
fi

cd BochsLauncher
./gradlew assembleDebug --warning-mode all
mv app/build/outputs/apk/debug/app-debug.apk ../bochs-debug.apk
cd ..
