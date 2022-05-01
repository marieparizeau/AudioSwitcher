setlocal
cd /d %~dp0
start powershell.exe -noprofile -executionpolicy bypass -WindowStyle Hidden -file ".\SwitchToVr.ps1" 