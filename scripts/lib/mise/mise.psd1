#
# Module manifest for 'mise'
#

@{
    RootModule = 'mise.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890'
    Author = 'iaa'
    Description = 'Helper functions for interacting with mise'
    PowerShellVersion = '7.0'
    FunctionsToExport = @('Invoke-MiseExec', 'Invoke-MiseUpgrade', 'Invoke-MiseRun')
    PrivateData = @{
        PSData = @{
        }
    }
}


