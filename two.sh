#!/bin/bash

# 等待 livenvr 完全启动
echo "Waiting for livenvr to start..."
while ! curl -s http://192.168.0.56:10800 > /dev/null; do
    sleep 2
done

# 推流逻辑
echo "Starting stream..."
ffmpeg \
-thread_queue_size 1024  \
-f v4l2 -framerate 30 -video_size 640x480 -i /dev/video2 \
-c:v libx264 -preset veryfast -maxrate 1000k -bufsize 1500k -pix_fmt yuv420p -g 15 \
-f flv rtmp://127.0.0.1:10935/live/live102 \
-progress /home/pc/progress2.log -nostats

echo "two,done"
