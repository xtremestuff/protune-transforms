xcopy "LUT\" "%ProgramData%\Blackmagic Design\DaVinci Resolve\Support\LUT\" /s
xcopy "IDT\" "%AppData%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\IDT\"
xcopy "ODT\" "%AppData%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\ODT\"

if errorlevel 0 goto success
:success
msg "%username%" Transforms installed successfully!
goto exit

if not errorlevel 0 goto fail
msg "%username%" Transform installation failed! Please install manually.
goto exit

:exit