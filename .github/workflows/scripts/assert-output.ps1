$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path .\console-output.txt -Append:$false

& .\con-app-aarch64.exe

Stop-Transcript

$output = Get-Content .\console-output.txt -Raw 
if( $output.Contains('Hello world'))
{
    Write-Host "Test PASSED!"
}
else 
{
    exit 1
}