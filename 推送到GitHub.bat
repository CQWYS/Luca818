@echo off
chcp 65001 >nul
echo 正在推送到 GitHub，请稍候...
cd /d "C:\Users\10076\Desktop\portfolio2"
set GCM_GUI_PROMPT=1
git push -u origin main
echo.
echo 如果上方显示 main -> main，说明推送成功！
pause
