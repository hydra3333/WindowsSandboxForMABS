@echo on

REM
REM    <MappedFolder>
REM      <HostFolder>D:\VM\MABS</HostFolder>
REM      <SandboxFolder>C:\HOST_MABS</SandboxFolder>
REM      <ReadOnly>false</ReadOnly>
REM    </MappedFolder>
REM

mkdir C:\MABS
mkdir C:\TEMP

REM Create a .bat to Download MABS and extract it onto the sandbox system
set "f=%USERPROFILE%\Desktop\000-RUNME_init_mabs.bat"
DEL "%f%">NUL 2>&1
echo @ECHO ON >> "%f%"
echo mkdir C:\MABS >> "%f%"
echo mkdir C:\TEMP >> "%f%"
echo CD C:\TEMP >> "%f%"
echo REM download and extract MABS >> "%f%"
echo curl -L --verbose --output "C:\TEMP\media-autobuild_suite-master.zip" https://github.com/m-ab-s/media-autobuild_suite/archive/master.zip >> "%f%"
echo powershell -NoLogo -ExecutionPolicy Unrestricted -Sta -NonInteractive -WindowStyle Normal -command "Expand-Archive -Force -LiteralPath 'C:\TEMP\media-autobuild_suite-master.zip' -DestinationPath C:\TEMP" >> "%f%"
echo xcopy C:\TEMP\media-autobuild_suite-master\*.* C:\MABS\ /e /v /f /h /r /y >> "%f%"
REM echo REM create our own copy of vscode freom the host system onto the sandbox system >> "%f%"
REM echo mkdir C:\SOFTWARE\vscode >> "%f%"
REM echo xcopy C:\HOST_SOFTWARE\vscode\*.* C:\SOFTWARE\vscode\ /e /v /f /h /r /y >> "%f%"
echo pause >> "%f%"
echo goto :eof >> "%f%"

REM Create a .bat to save the results of runnng MABS in the sandbox system onto the host system
set "f=%USERPROFILE%\Desktop\111-SAVE_mabs.bat"
DEL "%f%">NUL 2>&1
echo @ECHO ON >> "%f%"
echo REM THE FOLLOWING IS TO SAVE MABS EXEs back to the non-sandbox host>> "%f%"
echo xcopy C:\MABS\local64\bin-audio\*.*  C:\HOST_MABS\local64\bin-audio\  /e /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\local64\bin-global\*.* C:\HOST_MABS\local64\bin-global\ /e /v /f /h /r /y >> "%f%"
echo copy /Y /B /Z C:\MABS\local64\bin-video\ffmpeg.exe C:\MABS\local64\bin-video\ffmpeg_OpenCL.exe >> "%f%"
echo copy /Y /B /Z C:\MABS\local64\bin-video\ffprobe.exe C:\MABS\local64\bin-video\ffprobe_OpenCL.exe >> "%f%"
echo xcopy C:\MABS\local64\bin-video\*.*  C:\HOST_MABS\local64\bin-video\  /e /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\local64\bin-video\*.*  C:\HOST_MABS\exe_x64_py\ /e /v /f /h /r /y >> "%f%" >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-audio\fdkaac.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-audio\flac.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-audio\lame.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-audio\sox.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-global\cwebp.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-global\dwebp.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-global\webpinfo.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo copy /Y /B /Z  C:\MABS\local64\bin-global\webpmux.exe C:\HOST_MABS\exe_x64_py\ >> "%f%"
echo REM save our ini files etc back to the non-sandbox host >> "%f%"
echo REM save everything to _save in the non-sandbox host " >> "%f%"
echo del /f /s /q C:\HOST_MABS\_save\*.*  >> "%f%"
echo REM xcopy C:\MABS\*.*  C:\HOST_MABS\_save\ /e /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\*.bat        C:\HOST_MABS\_save\       /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\build\*.txt  C:\HOST_MABS\_save\build\ /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\build\*.ini  C:\HOST_MABS\_save\build\ /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\build\*.log  C:\HOST_MABS\_save\build\ /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\build\*.sh   C:\HOST_MABS\_save\build\ /v /f /h /r /y >> "%f%"
echo xcopy C:\MABS\build\*.bat  C:\HOST_MABS\_save\build\ /v /f /h /r /y >> "%f%"
echo xcopy "%USERPROFILE%\Desktop\*.bat" C:\HOST_MABS\_save\Desktop\ /v /f /h /r /y >> "%f%"
echo pause >> "%f%"
echo goto :eof >> "%f%"

REM Create a link on the sandbox desktop which is mapped to our read-only SOFTWARE folder on the host system
REM which contains our set of downloaded software that we use all the time. ie make it available in the sandbox.
set create_shortcut_SCRIPT="%TEMP%\create_HOST_software_desktop_link_%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
del %create_shortcut_SCRIPT%
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %create_shortcut_SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\HOST software.lnk" >> %create_shortcut_SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %create_shortcut_SCRIPT%
echo oLink.TargetPath = "C:\host_software\" >> %create_shortcut_SCRIPT%
echo oLink.Arguments = "" >> %create_shortcut_SCRIPT%
echo oLink.Description = "HOST software" >> %create_shortcut_SCRIPT%
echo 'oLink.HotKey = "" >> %create_shortcut_SCRIPT%
echo 'oLink.IconLocation = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WindowStyle = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WorkingDirectory = "" >> %create_shortcut_SCRIPT%
echo oLink.Save >> %create_shortcut_SCRIPT%
cscript /nologo %create_shortcut_SCRIPT%
del %create_shortcut_SCRIPT%

REM Create a link on the sandbox desktop which is mapped to the local copy of vscode on the sandbox
REM set create_shortcut_SCRIPT="%TEMP%\create_vscode_desktop_link_%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
REM del %create_shortcut_SCRIPT%
REM echo Set oWS = WScript.CreateObject("WScript.Shell") >> %create_shortcut_SCRIPT%
REM echo sLinkFile = "%USERPROFILE%\Desktop\VScode.lnk" >> %create_shortcut_SCRIPT%
REM echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %create_shortcut_SCRIPT%
REM echo oLink.TargetPath = "C:\software\vscode\Code.exe" >> %create_shortcut_SCRIPT%
REM echo oLink.Arguments = "" >> %create_shortcut_SCRIPT%
REM echo oLink.Description = "VScode" >> %create_shortcut_SCRIPT%
REM echo 'oLink.HotKey = "" >> %create_shortcut_SCRIPT%
REM echo 'oLink.IconLocation = "" >> %create_shortcut_SCRIPT%
REM echo 'oLink.WindowStyle = "" >> %create_shortcut_SCRIPT%
REM echo 'oLink.WorkingDirectory = "" >> %create_shortcut_SCRIPT%
REM echo oLink.Save >> %create_shortcut_SCRIPT%
REM cscript /nologo %create_shortcut_SCRIPT%
REM del %create_shortcut_SCRIPT%

REM Create a link on the sandbox desktop which is mapped to our read-write MABS folder on the host system
REM which is where we will eventually copy the results of running MABS. i.e. the newly built ffmpeg.exe etc
set create_shortcut_SCRIPT="%TEMP%\create_HOST_MABS_desktop_link_%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
del %create_shortcut_SCRIPT%
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %create_shortcut_SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\HOST MABS.lnk" >> %create_shortcut_SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %create_shortcut_SCRIPT%
echo oLink.TargetPath = "C:\HOST_MABS\" >> %create_shortcut_SCRIPT%
echo oLink.Arguments = "" >> %create_shortcut_SCRIPT%
echo oLink.Description = "HOST MABS" >> %create_shortcut_SCRIPT%
echo 'oLink.HotKey = "" >> %create_shortcut_SCRIPT%
echo 'oLink.IconLocation = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WindowStyle = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WorkingDirectory = "" >> %create_shortcut_SCRIPT%
echo oLink.Save >> %create_shortcut_SCRIPT%
cscript /nologo %create_shortcut_SCRIPT%
del %create_shortcut_SCRIPT%

REM Create a link on the sandbox desktop which is mapped to the folder in which we build MABS in the local sandbox system
set create_shortcut_SCRIPT="%TEMP%\create_MABS_desktop_link_%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
del %create_shortcut_SCRIPT%
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %create_shortcut_SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\MABS.lnk" >> %create_shortcut_SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %create_shortcut_SCRIPT%
echo oLink.TargetPath = "C:\MABS\" >> %create_shortcut_SCRIPT%
echo oLink.Arguments = "" >> %create_shortcut_SCRIPT%
echo oLink.Description = "MABS" >> %create_shortcut_SCRIPT%
echo 'oLink.HotKey = "" >> %create_shortcut_SCRIPT%
echo 'oLink.IconLocation = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WindowStyle = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WorkingDirectory = "" >> %create_shortcut_SCRIPT%
echo oLink.Save >> %create_shortcut_SCRIPT%
cscript /nologo %create_shortcut_SCRIPT%
del %create_shortcut_SCRIPT%

REM Create a link on the sandbox desktop which is mapped to a local TEMP folder in the local sandbox system
set create_shortcut_SCRIPT="%TEMP%\create_TEMP_desktop_link_%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
del %create_shortcut_SCRIPT%
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %create_shortcut_SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\TEMP.lnk" >> %create_shortcut_SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %create_shortcut_SCRIPT%
echo oLink.TargetPath = "C:\TEMP\" >> %create_shortcut_SCRIPT%
echo oLink.Arguments = "" >> %create_shortcut_SCRIPT%
echo oLink.Description = "TEMP" >> %create_shortcut_SCRIPT%
echo 'oLink.HotKey = "" >> %create_shortcut_SCRIPT%
echo 'oLink.IconLocation = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WindowStyle = "" >> %create_shortcut_SCRIPT%
echo 'oLink.WorkingDirectory = "" >> %create_shortcut_SCRIPT%
echo oLink.Save >> %create_shortcut_SCRIPT%
cscript /nologo %create_shortcut_SCRIPT%
del %create_shortcut_SCRIPT%

REM change explorer View settings to be as we like them
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V AlwaysShowMenus /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V SeparateProcess /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V NavPaneExpandToCurrentFolder /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V NavPaneShowAllFolders /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V HideFileExt /T REG_DWORD /D 00000000 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V Hidden /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V ShowSuperHidden /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V ShowEncryptCompressedColor /T REG_DWORD /D 00000001 /F
REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V ShowStatusBar /T REG_DWORD /D 00000001 /F

REM add "Edit with Notepad++" to right click context pop-up
REM ... Notepad++ is located in the host's SOFTWARE\NPP folder
set fnpp="C:\TEMP\EDIT_WITH_NPP.REG"
del %fnpp%
ECHO Windows Registry Editor Version 5.00                     > %fnpp%
ECHO.                                                        >> %fnpp%
ECHO [HKEY_CLASSES_ROOT\*\shell\Edit with Notepad++]         >> %fnpp%
REM ECHO "Icon"="C:\\SOFTWARE\\NPP\\notepad++.exe"
ECHO "Icon"="C:\\HOST_SOFTWARE\\NPP\\notepad++.exe"               >> %fnpp%
ECHO [HKEY_CLASSES_ROOT\*\shell\Edit with Notepad++\command] >> %fnpp%
REM ECHO @="\"C:\\SOFTWARE\\NPP\\notepad++.exe\" \"%%1\""
ECHO @="\"C:\\HOST_SOFTWARE\\NPP\\notepad++.exe\" \"%%1\""        >> %fnpp%
regedit /s %fnpp%

REM restart explorer so that eveything appears including on the desktop
taskkill /f /im explorer.exe
start explorer.exe

REM start an explorer window at the specified directory
explorer.exe "C:\MABS\"


goto :eof
