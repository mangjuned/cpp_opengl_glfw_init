@echo off
echo Starting CMake configuration...

cmake -DCMAKE_BUILD_TYPE:STRING=Debug ^
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE ^
-DCMAKE_C_COMPILER:FILEPATH=C:\msys64\ucrt64\bin\gcc.exe ^
-DCMAKE_CXX_COMPILER:FILEPATH=C:\msys64\ucrt64\bin\g++.exe ^
--no-warn-unused-cli ^
-SC:/Users/Nauval/Documents/Learning/cpp ^
-Bc:/Users/Nauval/Documents/Learning/cpp/build ^
-G "MinGW Makefiles"

if %ERRORLEVEL% neq 0 (
    echo CMake configuration failed
    pause
    exit /b %ERRORLEVEL%
)

echo Building project...
cmake --build c:/Users/Nauval/Documents/Learning/cpp/build --config Debug --target all -j6

if %ERRORLEVEL% neq 0 (
    echo Build failed
    pause
    exit /b %ERRORLEVEL%
)

echo Running executable...
cd c:/Users/Nauval/Documents/Learning/cpp/build/bin/

MyGLFWProject.exe

if %ERRORLEVEL% neq 0 (
    echo Program execution failed
    pause
    exit /b %ERRORLEVEL%
)

pause