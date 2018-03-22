#!/bin/sh

input="-i test.mp4"
input="-i pipe:0"

output=live
rm -f $output/*

time=1
codec="-c:a aac -ar 48000 -b:a 128k -c:v h264 -crf 20 -g 48 -keyint_min 48 -sc_threshold 0 -hls_playlist_type vod -err_detect ignore_err"

mkdir -p $output
cp playlist.m3u8.template $output/playlist.m3u8

nc -l localhost 5050 | ffmpeg -hide_banner -y $input \
  $codec -vf scale=w=640:h=360:force_original_aspect_ratio=decrease -b:v 800k -maxrate 856k -bufsize 1200k -b:a 96k -f ssegment -segment_list $output/360p.m3u8 -segment_list_flags +live -segment_time $time $output/360p_%04d.ts \
#  $codec -vf scale=w=842:h=480:force_original_aspect_ratio=decrease -b:v 1400k -maxrate 1498k -bufsize 2100k -b:a 128k -f ssegment -segment_list $output/480p.m3u8 -segment_list_flags +live -segment_time $time $output/480p_%04d.ts \
#  $codec -vf scale=w=1280:h=720:force_original_aspect_ratio=decrease -b:v 2800k -maxrate 2996k -bufsize 4200k -b:a 128k -f ssegment -segment_list $output/720p.m3u8 -segment_list_flags +live -segment_time $time $output/720p_%04d.ts \
#  $codec -vf scale=w=1920:h=1080:force_original_aspect_ratio=decrease -b:v 5000k -maxrate 5350k -bufsize 7500k -b:a 192k -f ssegment -segment_list $output/1080p.m3u8 -segment_list_flags +live -segment_time $time $output/1080p_%04d.ts \
