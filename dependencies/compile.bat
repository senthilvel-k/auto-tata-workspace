@echo off

:main_menu
set /p variable_part=Enter the exisiting folder name to start Compilation : 

:: Construct the full path relative to the script location (going two levels up)
set "target_directory=%~dp0..\..\%variable_part%\product\06_system\ahu\product\code\build"
if not exist "%target_directory%" (
    echo %target_directory%
    echo Target directory does not exist.
    goto main_menu
)



:menu
cls
echo ╔════════════════════════════════════════════════════════════╗
echo ║                    Build Menu - TATA                                    ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║ 1. Clean                                                   ║
echo ║ 2. Incremental Build                                       ║
echo ║ 3. Clean Build                                             ║
echo ║ 4. Exit to Main Menu                                       ║
echo ╚════════════════════════════════════════════════════════════╝

:: Prompt the user for menu choice
set /p menu_choice=Enter your choice (1, 2, 3, or 4): 

:: Execute the selected command based on user's choice
if "%menu_choice%"=="1" (
    pushd "%target_directory%" 
    echo Cleaning build in %target_directory%
    call clean
    popd
    goto menu
) 
if "%menu_choice%"=="2" (
    pushd "%target_directory%" 
    echo Building incrementally in %target_directory%
    echo make.bat base_variant_a2
    call make.bat base_variant_a2
    popd
    goto menu
)
if "%menu_choice%"=="3" (
    pushd "%target_directory%" 
    echo Cleaning and building in %target_directory%
    echo make.bat base_variant_a2
    call make.bat clean base_variant_a2
    popd
    goto menu
)
if "%menu_choice%"=="4" (
    exit /b
)

goto :eof
