@pushd "%~dp0" >nul 2>&1
mode con cols=80 lines=27
@echo off
color f0
title ������˹ϵͳ www.ilyuu.com ���ѣ�ѡ��Ҫ��װ��ϵͳ���������кż��ɡ�
echo.
echo.
echo.================================================================================
echo.                    ��ѡ��Ҫ��װ��ϵͳ�������������кż��ɡ�
echo.================================================================================
echo.
echo.
echo.                         [1]  =  Windows10 (64λרҵ��)
echo.
echo.
echo.                         [2]  =  Windows11 (64λרҵ��)
echo.
echo.
echo.                         [3]  =  Windows7 (64λ�콢��)
echo.
echo.
echo.                         [4]  =  �رճ���
echo.
echo.
echo.================================================================================
choice /C:1234 /N /M "����Ҫ��װ��ѡ�����к� : "
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
msg * "���棺7������CPUӲ����֧��WIN7ϵͳ�������޷��ֱ棬��ô�ͼ򵥵�16���Ժ���ĵ��������ǱʼǱ�������װ�ܿ��ܲ�֧�ֻᰲװ���ɹ��������رգ������ȷ�����ϵ�����ô�����ˡ�"
exit

:EXIT
echo EXIT >select.txt
exit