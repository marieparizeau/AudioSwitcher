setlocal
cd /d %~dp0
start powershell.exe -noprofile -executionpolicy bypass -file ".\AudioSwitcher.ps1"