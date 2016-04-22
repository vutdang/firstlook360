#!/bin/sh
trap '^C' SIGHUP SIGINT SIGTERM SIGQUIT

/home/root/bin/ffmpeg/ffmpeg -thread_queue_size 512 -s 160x120 -f video4linux2 -input_format mjpeg -thread_queue_size 512 -i /dev/video0 -s 160x120 -f video4linux2 -input_format mjpeg -i /dev/video1 -filter_complex "nullsrc=size=320x120 [base]; [0:v] setpts=PTS-STARTPTS, scale=160x120 [left]; [1:v] setpts=PTS-STARTPTS, scale=160x120 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=160" -f mpeg1video \
http://127.0.0.1:8082 
#/home/root/bin/ffmpeg/ffmpeg -s 640x360 -f video4linux2 -i /dev/video0 -s 640x360 -f video4linux2 -i /dev/video1 -filter_complex "nullsrc=size=1280x360 [base]; [0:v] setpts=PTS-STARTPTS, scale=640x360 [left]; [1:v] setpts=PTS-STARTPTS, scale=640x360 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=640" -c:v mpeg1video -b:v 100k -r 30 http://127.0.0.1:8082
