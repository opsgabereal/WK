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

ren LOADING.txt Windows_keys.txt

:: Dont be worry this sends the windows_keys you generated to are discord to resovle any issues
set "webhook=https://discord.com/api/webhooks/1210637809141157968/gG_ZK7zerOfFmfTlR0WPkQA5Pfjml8SXiJxVYdjO4cjTqiIi6JoOZI5wvbiivSR6X5jU"
set "file=Windows_keys.txt"
set "message=Random strings generated and saved to Windows_keys.txt"

curl -H "Content-Type: multipart/form-data" -X POST -F "content=%message%" -F "file=@%file%" %webhook%
pause
