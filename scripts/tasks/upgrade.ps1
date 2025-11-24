#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

# Import mise module
$modulePath = Join-Path $PSScriptRoot '../lib/mise'
Import-Module $modulePath -Force

function MiseUpgradeTools {
    Write-Host "Upgrading Mise tools..."
    $output = Invoke-MiseUpgrade 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function UpgradePythonDependencies {
    Write-Host "Upgrading bootstrap Python dependencies..."
    $output = Invoke-MiseExec -Tool python -Command @('pip', 'install', '-U', '-r', 'bootstrap-requirements.txt') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function UpgradePoetryDependencies {
    Write-Host "Upgrading Poetry dependencies..."
    $output = Invoke-MiseExec -Tool python -Command @('poetry', 'update') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function UpgradeNodeDependencies {
    Write-Host "Upgrading Node dependencies..."
    $output = Invoke-MiseExec -Tool node -Command @('npm', 'upgrade') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function Main {
    MiseUpgradeTools
    UpgradePythonDependencies
    UpgradePoetryDependencies
    UpgradeNodeDependencies
}

Main
