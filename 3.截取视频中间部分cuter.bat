@echo off
:: ���÷�����cuter ����1 ����2 ����3
:: ����˵��������1: Ҫ���е��ļ�, ����2: ��ʼ����, ����3: ��������
:: ������converter d:\videos2019\00056.mp4
:: ahlgzd,2019-06-16

if "%1"==""  goto :input

SET filename=%1
SET filename=%filename:~0,-4%

ffmpeg -ss %2  -t %3  -accurate_seek  -i %1 -vcodec copy -acodec copy -avoid_negative_ts 1  %filename%_cutted.mp4
goto:end

:input
set/p sourcefile=������Ҫ���е��ļ��������س���
SET filename=%sourcefile%
SET filename=%filename:~0,-4%
set/p start=��������ʼ���������س���
set/p duration=�������ȡ��ʱ�����룩�����س���
ffmpeg -ss %start%  -t %duration%  -accurate_seek  -i %sourcefile% -vcodec copy -acodec copy -avoid_negative_ts 1  %filename%_cutted.mp4

:end
pause