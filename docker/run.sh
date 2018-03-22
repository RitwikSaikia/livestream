#!/bin/sh

nvidia-docker run $@ -it ffmpeg_encoder_cuda
