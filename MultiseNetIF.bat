@ECHO OFF
ECHO.
ECHO. Copyright(c) 2016-2100.   jielong_lin.   All rights reserved.
ECHO. Multise Network Routes Selector For PhilipsTV work 
ECHO.

CLS

MODE con: COLS=30 lines=15

REM color 9d

GOTO MENU

:MENU

ECHO.
ECHO. =====����·������=====
ECHO.
ECHO. ID : Description
ECHO. ---------------------
ECHO. 1  : ����: (����ר��)
ECHO.
ECHO. 2  : ����
ECHO.
ECHO. 3  : �˳�
ECHO.
ECHO. ======================
ECHO.
set ID=%1%

if "%id%"=="1" goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

exit

REM PAUSE

:cmd1

ECHO.
ECHO.
ECHO.
ECHO. ��������...����...
ECHO.

ROUTE DELETE 0.0.0.0
REM  ROUTE ADD 0.0.0.0 MASK 0.0.0.0 <gateway>
ROUTE ADD    0.0.0.0 MASK 0.0.0.0 192.168.1.1
ECHO.
ECHO.
ECHO. �������...����...
ECHO.

REM PAUSE
exit



:cmd2

ECHO.
ECHO.
ECHO.
ECHO. ��������...����...
ECHO.

ROUTE DELETE 0.0.0.0
REM  ROUTE ADD 0.0.0.0 MASK 0.0.0.0 <gateway>
ROUTE ADD    0.0.0.0 MASK 0.0.0.0 172.20.27.254 
ECHO.
ECHO.
ECHO. �������...����...
ECHO.

REM PAUSE
exit



:cmd3

ECHO.
exit

