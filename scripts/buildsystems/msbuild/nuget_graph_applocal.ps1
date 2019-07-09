[cmdletbinding()]
param([string]$targetBinary, [string]$installedDir, [string]$tlogFile, [string]$copiedFilesLog)

$targetBinaryDir = Split-Path $targetBinaryPath -parent
Write-Output "Check if $installedDir exists"

if (!(Test-Path $installedDir))
{
    Write-Output "Package has no binaries, nothing todo"
    return
}

try
{
    $targetBinaryPath = Resolve-Path $targetBinary -erroraction stop
}
catch [System.Management.Automation.ItemNotFoundException]
{
    return
}

Write-Output "Copy binaries to " $targetBinaryDir
Copy-Item -Path $installedDir\*.dll -Destination $targetBinaryDir

