$ErrorActionPreference = "Stop"

$RepoUrl = if ($env:SHIP_THE_WORK_REPO_URL) { $env:SHIP_THE_WORK_REPO_URL } else { "https://github.com/lbanry/ship-the-work.git" }
$Target = if ($env:SHIP_THE_WORK_TARGET) { $env:SHIP_THE_WORK_TARGET } else { Join-Path $HOME ".agents\skills\ship-the-work" }

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git is required."
}

$Parent = Split-Path -Parent $Target
New-Item -ItemType Directory -Force -Path $Parent | Out-Null

if (Test-Path (Join-Path $Target ".git")) {
    Write-Host "Updating Ship the Work at $Target"
    git -C $Target fetch --prune origin
    if ($LASTEXITCODE -ne 0) { throw "Git fetch failed." }
    git -C $Target pull --ff-only
    if ($LASTEXITCODE -ne 0) { throw "Git pull failed. Resolve local changes before updating." }
}
elseif (Test-Path $Target) {
    $Timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $Backup = "$Target.backup.$Timestamp"
    Write-Host "Existing non-Git installation found. Moving it to $Backup"
    Move-Item -Path $Target -Destination $Backup
    git clone --depth 1 $RepoUrl $Target
    if ($LASTEXITCODE -ne 0) { throw "Git clone failed." }
}
else {
    Write-Host "Installing Ship the Work at $Target"
    git clone --depth 1 $RepoUrl $Target
    if ($LASTEXITCODE -ne 0) { throw "Git clone failed." }
}

if (-not (Test-Path (Join-Path $Target "SKILL.md"))) {
    throw "Installation completed without SKILL.md."
}

$Python = Get-Command python -ErrorAction SilentlyContinue
if ($Python) {
    & $Python.Source (Join-Path $Target "scripts\validate_skill.py")
    if ($LASTEXITCODE -ne 0) { throw "Skill validation failed." }
}

Write-Host "Ship the Work is installed. Restart Codex if it does not appear immediately."
