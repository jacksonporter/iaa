# Mise PowerShell Module
# Provides helper functions for interacting with mise

function Invoke-MiseExec {
    <#
    .SYNOPSIS
        Executes a command using mise with the specified tool.
    .DESCRIPTION
        Runs a command using mise exec with the specified tool version.
    .PARAMETER Tool
        The tool to use (e.g., 'python', 'node').
    .PARAMETER Command
        The command and its arguments to execute.
    .EXAMPLE
        Invoke-MiseExec -Tool python -Command @('pip', 'install', '-r', 'requirements.txt')
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Tool,
        
        [Parameter(Mandatory = $true)]
        [string[]]$Command
    )
    
    $miseArgs = @('exec', $Tool, '--') + $Command
    & mise @miseArgs
    if ($LASTEXITCODE -ne 0) {
        throw "mise exec failed with exit code $LASTEXITCODE"
    }
}

function Invoke-MiseUpgrade {
    <#
    .SYNOPSIS
        Upgrades mise tools.
    .DESCRIPTION
        Runs mise upgrade to update all installed tools.
    #>
    & mise upgrade
    if ($LASTEXITCODE -ne 0) {
        throw "mise upgrade failed with exit code $LASTEXITCODE"
    }
}

function Invoke-MiseRun {
    <#
    .SYNOPSIS
        Runs a mise task.
    .DESCRIPTION
        Executes a task defined in mise.toml.
    .PARAMETER Task
        The name of the task to run.
    .EXAMPLE
        Invoke-MiseRun -Task setup
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Task
    )
    
    & mise run $Task
    if ($LASTEXITCODE -ne 0) {
        throw "mise run failed with exit code $LASTEXITCODE"
    }
}

Export-ModuleMember -Function Invoke-MiseExec, Invoke-MiseUpgrade, Invoke-MiseRun


