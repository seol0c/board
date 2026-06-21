@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo === board 게시판 깃허브 동기화 ===
echo.
git add -A
git commit -m "update %date% %time%"
git push
echo.
echo 완료! 1~2분 뒤 https://seol0c.github.io/board/ 에 반영됩니다.
echo.
pause
