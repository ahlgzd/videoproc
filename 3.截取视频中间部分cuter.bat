@echo off
:: 调用方法：cuter 参数1 参数2 参数3
:: 参数说明：参数1: 要剪切的文件, 参数2: 起始秒数, 参数3: 持续秒数
:: 举例：converter d:\videos2019\00056.mp4
:: ahlgzd,2019-06-16

if "%1"==""  goto :input

SET filename=%1
SET filename=%filename:~0,-4%

ffmpeg -ss %2  -t %3  -accurate_seek  -i %1 -vcodec copy -acodec copy -avoid_negative_ts 1  %filename%_cutted.mp4
goto:end

:input
set/p sourcefile=请输入要剪切的文件名并按回车：
SET filename=%sourcefile%
SET filename=%filename:~0,-4%
set/p start=请输入起始秒数并按回车：
set/p duration=请输入截取的时长（秒）并按回车：
ffmpeg -ss %start%  -t %duration%  -accurate_seek  -i %sourcefile% -vcodec copy -acodec copy -avoid_negative_ts 1  %filename%_cutted.mp4

:end
pause