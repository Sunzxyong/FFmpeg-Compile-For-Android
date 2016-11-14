#!/bin/bash

NDK=$HOME/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=arm
PREFIX=$(pwd)/android/$CPU

function build_arm
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-asm \
--enable-pic \
--enable-strip \
--host=arm-linux \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--sysroot=$SYSROOT

make clean
make
make install
}

build_arm

