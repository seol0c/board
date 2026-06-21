@echo off
cd /d "%~dp0"
echo.
echo ===== board sync =====
echo.
echo [1/2] pull from github ...
git pull
echo.
echo [2/2] push my changes ...
git add -A
git commit -m "update %date% %time%"
git push
echo.
echo Done. Open https://seol0c.github.io/board/ after 1-2 min.
timeout /t 2 >nul
