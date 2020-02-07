@echo off
cd /D %~dp0
pwsh -executionpolicy bypass -noexit -command ".\lspci.ps1 %*"