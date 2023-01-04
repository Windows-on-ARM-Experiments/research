// This is a minimal console application that does not use the crt 
// and invokes window kernel methods directly.
//
// Bulild with clang
//
// clang --target=arm64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-aarch64.exe
// clang --target=x86_64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-x64.exe
//

#define ATTACH_PARENT_PROCESS ((DWORD)-1)
#define STD_OUTPUT_HANDLE   ((DWORD)-11)
#define NULL    ((void *)0)
#define WINBASEAPI __declspec(dllimport)
#define WINAPI __stdcall

struct _OVERLAPPED;

typedef unsigned short wchar_t;
typedef unsigned long       DWORD;
typedef int                 BOOL;
typedef DWORD* LPDWORD;
typedef void* LPVOID;
typedef const void* LPCVOID;
typedef void* HANDLE;
typedef struct _OVERLAPPED OVERLAPPED, * LPOVERLAPPED;

WINBASEAPI HANDLE WINAPI GetStdHandle( DWORD nStdHandle);

WINBASEAPI
BOOL
WINAPI
WriteFile(
    HANDLE hFile,
    LPCVOID lpBuffer,
    DWORD nNumberOfBytesToWrite,
    LPDWORD lpNumberOfBytesWritten,
    LPOVERLAPPED lpOverlapped
);

int mainCRTStartup()
{
    const wchar_t* text = L"Hello world\n";
    DWORD written;
    HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
    WriteFile(h, text, 12 * sizeof(wchar_t), &written, NULL);
    return 0;
}