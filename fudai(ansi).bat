@echo off
echo 脚本名称[抖音自动抽福袋]
echo 作者[ChenLockyer]
echo 创建日期[2025/4/16]
echo.

:input_time
set /p "remaining_time=请输入福袋剩余时间（秒）: "

rem 如果剩余时间 <=60秒，直接进入循环
if %remaining_time% LEQ 60 (
    echo 剩余时间 ≤60秒，立即开始抽奖...
    goto loop
)

rem 计算等待时间（剩余时间 - 60秒）
set /a wait_time=%remaining_time% - 60
echo 等待 %wait_time% 秒后开始抽奖...
timeout /t %wait_time% /nobreak >nul

:loop
echo 福袋剩余约60秒，开始抽奖...
echo 当前时间: %time%

rem 点击福袋坐标1
adb -s 46HDU19319003167 shell input tap 203.8 412.7
echo 点击：203.8 412.7 (福袋坐标1)

rem 点击福袋坐标2
rem 等待1s
timeout /t 1 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 100 412.7
echo 点击：100 412.7 (福袋坐标2)

rem 3秒后点击“确定抽奖”
timeout /t 3 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 571.5 2127.1
echo 点击：571.5 2127.1 (确定抽奖)

rem 55秒后关闭弹窗（总共60秒）
timeout /t 55 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 554.5 1278.4
echo 点击：554.5 1278.4 (关闭弹窗)

timeout /t 1 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 536 1660
echo 点击：536 1660 (关闭弹窗)

echo 本轮抽奖完成！

rem 等待9分钟后继续抽奖
timeout /t 540 /nobreak >nul
goto loop