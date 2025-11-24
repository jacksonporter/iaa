#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

# Import mise module
$modulePath = Join-Path $PSScriptRoot '../lib/mise'
Import-Module $modulePath -Force

function BootstrapPythonDependencies {
    Write-Host "Bootstrapping Python dependencies..."
    $output = Invoke-MiseExec -Tool python -Command @('pip', 'install', '-r', 'bootstrap-requirements.txt') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function InstallPoetryDependencies {
    Write-Host "Bootstrapping Poetry dependencies..."
    $output = Invoke-MiseExec -Tool python -Command @('poetry', 'install') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function InstallNodeDependencies {
    Write-Host "Bootstrapping Node dependencies..."
    $output = Invoke-MiseExec -Tool node -Command @('npm', 'install') 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host $output
        exit $LASTEXITCODE
    }
}

function Main {
    Write-Host "Setting up iaa project..."
    
    BootstrapPythonDependencies
    InstallPoetryDependencies
    InstallNodeDependencies
}

Main
