@echo off
:: ���÷�����converter ����1 ����2
:: ����˵��������1��Դ�ļ��У�����2��Ŀ���ļ���
:: ������converter E:\2019��ѧ����������Ƶ�������� d:\videos2019
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
set/p sourcefolder=������Դ�ļ��в����س���
set work_path=%sourcefolder%
%sourcefolder:~0,2%
set PATH=%~dp0
set/p destfolder=������Ŀ���ļ��в����س���
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