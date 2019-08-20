@echo off
title run streaming process
echo run ws server 
start /min node ws.js 8081 8082
echo run http server
start /min node http.js 
echo run ffmpeg process
REM start ffmpeg -re -i test.mp4 -f mpegts tcp://127.0.0.1:8081
REM start ffmpeg -i test.mp4 -movflags isml+frag_keyframe -f mp4 -vcodec copy tcp://127.0.0.1:8081

REM start ffmpeg -f avfoundation -i test.mp4 -c:a aac -ab 64k -c:v libx264 -vb 448k -vsync 2 -pix_fmt yuv420p -profile:v high -f mp4 -movflags frag_keyframe+default_base_moof -reset_timestamps 1 -frag_duration 70000 tcp://localhost:8081/

start ffmpeg -stream_loop -1 -i test.mp4 -c:a aac -ab 64k -c:v libx264 -vb 448k -vsync 2 -pix_fmt yuv420p -profile:v high -f mp4 -movflags frag_keyframe+default_base_moof -reset_timestamps 1 -frag_duration 70000 tcp://localhost:8081/

echo launch browser
start chrome --new-window http://localhost:8000/public
REM start firefox -new-instance http://localhost:8000/public
pause