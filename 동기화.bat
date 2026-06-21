@echo off
cd /d "%~dp0"
echo.
echo ===== board sync =====
echo.
echo [1/3] pull from github ...
git pull
echo.
echo [2/3] build posts list ...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$f = Get-ChildItem 'posts' -File | ? { $_.Name -ne 'posts.json' -and -not $_.Name.StartsWith('.') } | %% { [pscustomobject]@{ name=$_.Name; size=$_.Length } }; $j = if ($f) { ConvertTo-Json @($f) -Compress } else { '[]' }; Set-Content -Path 'posts/posts.json' -Value $j -Encoding utf8"
echo.
echo [3/3] push my changes ...
git add -A
git commit -m "update %date% %time%"
git push
echo.
echo Done. Open https://seol0c.github.io/board/ after 1-2 min.
timeout /t 2 >nul
