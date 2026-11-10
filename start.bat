
@echo off
title Portable AI Launcher
color 0A

cls
echo =====================================
echo        PORTABLE AI LAUNCHER
echo =====================================
echo.
echo  [1] Browser Chat
echo  [2] AnythingLLM
echo.

set /p choice=Select option (1/2): 

:: =========================
:: BROWSER
:: =========================
if "%choice%"=="1" (
    start "" "%~dp0Windows\start-fast-chat.bat"
    goto :close
)

:: =========================
:: ANYTHINGLLM
:: =========================
if "%choice%"=="2" (

    set "OLLAMA_MODELS=%~dp0Shared\models\ollama_data"
    set "ANYTHING_LLM_HOME=%~dp0Shared\anythingllm_data"

    start "" "%~dp0Shared\bin\ollama-windows.exe" serve
    timeout /t 2 >nul

    start "" "%~dp0Shared\anythingllm\AnythingLLM.exe"
    goto :close
)

:: =========================
:: CLOSE CLEANLY
:: =========================
:close
exit