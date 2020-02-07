@echo off
cd /D %~dp0
pwsh -executionpolicy bypass -noexit -command ".\update.ps1"