@echo off
echo "This script create by satou 20220826"
set arg=%*
set arg=%arg:J:\=\\isilon-nas\tomotoon\%

@echo off
setlocal enabledelayedexpansion

set args=%*
set arr.length=0

if #!args!==# goto :usage

for %%I in ("%args: =" "%") do (
    set val=%%I
    set arr[!arr.length!]=!val:"=!
    set /a arr.length=!arr.length! + 1
)

@REM echo arr[] has a length of %arr.length%.

set /a arr.Ubound=%arr.length% - 1
set targetFile = ""
for /L %%I in (0, 1, %arr.Ubound%) do (
    echo !arr[%%I]!|find "output" >nul
    if not errorlevel 1 (
      set /a idx=%%I+1
    )
    if %%I == !idx! (
      
      @REM for %%F in (!arr[%%I]!) do (
      @REM   echo %%~nxF
      @REM   echo F| xcopy /s !arr[%%I]! %temp%\%%~nxF
      @REM   @REM I:/script/bin/td/tools/opensource/ImageMagick-6.8.9-Q16/ffmpeg.exe  -i %temp%\%%~nxF -qscale 0 %temp%\%%~nxF:~0,-4!.mp4
      @REM   I:/script/bin/td/tools/ffmpeg-master-latest-win64-gpl-shared/bin/ffmpeg.exe -i %temp%\%%~nxF -qscale 0 %temp%\%%~nxF:~0,-4!.mp4
      @REM )
      @REM I:/script/bin/td/tools/opensource/ImageMagick-6.8.9-Q16/ffmpeg.exe  -i !arr[%%I]! -qscale 0 !arr[%%I]:~0,-4!.mp4
      
      @REM IF EXIST !arr[%%I]:~0,-4!.mp4 (
      @REM   echo !arr[%%I]:~0,-4!.mp4
      @REM   del !arr[%%I]:~0,-4!.mp4
      @REM )

      I:/script/bin/td/tools/ffmpeg-master-latest-win64-gpl-shared/bin/ffmpeg.exe  -i !arr[%%I]! -qscale 0 !arr[%%I]:~0,-4!.mp4
      
      goto :EOF
    )
)