@ECHO OFF

REM create bin directory if it doesn't exist
if not exist ..\bin mkdir ..\bin

REM delete output from previous run
if exist ACTUAL.TXT del ACTUAL.TXT

REM compile the code into the bin folder
javac  -cp ..\src\main\java -Xlint:none -d ..\bin ^
..\src\main\java\jarvis\*.java ^
..\src\main\java\jarvis\ui\*.java ^
..\src\main\java\jarvis\tasklist\*.java ^
..\src\main\java\jarvis\task\*.java ^
..\src\main\java\jarvis\storage\*.java ^
..\src\main\java\jarvis\parser\*.java ^
..\src\main\java\jarvis\exception\*.java ^
..\src\main\java\jarvis\command\*.java
IF ERRORLEVEL 1 (
    echo ********** BUILD FAILURE **********
    exit /b 1
)
REM no error here, errorlevel == 0

REM run the program, feed commands from input.txt file and redirect the output to the ACTUAL.TXT
java -classpath ..\bin jarvis.Jarvis < input.txt > ACTUAL.TXT

REM compare the output to the expected output
FC ACTUAL.TXT EXPECTED.TXT
