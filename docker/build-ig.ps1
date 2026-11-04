
$ErrorActionPreference = "Stop"

$timer = [System.Diagnostics.Stopwatch]::StartNew()

Write-Host "=== 1. Build script started ==="

Set-Location $PSScriptRoot

$projectDir = (Resolve-Path "..").Path
$outputDir = Join-Path $projectDir "output"

New-Item -ItemType Directory -Force $outputDir | Out-Null

Write-Host "=== 2. Docker build ==="

docker compose build ig_compiler
if ($LASTEXITCODE -ne 0) {
    throw "Docker build failed"
}

Write-Host "=== 3. Docker run ==="

# Linux側で実行するコマンド
$command = @(
    "set -e"
    "echo '=== 4. Sync source ==='"
    "rsync -rlt --delete --omit-dir-times --no-perms --no-owner --no-group --exclude='/.git/' --exclude='/output/' --exclude='/temp/' --exclude='/input-cache/' --exclude='/fsh-generated/' --exclude='/node_modules/' /source/ /repository/"
    "echo '=== 5. Run IG Publisher ==='"
    "/bin/sh /bin/entrypoint.sh"
    "echo '=== 6. Copy output ==='"
    "mkdir -p /destination"
    "cp -a /repository/output/. /destination/"
    "echo '=== 7. Build Completed ==='"
) -join "; "

docker compose run --rm --no-deps `
    --entrypoint /bin/sh `
    -v "${projectDir}:/source:ro" `
    -v "${outputDir}:/destination" `
    ig_compiler -c $command

if ($LASTEXITCODE -ne 0) {
    throw "IG Publisher build failed"
}

Write-Host "=== 8. IG Publisher build completed ==="
$timer.Stop()
Write-Host ""
Write-Host "=================================="
Write-Host ("Total elapsed time: {0:hh\:mm\:ss\.fff}" -f $timer.Elapsed)
Write-Host "=================================="