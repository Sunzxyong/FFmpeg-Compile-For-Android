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
--disable-asm \
--enable-pic \
--enable-strip \
--host=x86-linux \
--cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
--sysroot=$SYSROOT

make clean
make
make install
}

build_x86

