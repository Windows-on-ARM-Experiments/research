#!/bin/bash

set -ex # stop bash script on error

research_dir=$(pwd)

cd "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC"
cd $(ls -d */|tail -n 1)
cd ./bin/Hostarm64/arm64/
link_exe_path=$(pwd)/link.exe

cd "C:\Program Files (x86)\Windows Kits\10\Lib"
cd $(ls -d */|tail -n 1)
cd ./um/arm64/
kernel32_path=$(pwd)/kernel32.Lib

cd $research_dir

"$link_exe_path" con-app-aarch64.o "$kernel32_path" /SUBSYSTEM:CONSOLE
