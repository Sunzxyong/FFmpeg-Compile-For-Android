#!/bin/bash

NDK=$HOME/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-14/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64

CPU=x86
PREFIX=$(pwd)/android/$CPU

function build_x86
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-symver \
--enable-avresample \
--enable-small \
--enable-jni \
--cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
--target-os=linux \
--arch=x86 \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

build_x86
