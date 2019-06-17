@echo off
:: 调用方法：cuter 参数1 参数2 
:: 参数说明：参数1: 第一个视频文件, 参数2: 第二个视频文件
:: 举例：converter d:\videos2019\00056.mp4
:: ahlgzd,2019-06-16

if "%1"==""  goto :input

SET filelist=%1
SET filelist=%filelist:~0,-4%
ffmpeg -f concat -safe 0 -i %1 -c copy %filelist%.mp4

goto :end

:input
set/p sourcefile1=请输入第一个视频文件名并按回车：
set/p sourcefile2=请输入第二个视频文件名并按回车：
SET filename=%sourcefile1:~0,-4%_最终稿.mp4

ffmpeg -i %sourcefile1% -c copy -bsf:v h264_mp4toannexb -f mpegts input1.ts
ffmpeg -i %sourcefile2% -c copy -bsf:v h264_mp4toannexb -f mpegts input2.ts
ffmpeg -i "concat:input1.ts|input2.ts" -c copy -bsf:a aac_adtstoasc -movflags +faststart %filename%

del input1.ts
del input2.ts

:end
pause