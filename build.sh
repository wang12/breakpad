#!/bin/bash

CUR_DIR="$( cd "$(dirname "$0")" ; pwd -P  )"
OUTPUT_DIR=${CUR_DIR}/libs

if [ ! -d ${OUTPUT_DIR} ]; then
    mkdir ${OUTPUT_DIR}  
fi
BUILD=arm-linux-androideabi


export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH
export NDK=/home/xuxiaoguang/android-ndk-r10d
export TOOLCHAINS=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64
export CC=$TOOLCHAINS/bin/${BUILD}-gcc
export CPP=$TOOLCHAINS/bin/${BUILD}-gcc
export CXX=$TOOLCHAINS/bin/${BUILD}-g++
export AR=$TOOLCHAINS/bin/${BUILD}-ar
export STRIP=$TOOLCHAINS/bin/${BUILD}-strip
export CXXFLAGS="-fPIC -g -O2 -Wall -Wno-unknown-pragmas -ffunction-sections -fdata-sections -std=c++11"


rm -rf build/
mkdir build
cd build

../breakpad/configure --prefix="${OUTPUT_DIR}" --host=android

make 
