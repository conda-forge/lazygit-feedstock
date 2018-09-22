:: go one level up
cd %SRC_DIR%
cd ..

:: create the gopath directory structure
set "GOPATH=%CD%\gopath"
mkdir "%GOPATH%\src\github.com\jesseduffield" || goto :error
mklink /D "%GOPATH%\src\github.com\jesseduffield\lazygit" "%SRC_DIR%" || goto :error
cd "%GOPATH%\src\github.com\jesseduffield\lazygit"

:: build the project
go get -v || goto :error
go build || goto :error

:: install the binary
mv "%GOPATH%\bin\lazygit" "%LIBRARY_BIN%\lazygit" || goto :error
goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
