# research
This repository contains information and examples used for GNU toolchain “Windows on Arm” experiments.

## Minimal windows console app in assembler

[con-app-aarch64.s](min-exe/con-app-aarch64.s) is minimal console app written in aarch64 assembler. It calls the Windows API directly and does not have a dependency on the CRT.
The assembler code is in GNU format. It can either be compiled using the GNU assembler or CLANG. Linking can be performed by Link.exe from the Windows SDK.

## How to build the minimal console app

Install Visual Studio 2022 with the ARM64 toolchain. Start the VS command prompt for ARM64 using the vcvars batch file.
```
cmd.exe /k "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsx86_amd64.bat"
```
From the command prompt in the folder containing the assembler code you can assemble and link the app. 
```
~\research\min-exe> ..\tools\as.exe con-app-aarch64.s -o con-app-aarch64.o
~\research\min-exe> link con-app-aarch64.o kernel32.Lib /SUBSYSTEM:CONSOLE
```

## How to build the gas assembler for Windows on ARM64

The GNU assembler now supports targeting Windows on ARM64. The target name for this configuration is aarch64-pe. 

Code changes to support aarch64-pe are being merged to binutils over time as ther become availiable. Our WIP fork of the code can be found [here](https://github.com/Windows-on-ARM-Experiments/binutils-gdb/tree/aarch64-pe) if you want try our latest.

In the tools folder of this repo we provide a prebuilt Windows (x64) version of the GNU assembler based on our experimental branch (as.exe). However, if you prefer it can be built from source.

Gas can either be built from source using either: the normal GNU toolchain on Linux or WSL, or MSYS2.

```
git clone git://sourceware.org/git/binutils-gdb.git
makedir build
cd build
../binutils-gdb/configure --target=aarch64-pe
make -j8
```

To use our experimental version use git clone from [this](https://github.com/Windows-on-ARM-Experiments/binutils-gdb/tree/aarch64-pe) repo.