#!/bin/bash

NDK=$HOME/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=arm
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS=""
ADDI_LDFLAGS=""

function build_arm
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
    --enable-gpl \
    --enable-libx264 \
    --enable-yasm \
    --extra-cflags="-I../x264/android/arm/include" \
    --extra-ldflags="-L../x264/android/arm/lib" \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

build_arm

# optional
# --disable-avdevice
# --disable-everything(custom component options,such as encoder\decoder...)
# --enable-decoder=h264
# --enable-decoder=aac
