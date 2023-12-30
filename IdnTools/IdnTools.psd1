#
# Module manifest for module 'IdnTools'
#
# Generated by: Derek Brown
#
# Generated on: 6/3/2021
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'IdnTools.psm1'

    # Version number of this module.
    ModuleVersion = '1.57'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID = '08a5bf65-ef8a-4487-b085-29d1d70f3cb6'

    # Author of this module
    Author = 'Derek Brown'

    # Company or vendor of this module
    CompanyName = ''

    # Copyright statement for this module
    Copyright = '(c) 2021 Derek Brown. All rights reserved.'

    # Description of the functionality provided by this module
    Description  = "This module contains functions to help manage SailPoint IdentityNow tenants.  The functions use various versions of SailPoint's APIs.  The only change required is updating the 'OrgName' variable in the .psm1 file with your tenant name."

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(

        "Update-IdnIdentityProfileIdentityAttribute"    ,
        "Get-IdnIdentityProfileIdentityAttributes"      ,
        "Add-IdnIdentityProfileIdentityAttribute"       ,
        "Remove-IdnProvisioningPoliciesForSource"       ,
        "Update-IdnProvisioningPoliciesBySource"        ,
        "Get-IdnSourceAccountAggregationStatus"         ,
        "Initialize-IdnIdentityAttributePatch"          ,
        "Get-IdnProvisioningPoliciesBySource"           ,
        "Set-IdnProvisioningPoliciesBySource"           ,
        "Update-IdnAccessProfileEntitlments"            ,
        "Remove-IdnAccessProfileEntitlments"            ,
        "Start-IdnSourceAccountAggregation"             ,
        "Get-IdnAccountAggregationStatus"               ,
        "Remove-IdnAccessProfileFromRole"               ,
        "Add-IdnAccessProfileEntitlments"               ,
        "Receive-IdnConfigExportStatus"                 ,
        "Import-IdnSourceEntitlements"                  ,
        "Invoke-IdnAccountAggregation"                  ,
        "Move-IdnAccountToNewIdentity"                  ,
        "Get-IdnIdentityEventHistory"                   ,
        "Initialize-IdnTransformRule"                   ,
        "Set-IdnSourcePasswordPolicy"                   ,
        "Write-IdnLifeCycleJsonPatch"                   ,
        "Add-IdnAccessProfileToRole"                    ,
        "Get-IdnAccountEntitlements"                    ,
        "Get-IdnConfigObjectDetails"                    ,
        "Get-IdnManagedClientStatus"                    ,
        "Get-IdnConfigExportStatus"                     ,
        "Set-IdnIdentityAdminRoles"                     ,
        "Start-IdnIdentityRefresh"                      ,
        "Import-IdnSourceAccounts"                      ,
        "Update-IdnConfigSettings"                      ,
        "Update-IdnLifeCycleState"                      ,
        "Get-IdnIdentityProfiles"                       ,
        "Get-IdnIdentitySnapShot"                       ,
        "Get-IdnPasswordPolicies"                       ,
        "Update-IdnTransformRule"                       ,
        "Get-IdnAccountActivity"                        ,
        "Get-IdnTaskStatusLists"                        ,
        "Get-IdnIdentityProfile"                        ,
        "Get-IdnLifeCycleStates"                        ,
        "Get-IdnManagedClusters"                        ,
        "Get-IdnAccessProfiles"                         ,
        "Get-IdnAccountHistory"                         ,
        "Get-IdnRoleMembership"                         ,
        "Get-IdnLifeCycleState"                         ,
        "Get-IdnManagedCluster"                         ,
        "Get-IdnPasswordPolicy"                         ,
        "Get-IdnTransformRules"                         ,
        "New-IdnLifeCycleState"                         ,
        "New-IdnPasswordPolicy"                         ,
        "Start-IdnConfigExport"                         ,
        "Update-IdnRoleMembers"                         ,
        "Get-IdnAccessProfile"                          ,
        "Get-IdnEventTriggers"                          ,
        "Get-IdnIdentityRoles"                          ,
        "Get-IdnInactiveUsers"                          ,
        "Get-IdnSourceSchemas"                          ,
        "New-IdnAccessProfile"                          ,
        "New-IdnTransformRule"                          ,
        "Search-IdnIdentities"                          ,
        "Add-IdnRoleCriteria"                           ,
        "Get-IdnEntitlements"                           ,
        "New-IdnRoleCriteria"                           ,
        "Get-IdnPendingTasks"                           ,
        "Set-IdnRoleCriteria"                           ,
        "Get-IdnAccountList"                            ,
        "Get-IdnEntitlement"                            ,
        "Get-IdnSourcesById"                            ,
        "Remove-IdnIdentity"                            ,
        #Update-IdnIdentity"                            ,
        "Get-IdnTaskStatus"                             ,
        "Get-IdnIdentities"                             ,
        "Search-IdnCustom"                              ,
        "New-IdnRoleChild"                              ,
        "Complete-IdnTask"                              ,
        "Search-IdnEvents"                              ,
        "Get-IdnAccounts"                               ,
        "Get-IdnIdentity"                               ,
        "Reset-IdnSource"                               ,
        "Set-IdnIdentity"                               ,
        "Get-IdnAccount"                                ,
        "Get-IdnSources"                                ,
        "Set-IdnSource"                                 ,
        "Get-IdnQueue"                                  ,
        "Get-IdnRoles"                                  ,
        "Get-IdnRules"                                  ,
        "Get-IdnToken"                                  ,
        "Get-IdnJobs"                                   ,
        "Get-IdnRole"                                   ,
        "Get-IdnRule"                                   ,
        "New-IdnRole"                                   

    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @(

                "IdentityNow"   ,
                "SailPoint"     ,
                "API"

            )

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}