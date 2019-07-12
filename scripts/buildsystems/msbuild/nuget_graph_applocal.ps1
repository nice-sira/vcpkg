[cmdletbinding()]
param([string]$targetBinary, [string]$installedDir, [string]$tlogFile, [string]$copiedFilesLog)

$ext = [System.IO.Path]::GetExtension($targetBinary)
if($ext)
{
  if($ext -eq ".lib")
  {
    return
  }
}

try
{
    $targetBinaryPath = Resolve-Path $targetBinary -erroraction stop
    $targetBinaryDir = Split-Path $targetBinaryPath -parent
    Write-Output "Check if $installedDir exists"

    if (!(Test-Path $installedDir))
    {
        Write-Output "Package has no binaries, nothing to do"
        return
    }

    Write-Output "Copy binaries to " $targetBinaryDir
    Copy-Item -Path $installedDir\*.dll -Destination $targetBinaryDir
}
catch [System.Management.Automation.ItemNotFoundException]
{
    return
}


