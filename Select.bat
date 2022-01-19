@pushd "%~dp0" >nul 2>&1
mode con cols=80 lines=27
@echo off
color f0
title 【艾瑞斯系统 www.ilyuu.com 提醒：选择要安装的系统，输入序列号即可】
echo.
echo.
echo.================================================================================
echo.                    【选择要安装的系统，输入下列序列号即可】
echo.================================================================================
echo.
echo.
echo.                         [1]  =  Windows10 (64位专业版)
echo.
echo.
echo.                         [2]  =  Windows11 (64位专业版)
echo.
echo.
echo.                         [3]  =  Windows7 (64位旗舰版)
echo.
echo.
echo.                         [4]  =  关闭程序
echo.
echo.
echo.================================================================================
choice /C:1234 /N /M "输入要安装的选项序列号 : "
if errorlevel 4 goto :EXIT
if errorlevel 3 goto :WIN7
if errorlevel 2 goto :WIN11
if errorlevel 1 goto :WIN10

:WIN10
echo WIN10 >select.txt
exit

:WIN11
echo WIN11 >select.txt
exit

:WIN7
echo WIN7 >select.txt
msg * "警告：7代以上CPU硬件不支持WIN7系统，如你无法分辨，那么就简单点16年以后购买的电脑尤其是笔记本不建议装很可能不支持会安装不成功请立即关闭；如果你确认是老电脑那么随意了。"
exit

:EXIT
echo EXIT >select.txt
exit