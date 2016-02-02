@echo off & setlocal enabledelayedexpansion

if [%1]==[] goto help
if [%1]==[/?] goto help

REM can't support %^!&
set str=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890()_`[]\',./{}:"<>?;+-~@#$*=
set len=%1
for /l %%a in (1 1 %len%) do (
        if [%2]==[/s] ( 
            set /a n=!random!%%89
        ) else (
            set /a n=!random!%%61
        )
        REM call echo !n!  = %%str:~!n!,1%%
        call set a=!a!%%str:~!n!,1%%
)
echo %a%
goto :EOF

:help
    echo Random string generator, v1.0
    echo Copyright 2015-2016, Kingron Lu^<kingron@163.com^>
    echo This is free software; There is NO warranty.
    echo.
    echo Usage: %~n0 [length] [/s]
    echo.
    echo   /s       Include special charater
    echo.
    
:end
