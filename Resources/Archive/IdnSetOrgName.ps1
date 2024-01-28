if (-not $env:IdnProductionOrgName -or -not $env:IdnSandboxOrgName) {

    $Warning  = "One or More Environmental Variables is missing for your Tenant's Organization names.  "
    $Warning += "These variables are required to set your Production and Sandbox URLs for each function ithe IdnTools Module.  "
    $Warning += "You will be prompted to provide the missing name(s) and select the scope for where to create them.  "
    $Warning += "You will need to be running PowerShell as an Administrator to create a System (Machine) Variable."

    Write-Warning $Warning

    $Valid = $false

    while (-not $Valid) {

        $Answer = Read-Host -Prompt "Select the Scope to create the Environmental Variables for the IdentityNow Module`n`n1: User`n2: Machine`n`n"

        $Scope = switch ($Answer) {

            1 { "User"      ; $Valid = $true }
            2 { "Machine"   ; $Valid = $true }        
        
        }

    }

    if ( -not $env:IdnProductionOrgName ) {

        $ProdName = Read-Host -Prompt "Enter the Org Name for your Production Tenant`n`n"
        [System.Environment]::SetEnvironmentVariable( "IdnProductionOrgName" , $ProdName , $Scope )
        $env:IdnProductionOrgName = $ProdName

    }



    if ( -not $env:IdnSandboxOrgName ) {

        $SbName = Read-Host -Prompt "Enter the Org Name for your Sandbox Tenant`n`n"
        [System.Environment]::SetEnvironmentVariable( "IdnSandboxOrgName" , $SbName , $Scope )
        $env:IdnSandboxOrgName = $SbName

    }

}