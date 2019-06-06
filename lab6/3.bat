net start > services.txt

net stop dnscache

timeout 5
net start > services_new.txt

call compare_services.bat

net start dnscache
pause