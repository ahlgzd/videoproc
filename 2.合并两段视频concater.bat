@echo off
:: ���÷�����cuter ����1 ����2 
:: ����˵��������1: ��һ����Ƶ�ļ�, ����2: �ڶ�����Ƶ�ļ�
:: ������converter d:\videos2019\00056.mp4
:: ahlgzd,2019-06-16

if "%1"==""  goto :input

SET filelist=%1
SET filelist=%filelist:~0,-4%
ffmpeg -f concat -safe 0 -i %1 -c copy %filelist%.mp4

goto :end

:input
set/p sourcefile1=�������һ����Ƶ�ļ��������س���
set/p sourcefile2=������ڶ�����Ƶ�ļ��������س���
SET filename=%sourcefile1:~0,-4%_���ո�.mp4

ffmpeg -i %sourcefile1% -c copy -bsf:v h264_mp4toannexb -f mpegts input1.ts
ffmpeg -i %sourcefile2% -c copy -bsf:v h264_mp4toannexb -f mpegts input2.ts
ffmpeg -i "concat:input1.ts|input2.ts" -c copy -bsf:a aac_adtstoasc -movflags +faststart %filename%

del input1.ts
del input2.ts

:end
pause