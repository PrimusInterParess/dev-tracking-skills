param(
    [string]$Target = (Join-Path $env:USERPROFILE ".cursor\skills")
)

$source = Join-Path $PSScriptRoot "skills"

if (-not (Test-Path $source)) {
    Write-Error "No skills folder at $source"
    exit 1
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null

Get-ChildItem $source -Directory | ForEach-Object {
    $dest = Join-Path $Target $_.Name
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Copy-Item $_.FullName $dest -Recurse
    Write-Output "installed $($_.Name) -> $dest"
}
