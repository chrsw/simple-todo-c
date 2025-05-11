@echo off
chcp 65001 >nul
title Todo
echo Building Todo Application...

where gcc >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: GCC not found!
    echo Please install MinGW and add it to your PATH
    pause
    exit /b 1
)

if not exist bin mkdir bin

echo Compiling sources...
@echo on
gcc src/main.c src/todo.c src/gui.c -o bin/todo.exe -mwindows -lcomctl32 -luxtheme

@echo off
if %errorlevel% neq 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo Build successful!
