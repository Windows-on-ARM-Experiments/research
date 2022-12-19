// This is a minimal console application that does not use the crt 
// and invokes window kernel methods directly.
//
// Bulild with clang
//
// clang --target=arm64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-aarch64.exe
// clang --target=x86_64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-x64.exe
//

typedef void *HANDLE;

#define STD_OUTPUT_HANDLE   ((DWORD)-11)
#define NULL    ((void *)0)

typedef unsigned short wchar_t;
typedef unsigned long       DWORD;
typedef int                 BOOL;
typedef DWORD            *LPDWORD;
typedef void             *LPVOID;

__declspec(dllimport) HANDLE __stdcall GetStdHandle(DWORD nStdHandle);

__declspec(dllimport) BOOL __stdcall WriteConsoleW(
    HANDLE hConsoleOutput,
    const void* lpBuffer,
    DWORD nNumberOfCharsToWrite,
    LPDWORD lpNumberOfCharsWritten,
    LPVOID lpReserved
    );

int mainCRTStartup()
{
   const wchar_t *text = L"Hello world\n";
   DWORD dwWritten;
   WriteConsoleW(GetStdHandle(STD_OUTPUT_HANDLE), text, 11, &dwWritten, NULL);
   return 0;
}