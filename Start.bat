@pushd "%~dp0" >nul 2>&1
@echo off
setlocal enabledelayedexpansion

:START
set Vbscript=Msgbox("��ȷ�Ϲرհ�ȫɱ����������ʹ�á�"^&vbCrLf^&"�����ȷ�������Զ���ȡ���ݲ�ִ�б�����",1+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set "MsHtaReturnValue=%%a"
set ReturnValue1=ȷ��
set ReturnValue2=ȡ����رմ���
if %MsHtaReturnValue% == 1 goto Check
if %MsHtaReturnValue% == 2 goto EXIT

:Check
msg * /time:2 "���ڼ�������ϵͳ���л��������Ժ�"

:Network
ping -n 1 baidu.com
if errorlevel == 0 goto Update
if errorlevel == 1 goto NONetwork

:NONetwork
mshta vbscript:msgbox("����������Ҫ���磬������û�и�ʲô���ټ���",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:Update
del /f /q Update.txt
Aria2c.exe --allow-overwrite=true -i UpdateDownload.txt
ping localhost -n 2 > nul
if exist Update.txt (goto Version) else (goto UpdateAgain)
:UpdateAgain
Aria2c.exe --allow-overwrite=true -i UpdateDownload.txt
ping localhost -n 2 > nul
if exist Update.txt (goto Version) else (goto NOUpdate)
:Version
find /I "V32" Update.txt
IF %ERRORLEVEL% EQU 0 goto diskD
IF %ERRORLEVEL% EQU 1 goto NOUpdate

:NOUpdate
mshta vbscript:msgbox("�����⵽�ѷ����°汾,����www.ilyuu.com�������°汾ʹ�ã�",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:diskD
if exist D: (goto SPACExC) else (goto NOdiskD)

:NOdiskD
mshta vbscript:msgbox("û�м�⵽D�̴��ڣ������޷��洢��װ�ļ������С�",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:SPACExC
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk %SystemDrive% get FreeSpace/value') do set fsize=%%a
set fsize=%fsize:~0,-10%
if %fsize% gtr 1 (goto SPACExD) else (goto NOSPACE)

:SPACExD
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk D: get FreeSpace/value') do set fsize=%%a
set fsize=%fsize:~0,-10%
if %fsize% gtr 5 (goto RAM) else (goto NOSPACE)

:NOSPACE
mshta vbscript:msgbox("����ʣ��ռ䲻��,C��ʣ��ռ�>2G,D��ʣ��ռ�>6G,��������ڳ��ԡ�",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:RAM
for /f "tokens=2 delims==" %%a in ('wmic os get totalvisiblememorysize/value') do set rom=%%a
set rom=%rom:~0,-6%
if %rom% gtr 30 (goto SELECT) else (goto NORAM)

:NORAM
mshta vbscript:msgbox("��⵽�ڴ���4G��û��,��ô�����ó�檰첻������",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit


:SELECT
del /f /q select.txt
echo Y|start /wait Select.bat
ping localhost -n 2 > nul
if exist select.txt (goto SELECTEXIT) else (goto NOselect)

:SELECTEXIT
find /I "EXIT" select.txt
IF %ERRORLEVEL% EQU 0 goto EXIT
IF %ERRORLEVEL% EQU 1 goto EditFile

:NOselect
mshta vbscript:msgbox("û��ִ��ѡ�񣬹ر���ѡ�񴰿ڱ�����Ҳ�����˳���",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:EditFile
md "%SystemDrive%\PEfile"
attrib +s +a +h +r %SystemDrive%\PEfile
del /f /q "%SystemDrive%\PEfile\*"
md "D:\OSfile"
del /f /q "D:\OSfile\*"
ping localhost -n 3 > nul

:Powercfg
Powercfg -x -monitor-timeout-ac 0
Powercfg -x -monitor-timeout-dc 0
powercfg -x -standby-timeout-ac 0
powercfg -x -standby-timeout-dc 0

:DrvCeo
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe -s 8 -x 8 --allow-overwrite=true -d D:\OSfile -i DrvCeoDownload.txt
ping localhost -n 3 > nul
if exist D:\OSfile\�����ܲ�������.exe.aria2 (goto EXITDownload) else (goto PEDownload)

:PEDownload
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe --allow-overwrite=true -d %SystemDrive%\PEfile -i PEx1Download.txt
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe -s 8 -x 8 --allow-overwrite=true -d %SystemDrive%\PEfile -i PEx2Download.txt
ping localhost -n 3 > nul
if exist %SystemDrive%\PEfile\10PEx64.wim.aria2 (goto EXITDownload) else (goto BOOTSDI)

:BOOTSDI
msg * /time:3 "���ں�̨У�������ص��ļ����ݣ�"
CertUtil -hashfile %SystemDrive%\PEfile\BOOT.SDI SHA1 >BOOT.SDI.txt
ping localhost -n 2 > nul
find /I "c8f481c93682c181a36fa8bbadd1cc71918f13c7" BOOT.SDI.txt
IF %ERRORLEVEL% EQU 0 goto 10PEX64WIM
find /I "c8 f4 81 c9 36 82 c1 81 a3 6f a8 bb ad d1 cc 71 91 8f 13 c7" BOOT.SDI.txt
IF %ERRORLEVEL% EQU 0 goto 10PEX64WIM
IF %ERRORLEVEL% EQU 1 goto PEERROR

:10PEX64WIM
CertUtil -hashfile %SystemDrive%\PEfile\10PEx64.wim SHA1 >10PEx64.wim.txt
ping localhost -n 2 > nul
find /I "ac73ebd3065e067f0596957e8f7343610c2b3ac0" 10PEx64.wim.txt
IF %ERRORLEVEL% EQU 0 goto READSELECT
find /I "ac 73 eb d3 06 5e 06 7f 05 96 95 7e 8f 73 43 61 0c 2b 3a c0" 10PEx64.wim.txt
IF %ERRORLEVEL% EQU 0 goto READSELECT
IF %ERRORLEVEL% EQU 1 goto PEERROR

:PEERROR
set Vbscript=Msgbox("PE�ļ����ݲ�������δ������ɡ�"^&vbCrLf^&"�����ȷ�������ٴ�ִ��PE���س���"^&vbCrLf^&"�����ȡ�������رձ�����,�������������г���",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set "MsHtaReturnValue=%%a"
set ReturnValue1=ȷ��
set ReturnValue2=ȡ����رմ���
if %MsHtaReturnValue% == 1 goto PEDownload
if %MsHtaReturnValue% == 2 goto EXIT

:EXITDownload
mshta vbscript:msgbox("���س���ǿ�йرգ�������Ҳ����������",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")(window.close)
exit

:READSELECT
find /I "WIN10" select.txt
IF %ERRORLEVEL% EQU 0 goto WIN10Download
find /I "WIN11" select.txt
IF %ERRORLEVEL% EQU 0 goto WIN11Download
find /I "WIN7" select.txt
IF %ERRORLEVEL% EQU 0 goto WIN7Download
find /I "EXIT" select.txt
IF %ERRORLEVEL% EQU 0 goto EXIT

:WIN10Download
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe -s 8 -x 8 --allow-overwrite=true -d D:\OSfile -i WIN10Download.txt
ping localhost -n 3 > nul
if exist D:\OSfile\install.esd.aria2 (goto EXITDownload) else (goto WIN10SHA1)

:WIN10SHA1
msg * /time:5 "���ں�̨У�������ص��ļ����ݣ�"
CertUtil -hashfile D:\OSfile\install.esd SHA1 >install.esd.txt
ping localhost -n 2 > nul
find /I "9c8b1fcb4b61126af5a1016d0bd2bce083112d3c" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
find /I "9c 8b 1f cb 4b 61 12 6a f5 a1 01 6d 0b d2 bc e0 83 11 2d 3c" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
IF %ERRORLEVEL% EQU 1 goto OSERROR

:WIN11Download
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe -s 8 -x 8 --allow-overwrite=true -d D:\OSfile -i WIN11Download.txt
ping localhost -n 3 > nul
if exist D:\OSfile\install.esd.aria2 (goto EXITDownload) else (goto WIN11SHA1)

:WIN11SHA1
msg * /time:5 "���ں�̨У�������ص��ļ����ݣ�"
CertUtil -hashfile D:\OSfile\install.esd SHA1 >install.esd.txt
ping localhost -n 2 > nul
find /I "5652a32fb840fff402098970788f48d61e112277" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
find /I "56 52 a3 2f b8 40 ff f4 02 09 89 70 78 8f 48 d6 1e 11 22 77" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
IF %ERRORLEVEL% EQU 1 goto OSERROR

:WIN7Download
echo Y|start "���������������������������������������ļ��У�����رձ����ڣ�����˹ϵͳwww.ilyuu.com������������������������������" /wait Aria2c.exe -s 8 -x 8 --allow-overwrite=true -d D:\OSfile -i WIN7Download.txt
ping localhost -n 3 > nul
if exist D:\OSfile\install.esd.aria2 (goto EXITDownload) else (goto WIN7SHA1)

:WIN7SHA1
msg * /time:5 "���ں�̨У�������ص��ļ����ݣ�"
CertUtil -hashfile D:\OSfile\install.esd SHA1 >install.esd.txt
ping localhost -n 2 > nul
find /I "ee573f48627886fbc54b329a0a17e5f3b6541aae" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
find /I "ee 57 3f 48 62 78 86 fb c5 4b 32 9a 0a 17 e5 f3 b6 54 1a ae" install.esd.txt
IF %ERRORLEVEL% EQU 0 goto BOOT
IF %ERRORLEVEL% EQU 1 goto OSERROR


:OSERROR
set Vbscript=Msgbox("ϵͳ�ļ����ݲ�������δ������ɡ�"^&vbCrLf^&"�����ȷ�������ٴ�ִ��ϵͳ���س���"^&vbCrLf^&"�����ȡ�������رձ�����,�������������г���",16+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set "MsHtaReturnValue=%%a"
set ReturnValue1=ȷ��
set ReturnValue2=ȡ����رմ���
if %MsHtaReturnValue% == 1 goto READSELECT
if %MsHtaReturnValue% == 2 goto EXIT

:BOOT
bcdedit >boot.txt
ping localhost -n 2 > nul
find /I "\Windows\system32\winload.exe" boot.txt
IF %ERRORLEVEL% EQU 0 goto MBR
IF %ERRORLEVEL% EQU 1 goto GPT

:MBR
set id1={%time:~6,2%%time:~9,2%9ae2-251d-4c33-8124-1f8b578d028b}
set id2={%time:~6,2%%time:~9,2%a46a-0e56-4c0e-8fd2-2602b93a3dd3}
bcdedit /create %id2% /d "Reinstall System" /device
bcdedit /set %id2% ramdisksdidevice partition=%SystemDrive%
bcdedit /set %id2% ramdisksdipath "\PEfile\BOOT.SDI"
bcdedit /create %id1% /d "Reinstall System" /application osloader
bcdedit /set %id1% device ramdisk="[%SystemDrive%]\PEfile\10PEx64.wim",%id2%
bcdedit /set %id1% osdevice ramdisk="[%SystemDrive%]\PEfile\10PEx64.wim",%id2%
bcdedit /set %id1% path \Windows\system32\boot\winload.exe
bcdedit /set %id1% description "Reinstall System"
bcdedit /set %id1% locale zh-CN
bcdedit /set %id1% inherit {bootloadersettings}
bcdedit /set %id1% systemroot \windows
bcdedit /set %id1% detecthal Yes
bcdedit /set %id1% winpe Yes
bcdedit /set %id1% ems no
bcdedit /displayorder %id1% /addlast
bcdedit /bootsequence %id1%
bcdedit /timeout 3
shutdown -r -t 10
set Vbscript=Msgbox("������������������������ִ����ɡ�������������������"^&vbCrLf^&"����10����Զ����������밲װ����"^&vbCrLf^&"�����ȷ�������������������밲װ���衣"^&vbCrLf^&"�����ȡ�����Կɺ����ֶ��������밲װ���衣",1+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set "MsHtaReturnValue=%%a"
set ReturnValue1=ȷ��
set ReturnValue2=ȡ����رմ���
if %MsHtaReturnValue% == 1 goto shutdown
if %MsHtaReturnValue% == 2 goto EXIT

:GPT
set id1={%time:~6,2%%time:~9,2%9ae2-251d-4c33-8124-1f8b578d028b}
set id2={%time:~6,2%%time:~9,2%a46a-0e56-4c0e-8fd2-2602b93a3dd3}
bcdedit /create %id2% /d "Reinstall System" /device
bcdedit /set %id2% ramdisksdidevice partition=%SystemDrive%
bcdedit /set %id2% ramdisksdipath "\PEfile\BOOT.SDI"
bcdedit /create %id1% /d "Reinstall System" /application osloader
bcdedit /set %id1% device ramdisk="[%SystemDrive%]\PEfile\10PEx64.wim",%id2%
bcdedit /set %id1% osdevice ramdisk="[%SystemDrive%]\PEfile\10PEx64.wim",%id2%
bcdedit /set %id1% path \Windows\system32\boot\winload.efi
bcdedit /set %id1% description "Reinstall System"
bcdedit /set %id1% locale zh-CN
bcdedit /set %id1% inherit {bootloadersettings}
bcdedit /set %id1% systemroot \windows
bcdedit /set %id1% detecthal Yes
bcdedit /set %id1% winpe Yes
bcdedit /set %id1% ems no
bcdedit /displayorder %id1% /addlast
bcdedit /bootsequence %id1%
bcdedit /timeout 3
shutdown -r -t 10
set Vbscript=Msgbox("������������������������ִ����ɡ�������������������"^&vbCrLf^&"����10����Զ����������밲װ����"^&vbCrLf^&"�����ȷ�������������������밲װ���衣"^&vbCrLf^&"�����ȡ�����Կɺ����ֶ��������밲װ���衣",1+4096,"����˹ϵͳwww.ilyuu.com ���ѣ�")
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set "MsHtaReturnValue=%%a"
set ReturnValue1=ȷ��
set ReturnValue2=ȡ����رմ���
if %MsHtaReturnValue% == 1 goto shutdown
if %MsHtaReturnValue% == 2 goto EXIT

:EXIT
shutdown -a
exit

:shutdown
shutdown -a
shutdown -r -t 0
exit
