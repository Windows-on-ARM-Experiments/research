$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path .\console-output.txt -Append:$false | out-null

& .\con-app-aarch64.exe

Stop-Transcript | out-null

$output = Get-Content .\console-output.txt -Raw 

if ($output.Contains('Hello world'))
{
    Write-Host "`nTest PASSED!"
}
else 
{
    Write-Host "`nTest FAILED!"
    exit 1
}