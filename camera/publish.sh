#!/bin/sh

input=test.mp4
input=rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov

ffmpeg -i $input -f avi - | tee /tmp/live-debug.avi | nc localhost 5050

