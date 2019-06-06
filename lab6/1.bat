set lab6dir=C:\LAB6
set testdir=C:\LAB6\TEST
set all=C:\LAB6\all.txt

mkdir %lab6dir%
wmic os get Caption, FreePhysicalMemory, TotalVisibleMemorySize > %lab6dir%\os.txt
wmic logicaldisk get name,description > %lab6dir%\logicaldisk.txt

mkdir %testdir%
copy /y %lab6dir%\* %testdir%\*

copy /y %lab6dir%\* %all%
del /Q  C:\LAB6\os.txt C:\LAB6\logicaldisk.txt C:\LAB6\TEST\os.txt  C:\LAB6\TEST\logicaldisk.txt
pause