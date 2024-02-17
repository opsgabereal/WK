@echo off
setlocal enabledelayedexpansion

:: Number of strings to generate
set "numStrings=5000"

:: Generate and save the strings
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
(for /l %%a in (1, 1, %numStrings%) do (
    set "randomString="
    for /l %%b in (1, 1, 27) do (
        set /a "rand=!random! %% 36"
        for %%c in (!rand!) do set "randomString=!randomString!!characters:~%%c,1!"
    )

    set "formattedString="
    for /l %%d in (0, 4, 24) do (
        set "formattedString=!formattedString!!randomString:~%%d,4!-"
    )
    echo !formattedString:~0,-1!
)) > LOADING.txt

:: Rename the file to "DONE" after generating all strings
ren LOADING.txt Windows_keys.txt

echo "Random strings generated and saved to Windows_keys.txt"
pause
