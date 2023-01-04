$output = .\con-app-aarch64.exe
if( $output.Contains('Hello world'))
{
    Write-Host "Test PASSED!"
}
else 
{
    Write-Host "Test FAILED!"
    exit 1
}