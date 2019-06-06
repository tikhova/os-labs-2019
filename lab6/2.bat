echo %computername%
echo xcopy /Z /I C:\cd\cpp.djvu \\DESKTOP-2CL77UV\d$\temp > copy.bat
schtasks /create /F /K /SC minute /DU 00:02 /TN schCopyOs /TR D:\YandexDisk\ITMO\year2018\os-labs-2019\lab6\copy.bat
pause
