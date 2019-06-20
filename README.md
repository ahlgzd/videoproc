# videoproc
比赛音视频处理

# 使用方法
## 环境准备
1.点击右上角绿色“clone or download”按钮，下载脚本。

2.下载FFmpeg，Windows Builds（https://ffmpeg.zeranoe.com/builds/）。

3.下载SoX，Windows Builds（https://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2-win32.zip/download）。

4.将ffmpeg.exe、ffprobe.exe、ffplay.exe等文件复制到脚本文件夹。

## 视频处理
1.转换：双击批处理文件，按要求输入源文件夹、目标文件夹。

2.合并：双击批处理文件，输入第一个视频文件和第二个视频文件。

3.剪切：双击批处理文件，输入源视频文件，开设点和持续时间（单位：秒）。

## 音频处理
1.降噪：双击批处理文件，选取噪音文件、源文件。（待完成。。。）

# 日志
2019.6.18

剪切前几秒时发生不准确的现象，seek关键帧+MPEG4的包装问题。解决的方法是：

先合并两段MTS，然后剪切，最后合并。

2019.6.16

1.转换文件夹下的所有视频

2.合并两段视频

3.截取视频中间部分

# 其它选择
1.Shotcut：Shotcut is a free, open source, cross-platform video editor.

https://www.fosshub.com/Shotcut.html?dwl=shotcut-win64-190615.zip

2.HitFilm  Express：Video editing, VFX, and all the power you need to make something cool. Take your first step towards becoming a pro filmmaker with our free starter software: HitFilm Express. Perfect for beginners, film students, and YouTubers.

https://fxhome.com/hitfilm-express#download
