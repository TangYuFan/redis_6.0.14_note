
::查询6379端口占用  netstat -ano | findstr 6379
::清除pid进程 taskkill -f /pid 26308

@echo off
setlocal enabledelayedexpansion
set port=6379
for /f "tokens=1-5" %%a in ('netstat -ano ^| find ":%port%"') do (
    if "%%e%" == "" (
        set pid=%%d
    ) else (
        set pid=%%e
    )
    taskkill /f /pid !pid!
)

