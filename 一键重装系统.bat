@echo off
title www.ilyuu.com OS Reinstall Download Tool
mode con cols=60 lines=28
color f0
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit


:EditFile
md "%Temp%\OS-REINSTALL" >nul 2>&1
::attrib +s +a +h +r %Temp%\OS-REINSTALL >nul 2>&1
del /f /q "%Temp%\OS-REINSTALL\*" >nul 2>&1
echo.
echo.==========正在下载重装系统所需的组件数据，请等待。==========

:Aria2c.exe
certutil -urlcache -split -f http://ys-f.ysepan.com/620269630/318498979/g655238753MN8IUhjstxc9/Aria2c.exe %Temp%\OS-REINSTALL\Aria2c.exe >nul 2>&1
echo.
echo.=================== Aria2c.exe 下载完成！

:UpdateDownload.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498986/g655238753MNJFlknmQo6e/UpdateDownload.txt %Temp%\OS-REINSTALL\UpdateDownload.txt >nul 2>&1
echo.
echo.=================== UpdateDownload.txt 下载完成！

:DrvCeoDownload.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498980/g655238753MN8JlknmQo51/DrvCeoDownload.txt %Temp%\OS-REINSTALL\DrvCeoDownload.txt >nul 2>&1
echo.
echo.=================== DrvCeoDownload.txt 下载完成！

:PEx1Download.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498982/g655238753MNJ1lknmQo46/PEx2Download.txt %Temp%\OS-REINSTALL\PEx1Download.txt >nul 2>&1
echo.
echo.=================== PEx1Download.txt 下载完成！

:PEx2Download.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498982/g655238753MNJ1lknmQo46/PEx2Download.txt %Temp%\OS-REINSTALL\PEx2Download.txt >nul 2>&1
echo.
echo.=================== PEx2Download.txt 下载完成！

:WIN10Download.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269633/318498988/lknmQoj571377545LPFIb1/WIN10Download.txt %Temp%\OS-REINSTALL\WIN10Download.txt >nul 2>&1
echo.
echo.=================== WIN10Download.txt 下载完成！

:WIN11Download.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269633/318498989/lknmQoj571377545LPFJ71/WIN11Download.txt %Temp%\OS-REINSTALL\WIN11Download.txt >nul 2>&1
echo.
echo.=================== WIN11Download.txt 下载完成！

:WIN7Download.txt
certutil -urlcache -split -f http://ys-f.ysepan.com/620269633/318498987/lknmQoj571377545LPFHc9/WIN7Download.txt %Temp%\OS-REINSTALL\WIN7Download.txt >nul 2>&1
echo.
echo.=================== WIN7Download.txt 下载完成！
:Select.bat
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498983/g655238753MNJ2Uhjstx80/Select.bat %Temp%\OS-REINSTALL\Select.bat >nul 2>&1
echo.
echo.=================== Select.bat 下载完成！

:Start.bat
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498984/g655238753MNJ3Uhjstx98/Start.bat %Temp%\OS-REINSTALL\Start.bat >nul 2>&1
echo.
echo.=================== Start.bat 下载完成！

:Start.vbs
certutil -urlcache -split -f http://ys-f.ysepan.com/620269632/318498985/g655238753MNJ4Uhjstx08/Start.vbs %Temp%\OS-REINSTALL\Start.vbs >nul 2>&1
echo.
echo.=================== Start.vbs 下载完成！

ping localhost -n 2 > nul

:Check

:Aria2c
if exist %Temp%\OS-REINSTALL\Aria2c.exe (goto UpdateDownload) else (goto Update)
:UpdateDownload
if exist %Temp%\OS-REINSTALL\UpdateDownload.txt (goto DrvCeoDownload) else (goto Update)
:DrvCeoDownload
if exist %Temp%\OS-REINSTALL\DrvCeoDownload.txt (goto PEx1Download) else (goto Update)
:PEx1Download
if exist %Temp%\OS-REINSTALL\PEx1Download.txt (goto PEx2Download) else (goto Update)
:PEx2Download
if exist %Temp%\OS-REINSTALL\PEx2Download.txt (goto WIN10Download) else (goto Update)
:WIN10Download
if exist %Temp%\OS-REINSTALL\WIN10Download.txt (goto WIN11Download) else (goto Update)
:WIN11Download
if exist %Temp%\OS-REINSTALL\WIN11Download.txt (goto WIN7Download) else (goto Update)
:WIN7Download
if exist %Temp%\OS-REINSTALL\WIN7Download.txt (goto Selectbat) else (goto Update)
:Selectbat
if exist %Temp%\OS-REINSTALL\Select.bat (goto Startbat) else (goto Update)
:Startbat
if exist %Temp%\OS-REINSTALL\Start.bat (goto Startvbs) else (goto Update)
:Startvbs
if exist %Temp%\OS-REINSTALL\Start.vbs (goto Start) else (goto Update)

:Update
mshta vbscript:msgbox("程序检测到已发现新版本,请至www.ilyuu.com下载最新版本使用！",16+4096,"艾瑞斯系统www.ilyuu.com 提醒：")(window.close)
exit


:Start
start %Temp%\OS-REINSTALL\Start.vbs

exit




