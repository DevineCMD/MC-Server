@echo off
:loop
git pull >nul 2>&1
timeout 2 >nul 2>&1
goto loop