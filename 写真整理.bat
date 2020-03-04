echo off
:--------------------------------------------------- 写真管理.bat

dir /a:d "%~1">NUL 2>&1
  if %errorlevel% EQU 0 goto top
:    ファイルを指定した場合
     pushd "%~dp1"
     "%~f0" "%CD%"

:パスとフォルダ名を取得
:top
set pname=%~f1
set name=%~nx1


for /f "delims=" %%f in ('dir /b "%pname%"') do ren "%pname%\%%f" "%name%_%%f"

cd %name%

:ディレクトリの作成
mkdir %name%_ROW
mkdir %name%_JPEG
mkdir %name%_MOVIE


:fileを拡張子ごとに分ける
move *.ORF .\%name%_ROW
move *.JPG .\%name%_JPEG
move *.MOV .\%name%_MOVIE



