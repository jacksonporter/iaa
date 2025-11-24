#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

# Import mise module
$modulePath = Join-Path $PSScriptRoot '../lib/mise'
Import-Module $modulePath -Force

function RunSetup {
    Write-Host "Running setup task..."
    Invoke-MiseRun -Task setup
}

function Main {
    Write-Host "Entering iaa project...starting setup..."

    RunSetup
}

Main
