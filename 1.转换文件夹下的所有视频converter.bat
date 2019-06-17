@echo off
:: 调用方法：converter 参数1 参数2
:: 参数说明：参数1：源文件夹，参数2：目标文件夹
:: 举例：converter E:\2019教学能力大赛视频备赛材料 d:\videos2019
:: ahlgzd,2019-06-16


if "%1"==""  goto :input

set work_path=%1
set PATH=%~dp0

%~d1
cd %work_path%
if not exist "%2" md  "%2"

for /r %%i in (*.MTS) do (
echo "%%i"
if not exist "%2%%~pi" (
md  "%2%%~pi" 
)
ffmpeg -i %%i -acodec aac -ab 128k -vcodec libx264  -b:v 1200k -r 25 -s 1280x720   %2\%%~pni.mp4
)
goto :end

:input
set/p sourcefolder=请输入源文件夹并按回车：
set work_path=%sourcefolder%
%sourcefolder:~0,2%
set PATH=%~dp0
set/p destfolder=请输入目标文件夹并按回车：
if not exist "%destfolder%" md  "%destfolder%"

cd %work_path%
for /r %%i in (*.MTS) do (
echo "%%i"
set destPath="%destfolder%%%~pi"
if not exist "%destfolder%%%~pi" md  "%destfolder%%%~pi" 
ffmpeg -i %%i -acodec aac -ab 128k -vcodec libx264  -b:v 1200k -r 25 -s 1280x720   %destfolder%%%~pni.mp4
)

:end
cd %PATH%
pause 