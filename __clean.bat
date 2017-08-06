@echo off
del *.dsk
del *.dcu
del *.ddp
del *.drc
del *.identcache
del *.local
del *.~*
del *.backup*
del *.backup_*
del *.cbk

if exist .\DCU\NUL goto 1
goto end

:1
cd dcu
del *.dsk
del *.dcu
del *.ddp
del *.drc
del *.identcache
del *.local
del *.~*
cd..

:end

