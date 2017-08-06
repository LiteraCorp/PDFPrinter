@echo off

if exist .\__history\NUL goto 1
goto end

:1
cd __history
del *.~*
cd..
rd __history

:end

