xcopy "LUT\" "%ProgramData%\Blackmagic Design\DaVinci Resolve\Support\LUT\"
xcopy "IDT\" "%AppData%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\IDT\"

if errorlevel 0 goto success
:success
msg "%username%" Transforms installed successfully!
goto exit

if not errorlevel 0 goto fail
msg "%username%" Transform installation failed! Please install manually.
goto exit

:exit