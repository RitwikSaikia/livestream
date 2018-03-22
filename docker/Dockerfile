FROM nvidia/cuda:9.0-devel-ubuntu16.04

RUN apt-get -y update
RUN apt-get -y install \
        autoconf \
        automake \
        build-essential \
        cmake \
        git \
        libass-dev \
        libfreetype6-dev \
        libsdl2-dev \
        libtheora-dev \
        libtool \
        libva-dev \
        libvdpau-dev \
        libvorbis-dev \
        libxcb1-dev \
        libxcb-shm0-dev \
        libxcb-xfixes0-dev \
        mercurial \
        pkg-config \
        texinfo \
        wget \
        zlib1g-dev \
        git


RUN apt-get -y install yasm libx264-dev libx265-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev

RUN cd /tmp \
        && git clone https://git.ffmpeg.org/ffmpeg.git


RUN cd /tmp \
        && git clone https://github.com/FFmpeg/nv-codec-headers.git \
        && cd nv-codec-headers && make && make install \
        && rm -rf /tmp/nv-codec-headers

RUN cd /tmp/ffmpeg \
        && git checkout release/3.4 \
        && git checkout -b release-3.4 \
        && ./configure --extra-cflags=-I/usr/local/cuda-9.0/include --extra-ldflags=-L/usr/local/cuda-9.0/lib64 \
        --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp \
        --enable-gpl --enable-libass --enable-libfdk-aac --enable-libfreetype \
        --enable-libmp3lame --enable-libopus --enable-libtheora \
        --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 \
        && make && make install \
        && rm -rf /tmp/ffmpeg

RUN apt-get clean

RUN mkdir -p /video
WORKDIR /video

