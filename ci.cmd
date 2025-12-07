@echo off
REM Очищення
if exist build rd /s /q build
mkdir build
cd build

REM 1. Конфігурація
echo [INFO] Configuring CMake...
cmake ..
if %errorlevel% neq 0 exit /b %errorlevel%

REM 2. Білд (Збираємо нову ціль unit_tests_bin)
echo [INFO] Building unit_tests_bin...
cmake --build . --config Debug --target unit_tests_bin
if %errorlevel% neq 0 (
    echo [ERROR] Build failed!
    exit /b %errorlevel%
)

REM 3. Запуск тестів
echo [INFO] Running tests...
ctest -C Debug --output-on-failure

cd ..
echo [SUCCESS] ALL DONE.    