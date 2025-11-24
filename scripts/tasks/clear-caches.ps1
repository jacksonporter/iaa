#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

function Clear-PythonCaches {
    <#
    .SYNOPSIS
        Removes common Python cache directories and files for a clean environment.
    .DESCRIPTION
        Deletes folders such as .venv, __pycache__, .pytest_cache, etc., if they exist.
    #>

    $itemsToRemove = @(
        ".venv",
        "__pycache__",
        ".pytest_cache",
        ".ruff_cache",
        ".mypy_cache",
        ".pytype",
        ".dmypy.json",
        "dmypy.json",
        ".pyre"
    )

    foreach ($item in $itemsToRemove) {
        if (Test-Path $item) {
            Write-Host "Removing $item..."
            Remove-Item -Path $item -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

function Clear-NodeCaches {
    <#
    .SYNOPSIS
        Removes common Node cache directories and files for a clean environment.
    .DESCRIPTION
        Deletes folders such as node_modules, .npm, .yarn, etc., if they exist.
    #>
    $itemsToRemove = @(
        "node_modules",
        ".npm",
        ".yarn",
        ".yarnrc",
        ".yarnrc.yml",
        ".yarnrc.yaml",
        ".yarnrc.json"
    )

    foreach ($item in $itemsToRemove) {
        if (Test-Path $item) {
            Write-Host "Removing $item..."
            Remove-Item -Path $item -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

function Main {
    Clear-PythonCaches
}

Main
