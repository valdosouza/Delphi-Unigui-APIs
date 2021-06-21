@echo off
cls
echo. Esse arquivo bat server para fazer a limpeza de arquivos gerados pelo Delphi.
echo. Este arquivo foi baixado do site www.dicasdelphi.com.br
echo. 25/03/2015
rem *----------------------------------------------------------------------------*
echo. ---------------------------------------------------------------------------
echo.
echo.              Deletando todos os DCU, ~??, bak, exe, db                                 
echo.
echo.              Pressione qualquer TECLA para continuar...                                
echo. ----------------------------------------------------------------------------
echo.
pause 
del *.dcu /s
del *.~?? /s
del *.bak /s
rem del *.exe /s
rem del *.res /s
del *.__* /s
del __recovery\*.* /s
del *.local /s
del *.identcache /s
del *.stat /s
pause