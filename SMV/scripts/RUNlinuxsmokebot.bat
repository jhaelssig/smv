@echo off
Title Packaging test Smokeview for 32 bit Linux


Rem  Windows batch file to package a test Linux Smokeview

Rem setup environment variables (defining where repository resides etc) 

set envfile="%userprofile%"\fds_smv_env.bat
IF EXIST %envfile% GOTO endif_envexist
echo ***Fatal error.  The environment setup file %envfile% does not exist. 
echo Create a file named %envfile% and use SMV/scripts/fds_smv_env_template.bat
echo as an example.
echo.
echo Aborting now...
pause>NUL
goto:eof

:endif_envexist

call %envfile%

%svn_drive%
cd %svn_root%\smv\scripts

set scriptdir=FDS-SMV/SMV/scripts
set bundledir=FDS-SMV/SMV/for_bundle

echo Running smokebot
plink %svn_logon% %scriptdir%/RUNsmokebot.csh 

pause