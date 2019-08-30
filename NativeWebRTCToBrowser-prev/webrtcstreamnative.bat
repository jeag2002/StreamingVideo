@echo off
title "execute webstreamer"
echo "run app server"
start "" node d:\workspaces\workWebRTC\WebRTCNative\libsourcey\src\webrtc\samples\webrtcstreamer\client\app.js
echo "run browser"
REM start firefox -new-instance http://localhost:4499
start chrome --new-window http://localhost:4499
echo "run webrtc server"
call d:\workspaces\workWebRTC\WebRTCNative\webrtcserver.bat
pause