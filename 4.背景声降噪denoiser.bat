@echo off
:: 调用方法：denoiser 参数1 参数2 参数3
:: 参数说明：参数1: 要降噪的文件, 参数2: 噪声文件, 参数3: 最终视频文件
:: 举例：
:: ahlgzd,2019-06-21

ffmpeg.exe -i 要降噪的文件.mp4 -an -qscale 0 要降噪的文件_源视频.mp4
ffmpeg.exe -i 要降噪的文件.mp4 -vn 要降噪的文件_源音频.wav

ffmpeg -i 噪声文件.mp4 -vn -ss 3 -t 1 噪声文件_1秒音频.wav

sox 噪声文件_1秒音频.wav -n noiseprof 噪音样本.prof
sox 要降噪的文件_源音频.wav 要降噪的文件_去噪后.wav noisered 噪音样本.prof 0.21
ffmpeg.exe -i 要降噪的文件_去噪后.wav -i 要降噪的文件_源视频.mp4 最终视频文件.mp4
