@echo off
echo �ű�����[�����Զ��鸣��]
echo ����[ChenLockyer]
echo ��������[2025/4/16]
echo.

:input_time
set /p "remaining_time=�����븣��ʣ��ʱ�䣨�룩: "

rem ���ʣ��ʱ�� <=60�룬ֱ�ӽ���ѭ��
if %remaining_time% LEQ 60 (
    echo ʣ��ʱ�� ��60�룬������ʼ�齱...
    goto loop
)

rem ����ȴ�ʱ�䣨ʣ��ʱ�� - 60�룩
set /a wait_time=%remaining_time% - 60
echo �ȴ� %wait_time% ���ʼ�齱...
timeout /t %wait_time% /nobreak >nul

:loop
echo ����ʣ��Լ60�룬��ʼ�齱...
echo ��ǰʱ��: %time%

rem �����������1
adb -s 46HDU19319003167 shell input tap 203.8 412.7
echo �����203.8 412.7 (��������1)

rem �����������2
rem �ȴ�1s
timeout /t 1 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 100 412.7
echo �����100 412.7 (��������2)

rem 3�������ȷ���齱��
timeout /t 3 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 571.5 2127.1
echo �����571.5 2127.1 (ȷ���齱)

rem 55���رյ������ܹ�60�룩
timeout /t 55 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 554.5 1278.4
echo �����554.5 1278.4 (�رյ���)

timeout /t 1 /nobreak >nul
adb -s 46HDU19319003167 shell input tap 536 1660
echo �����536 1660 (�رյ���)

echo ���ֳ齱��ɣ�

rem �ȴ�9���Ӻ�����齱
timeout /t 540 /nobreak >nul
goto loop