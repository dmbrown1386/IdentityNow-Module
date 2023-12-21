<#
  ___________________________________________________________________________________________________________________________________________________________________________________________________________
 |                                                                                                                                                                                                           |
 |                                                                                                                                                                                                           |
 | Title         : IdnTools.psm1                                                                                                                                                                             |
 | By            : Derek Brown                                                                                                                                                                               |
 | Created       : 06/03/2021                                                                                                                                                                                |
 | Last Modified : 12/20/2023                                                                                                                                                                                |
 | Modified By   : Derek Brown                                                                                                                                                                               |
 |                                                                                                                                                                                                           |
 | Description   : Set of PowerShell Commands designed to                                                                                                                                                    |
 |                 help maintian a SailPoint tenant.                                                                                                                                                         |
 |                                                                                                                                                                                                           |
 |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 | Version: 1.01 - Basic set of commands            | Version: 1.02 - Added support for connecting to  | Version: 1.03 - Added commands for updating      | Version: 1.04 - Fixed Inactive Search function   |
 |                 to start.                        |                 the SandBox instance.            |                 Provisioning Policies.           |                 and added Role searches.         |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.05 - Added command for searching a    | Version: 1.06 - Added command for updating Role  | Version: 1.07 - Updated the Get Role function to | Version: 1.08 - Added command to pull Schemas    |
 |                 single role.                     |                 members.                         |                 take multiple strings for Id.    |                 for a source.                    |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.09 - Added command to refresh roles   | Version: 1.10 - Added search command to support  | Version: 1.11 - Added command to refresh a users | Version: 1.12 - Added commands for pulling Jobs, |
 |                 for specified user.              |                 a company project.               |                 access.                          |                 Tasks and Queue items.           |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.13 - Added commands for pulling Rules | Version: 1.14 - Added commands for managing      | Version: 1.15 - Updated SecurityProtocol to work | Version: 1.16 - Added commands for account       |
 |                 and password policies.           |                 password policies.               |                 on my company's servers.         |                 history and improved search.     |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.17 - Added command for getting a list | Version: 1.18 - Added command for updating the   | Version: 1.19 - Added commands to create Roles & | Version: 1.20 - Added commands for entitlment    |
 |                 of accounts, Identity Profiles,  |                 LifeCycle State changes and a    |                 Access Profiles, plus queries to |                 account details and direct       |
 |                 and Life Cycle states.           |                 command to build the JSON.       |                 support those functions.         |                 account details.                 |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.21 - Updated Search options and fixed | Version: 1.22 - Added commands for updating      | Version: 1.23 - Added Source Filter to Accounts  | Version: 1.24 - Command for updating identities  |
 |                 the All Accounts query.          |                 Entitlements.                    |                 search & paging to Entitlements. |                 & added refresh options.         |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.25 - Added Search options, updates to | Version: 1.26 - Added command to pull the Event  | Version: 1.27 - Added new Search for company     | Version: 1.28 - Switched custom User search to   |
 |                 Transform commands.              |                 History for an Identity.         |                 specific need.                   |                 look at Events in SailPoint.     |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.29 - Added command to pull Members of | Version: 1.30 - Added a V3 search for New users  | Version: 1.31 - Added functions to export Tenant | Version: 1.32 - Added function to move account   |
 |                 Dynamic Roles.                   |                 in a specific source.            |                 config.                          |                 between identitiies.             |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.33 - Added Function to get a list of  | Version: 1.34 - Added option to retrive full     | Version: 1.35 - Added function for changing      | Version: 1.36 - Added Alias Option to Search and |
 |                 Roles for an Identity.           |                 Access Profiles with Get Role.   |                 admin Roles in IdentityNow.      |                 changed a create search to V3.   |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.37 - Added function for getting an    | Version: 1.38 - Added function for getting all   | Version: 1.39 - Added Search options & functions | Version: 1.40 - Added function to create a new   |
 |                 Identity Snapshot and updated    |                 identities.                      |                 to run account aggregations      |                 LifeCycle State and list all for |
 |                 search with LAN ID.              |                                                  |                                                  |                 a source.                        |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.41 - Added V3 function to run a       | Version: 1.42 - Updated Provioning Policy cmd to | Version: 1.43 - Added function to reset source.  | Version: 1.44 - Add functions to Pull Cluster &  |
 |                 custom search.                   |                 target a Usage Type.             |                                                  |                 VA/Client details.               |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.45 - Added Classes & Functions for    | Version: 1.46 - Added additional Class methods.  | Version: 1.47 - Added Classes and Functions for  | Version: 1.48 - Removed V2 Search and fixed      |
 |                 updating Transforms and Identity |                                                  |                 adding and removing Access       |                 pagenation issues with PS 7.     |
 |                 attributes.                      |                                                  |                 Profiles to or from Roles.       |                                                  |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.49 - Added script to set Org names    | Version: 1.50 - Added Private function to get    | Version: 1.51 - Added a Function for paging & a  | Version: 1.52 - Added Elastic Paging Function,   |
 |                 as Environtmental Variables.     |                 Tenant details.                  |                 new function for role members.   |                 more Search functions & adding   |
 |                                                  |                                                  |                                                  |                 Dynamic Role criteria.           |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.53 - Removed Import script & added a  | Version: 1.54 - Added Import and Task management | Version: 1.55 - Fixed Get-IdnAccounts problems   |                                                  |
 |                 function set org names.          |                 commands.                        |                 with its Parameters.             |                                                  |
 |                                                  |                                                  |                                                  |                                                  |
 |__________________________________________________|__________________________________________________|__________________________________________________|__________________________________________________|
 
#>

<#
  __________________
 |                  |
 | START OF CLASSES |
 |__________________|

#>

class IdnConnectionDetails                                      {

    [string]$ModernBaseUri
    [string]$LegacyBaseUri
    [object]$TenantToken

    [void]CreateConfig( [string]$MURI , [string]$LURI , [object]$Bear ) {

        $this.ModernBaseUri = $MURI
        $this.LegacyBaseUri = $LURI
        $this.TenantToken   = $Bear

    }

}

class IdnTransformRuleBase                                      {

    [object]$attributes = @{}
    [ValidateSet( "accountAttribute" , "firstValid" , "lookup" )][string]$type
    [string]$name

}

class IdnIdentityAttributePatchNewLogic                         {

    [ValidateSet( "add" , "remove" , "replace" , "move" , "copy" , "test" )][string]$op
    [string]$path
    [hashtable]$value = @{

        identityAttributeName   = ""
        transformDefinition     = @{
            type        = ""
            attributes  = @{}
        }

    }

}

class IdnAddEntitlmentToRole                                    {

    [string     ]$op    = "add"
    [string     ]$path  = "/accessProfiles/-"
    [hashtable  ]$value = @{
        
        id      = ""
        type    = "ACCESS_PROFILE"

    }

}

class IdnRemoveEntitlmentFromRole                               {

    [string]$op         = "remove"
    [string]$path       = "/accessProfiles/"
    
}

class IdnRolePatch                                              {

    [string]$op = "add"
    [string]$path = "/membership/criteria/children/-"
    [hashtable]$value = [ordered]@{}

    [void]SetCriteria( [string]$StringOp , [string]$Type , [string]$Prop , [string]$String ) {

        $this.value.Add( "operation" , $StringOp )
        $this.value.Add( "key" , @{} )
        $this.value.Add( "stringValue" , $String )
        $this.value.key.Add( "type" , $Type )
        $this.value.key.Add( "property" , $Prop )
        
    }

}

class AccountAttributeRule  : IdnTransformRuleBase              {

    [void]SetRequiredAttributes( [string]$SourceLongID , [string]$Name , [string]$TargetProperty ) {

        $this.name                      = $Name
        $this.attributes.applicationId  = $SourceLongID
        $this.attributes.attributeName  = $TargetProperty
    }

    [void]EnableDescendingSort(                                 ) { $this.attributes.Add( "accountSortDescending"   , $true             ) }
    [void]EnableReturnFirstLink(                                ) { $this.attributes.Add( "accountReturnFirstLink " , $true             ) }
    [void]SetSortProperty(              [string]$SortProperty   ) { $this.attributes.Add( "accountSortAttribute"    , $SortProperty     ) }
    [void]SetAccountFilter(             [string]$AcctFilter     ) { $this.attributes.Add( "accountFilter"           , $AcctFilter       ) }
    [void]SetAccountPropertyFilter (    [string]$PropertyFilter ) { $this.attributes.Add( "accountPropertyFilter"   , $PropertyFilter   ) }

    AccountAttributeRule() {        

        $this.type = "accountAttribute"
        $this.attributes.Add( "applicationId" , "" )
        $this.attributes.Add( "attributeName" , "" )
    
    }

}

class ReferencePatchAdd     : IdnIdentityAttributePatchNewLogic {

    [void]ProvideRequiredProperties( [int32]$InsertPosition , [string]$TransfromName , [string]$IdentityAttributeName ) {

        $this.op    = "add"
        $this.path  = "/identityAttributeConfig/attributeTransforms/$InsertPosition"
        $this.value.transformDefinition.attributes.Add( "id" , $TransfromName ) 
        $this.value.identityAttributeName = $IdentityAttributeName
    
    }

    ReferencePatchAdd() {

        $this.value.transformDefinition.type = "reference"

    }

}

class ReferencePatchReplace : IdnIdentityAttributePatchNewLogic {

    [void]ProvideRequiredProperties( [int32]$InsertPosition , [string]$TransfromName , [string]$IdentityAttributeName , [string]$Name , [string]$ID , [string]$Attr ) {

        $this.op    = "replace"
        $this.path  = "/identityAttributeConfig/attributeTransforms/$InsertPosition"
        $this.value.transformDefinition.attributes.Add( "id"    , $TransfromName ) 
        $this.value.transformDefinition.attributes.Add( "input" , @{} ) 
        $this.value.transformDefinition.attributes.input.Add( "attributes" , @{} ) 
        $this.value.transformDefinition.attributes.input.Add( "type"       , 'accountAttribute' ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "sourceName"       , $Name ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "attributeName"    , $Attr ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "sourceId"         , $ID   ) 
        $this.value.identityAttributeName = $IdentityAttributeName
    
    }

    ReferencePatchReplace() {

        $this.value.transformDefinition.type = "reference"

    }

}

class ReferencePatch        : IdnIdentityAttributePatchNewLogic {

    [void]ProvideRequiredProperties( [int32]$InsertPosition , [string]$TransfromName , [string]$IdentityAttributeName , [string]$Name , [string]$ID , [string]$Attr ) {

        $this.path  = "/identityAttributeConfig/attributeTransforms/$InsertPosition"
        $this.value.transformDefinition.attributes.Add( "id"    , $TransfromName ) 
        $this.value.transformDefinition.attributes.Add( "input" , @{} ) 
        $this.value.transformDefinition.attributes.input.Add( "attributes" , @{} ) 
        $this.value.transformDefinition.attributes.input.Add( "type"       , 'accountAttribute' ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "sourceName"       , $Name ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "attributeName"    , $Attr ) 
        $this.value.transformDefinition.attributes.input.attributes.Add( "sourceId"         , $ID   ) 
        $this.value.identityAttributeName = $IdentityAttributeName
    
    }

    ReferencePatch() {

        $this.value.transformDefinition.type = "reference"

    }

}

class AccountAttributePatch : IdnIdentityAttributePatchNewLogic {

    [void]ProvideRequiredProperties( [string]$Operation, [int32]$InsertPosition , [string]$IdentityAttributeName , [string]$ID , [string]$Name , [string]$AccountAttributeName ) {

        $this.op                            = $Operation
        $this.path                          = "/identityAttributeConfig/attributeTransforms/$InsertPosition"
        $this.value.identityAttributeName   = $IdentityAttributeName
        $this.value.transformDefinition.attributes.Add( "sourceName"    , $Name                 ) 
        $this.value.transformDefinition.attributes.Add( "attributeName" , $AccountAttributeName ) 
        $this.value.transformDefinition.attributes.Add( "sourceId"      , $ID                   ) 
    
    }

    AccountAttributePatch() {

        $this.value.transformDefinition.type = "accountAttribute"

    }
    
}

<#
  ________________
 |                |
 | END OF CLASSES |
 |________________|

#>

##############################################################################################################################################################################################################

<#
  ____________________________
 |                            |
 | START OF PRIVATE FUNCTIONS |
 |____________________________|

#>

function Import-IdnConfigSettings                               {
        
    process {

        $Settings = $env:IdnConfig | ConvertFrom-Json
        
    }
    
    end {

        return $Settings
        
    }

}

function Get-IdnTenantDetails                                   {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Production or Sandbox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance

    )

    process {

        $DetailsForTenant = switch ($Instance) {

            "Production"    { $ProductionIdnConfig  }
            "Sandbox"       { $SandboxIdnConfig     }

        }

    }

    end     {

        return $DetailsForTenant

    }

}

function Invoke-IdnPaging                                       {
    
    [CmdletBinding()]
    
    param (
        
        # Parameter for the User Token.
        [Parameter(Mandatory = $true,
        HelpMessage = "Use this parameter to pass your Auth Token.")]
        [object]$Token,

        # Parameter for URL
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the starting URL for the web calls.")]
        [string]$StartUri,
        
        # Parameter for Offset.
        [Parameter(Mandatory = $true,
        HelpMessage = "Number of items to grap with each page.")]
        [int32]$OffsetIncrease,

        # Parameter for the Total.
        [Parameter(Mandatory = $true,
        HelpMessage = "Total items found.")]
        [int32]$Total

    )
    
    begin   {

        $Page   = 1
        $Offset = $OffsetIncrease
        $Stop   = $Total - $OffsetIncrease
        $Array  = New-Object -TypeName "System.Collections.ArrayList"
        
    }
    
    process {

        do {

            $Page++
            $Uri = $StartUri + "?limit=" + $OffsetIncrease + "&offset=" + $Offset
            $Offset += $OffsetIncrease
            Write-Progress -Activity "Getting Page #$Page." -Status "$($Array.Count) of $Stop." -PercentComplete ( $Array.Count / $Stop * 100 ) -CurrentOperation $Uri
            $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Token
            $Array.AddRange( $Call )
            
        } until ( $Array.Count -ge $Stop )
        
    }
    
    end     {
        
        return $Array
        
    }

}

function Invoke-IdnElasticPaging                                {
    
    [CmdletBinding()]
    
    param   (
        
        # Parameter for the User Token.
        [Parameter(Mandatory = $true,
        HelpMessage = "Use this parameter to pass your Auth Token.")]
        [object]$Token,

        # Parameter for URL
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the starting URL for the web calls.")]
        [string]$StartUri,
        
        # Parameter for Offset.
        [Parameter(Mandatory = $true,
        HelpMessage = "Number of items to grap with each page.")]
        [int32]$PerPage,

        # Parameter for the Total.
        [Parameter(Mandatory = $true,
        HelpMessage = "Total items found.")]
        [int32]$Total,
        
        # Parameter Elastic Search Body
        [Parameter(Mandatory = $false,
        HelpMessage = "Provide Body Object for Elastic Searcches.")]
        [hashtable]$ElasticBody

    )
    
    begin   {

        $Page   = 1
        $Stop   = $Total - $PerPage
        $Array  = New-Object -TypeName "System.Collections.ArrayList"
        
    }
    
    process {

        do {

            $Page++
            $Body = $ElasticBody | ConvertTo-Json -Depth 10
            Write-Progress -Activity "Getting Page #$Page." -Status "$($Array.Count) of $Stop." -PercentComplete ( $Array.Count / $Stop * 100 ) -CurrentOperation $Uri
            $Call = Invoke-RestMethod -Method "Post" -Uri $StartUri -Headers $Token -Body $Body -ContentType "application/json"
            $Array.AddRange( $Call )
            $ElasticBody.searchAfter = @( $Call | Select-Object -ExpandProperty "id" -Last 1 )
            
        } until ( $Array.Count -ge $Stop )
        
    }
    
    end     {
        
        return $Array
        
    }

}

<#
  __________________________
 |                          |
 | END OF PRIVATE FUNCTIONS |
 |__________________________|

#>

##############################################################################################################################################################################################################

<#
  ___________________________
 |                           |
 | START OF PUBLIC FUNCTIONS |
 |___________________________|

#>

function Update-IdnConfigSettings                               {

    [CmdletBinding()]
    
    param (

        # Parameter for Production Org Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Org Name for your Production Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.api.identitynow.com" -Count 1 ) {$true} else { throw "Could find a tenant with the name $_.  Try again." } } )]
        [string]$ProdName,
        
        # Parameter for Sandbox Org Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Org Name for your Sandbox Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.api.identitynow.com" -Count 1 ) {$true} else { throw "Could find a tenant with the name $_.  Try again." } } )]
        [string]$SandboxName,

        # Parameter for Variable Scrope.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the scope to create the variable.  Valid Options are User or Machine.")]
        [ValidateSet("User","Machine")]
        [string]$Scope
        
    )
    
    begin {

        $Hash   = @{}
        
    }
    
    process {

        $Hash.Add( "IdnProd"    , $ProdName     )
        $Hash.Add( "IdnSandbox" , $SandboxName  )
        $Json = ConvertTo-Json -InputObject $Hash

        [System.Environment]::SetEnvironmentVariable( "IdnConfig" , $Json , $Scope )

        
    }
    
    end {

        return Set-Item -Path "env:IdnConfig" -Value $Json -Force 

    }

}

function Get-IdnToken                                           {

    [CmdletBinding()]

    param   (

        # Parameter for the Client ID of the Personal Access Token
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Client ID for your Personal Token here.")]
        [ValidateScript({ if ( $env:IdnConfig ) {$true} else { throw 'The $env:IdnConfig variable is missing.  Run Update-IdnConfigSettings to create it.' }} )]
        [string]$ClientId,

        # Parameter for the Client Secret of the Personal Access Token
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Client Secret for your Personal Token here.")]
        [securestring]$ClientSecret,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Names  = Import-IdnConfigSettings
        $Object = New-Object -TypeName "IdnConnectionDetails"
        $Modern = "https://{0}.api.identitynow.com/"
        $Legacy = "https://{0}.identitynow.com/"
        $BSTRID = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $ClientSecret )
        $Plain  = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(    $BSTRID       )

    }

    process {

        switch ($Instance) {

            "Production"   {
                
                $BaseUri    = $Modern -f $Names.IdnProd
                $LegacyUri  = $Legacy -f $Names.IdnProd
                $ConfigName = "ProductionIdnConfig"
                
            }
            
            "SandBox"      {
                
                $BaseUri    = $Modern -f $Names.IdnSandbox
                $LegacyUri  = $Legacy -f $Names.IdnSandbox
                $ConfigName = "SandboxIdnConfig"
                
            }
        
        }

        $Uri      = $BaseUri + "oauth/token?grant_type=client_credentials&client_id=" + $ClientId + "&client_secret=" + $Plain
        $Call     = Invoke-RestMethod -Method "Post" -Uri $Uri 

        if ($Call) {

            $Bearer = [ordered]@{

                "Authorization" = "Bearer "     + $Call.access_token
                "cache-control" = "no-cache"

            }

            $Object.CreateConfig( $BaseUri , $LegacyUri , $Bearer )

        }

    }

    end     {

        return New-Variable -Name $ConfigName -Value $Object -Scope "Global" -Option "ReadOnly" -Force

    }

}

function Get-IdnInactiveUsers                                   {

    [CmdletBinding()]

    param (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v2/search?limit=2500&query=%28%28attributes.cloudLifecycleState%3Aterm%2A%29%20AND%20%28roleCount%3A%3e0%29%29"
        
    }

    process {

        #Call = Invoke-RestMethod -Method Post -Uri $Uri -Headers $Tenant.TenantToken -Body $Json -ContentType "application/json" 
        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json" 

    }

    end {     

        return $Call.identity

    }

}

function Get-IdnAccounts                                        {

    [CmdletBinding()]

    param   (

        # Parameter for specifying a Source to search for accounts in
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the long ID fo the Source to search in.")]
        [string]$SourceLongId,

        # Parameter for specifying a Identity to search for accounts in
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the long ID fo the Identity to search for.")]
        [string]$IdentityLongId,

        # Parameter for the Account's Name.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Name (typically the Username) of the account.")]
        [string]$AccountName,

        # Parameter for the Native ID.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Native Identity value to Search for.")]
        [string]$NativeID,

        # Bool Parameter for Uncorrelated flag.
        [Parameter(Mandatory = $false,
        HelpMessage = "Bool Parameter to search only Uncorrlated accounts or not.")]
        [ValidateSet("true","false")]
        [string]$Uncorrelated,

        # Parameter specifying the number of accounts to return.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a number between 1 and 250.")]
        [ValidateScript({if ($_ -le 250) {$True} else {throw "$_ is greater than 250."}})]
        [int]$Limit = 250,

        # Parameter specifying the number of accounts to return.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a number between 1 and 250.")]
        [ValidateScript({if ($_ -le 250) {$True} else {throw "$_ is greater than 250."}})]
        [int]$OffsetIncrease = 250,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant  = Get-IdnTenantDetails -Instance $Instance
        $BaseUri = $Tenant.ModernBaseUri + "v3/accounts?limit=$Limit&filters="
        $Params  = @()
        $Call    = @()
        $Offset  = 0
        $Page    = 0

    }

    process {

        switch ($PSBoundParameters.Keys) {

            "SourceLongId"      { $Params += 'sourceId eq "{0}"'        -f $SourceLongId    }
            "IdentityLongId"    { $Params += 'identityId eq "{0}"'      -f $IdentityLongId  }
            "AccountName"       { $Params += 'name eq "{0}"'            -f $AccountName     }
            "NativeID"          { $Params += 'nativeIdentity eq "{0}"'  -F $NativeID        }
            "Uncorrelated"      { $Params += 'uncorrelated eq {0}'      -f $Uncorrelated    }
  
        }

        $Filters  = $Params -join " and "
        $BaseUri += $Filters 

        do {

            try     {

                $Uri    = $BaseUri + "&offset=$Offset&count=true"
                $Rest   = Invoke-WebRequest -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ErrorAction "Stop" 
                $Call  += $Rest.Content -creplace 'ImmutableId','Immutable_Identity' | ConvertFrom-Json
                $Total  = "$($Rest.Headers.'X-Total-Count')"
                $PgTtl  = [Math]::Ceiling($Total / $OffsetIncrease)
                $Page++
                Write-Progress -Activity "Page $Page of $PgTtl" -Status "Accounts $($Call.Count) of $Total" -PercentComplete ($Call.Count/$Total*100) -CurrentOperation $Uri
                $Offset += $OffsetIncrease

            }

            catch   {

                $PSItem.Exception               | Out-Host
                $PSItem.ErrorDetails.Message    | Out-Host

            }

        } until ( $Call.Count -eq $Total )

    }

    end     {

        return $Call

    }

}

function Get-IdnIdentity                                        {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.",
        ValueFromPipeline = $true)]
        [string[]]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Account in $Id) {

            $Uri   = $Tenant.ModernBaseUri + "beta/identities/" + $Account
            $Call += Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
            
        }
        
    }
    
    end     {

        return $Call
        
    }

}

function Remove-IdnIdentity                                     {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.")]
        [string]$Alias,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v2/identities/" + $Alias
                
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Delete" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
                    
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnIdentitySnapShot                                {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.",
        ValueFromPipeline = $true)]
        [ValidateLength(32,32)]
        [string[]]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Account in $Id) {

            $Uri   = $Tenant.ModernBaseUri + "beta/historical-identities/" + $Account
            $Call += Invoke-RestMethod -Method Get -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
            
        }
        
    }
    
    end     {

        return $Call
        
    }

}

function Set-IdnIdentity                                        {

    [CmdletBinding()]
    
    param   (

        # Parameter for User's Alias to be refreshed.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Alias of the Identity to Refresh")]
        #[Alias("Name")]
        [string]$IdentityId,

        # Parameter for Life Cycle State
        [Parameter(Mandatory = $true,
        HelpMessage = "Select a LifeCycle State to change to.")]
        [ValidateSet("active","terminated","terminated2","terminated3")]
        [string]$LifeCycleState,

        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/user/updateLifecycleState"

    }
    
    process {

        $Body = @{

            id              = $IdentityId
            lifecycleState  = $LifeCycleState

        } | ConvertTo-Json -Depth 10

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Set-IdnIdentityAdminRoles                              {

    [CmdletBinding()]
    
    param   (

        # Parameter for User's Alias to be refreshed.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Alias of the Identity to Refresh")]
        [string]$IdentityAlias,

        # Parameter for Life Cycle State
        [Parameter(Mandatory = $true,
        HelpMessage = "Select a LifeCycle State to change to.")]
        [ValidateSet("ORG_ADMIN","HELPDESK")]
        [string]$AdminRole,

        # Parameter for Life Cycle State
        [Parameter(Mandatory = $true,
        HelpMessage = "Select a LifeCycle State to change to.")]
        [ValidateSet("AddRole","RemoveRole")]
        [string]$AddOrRemove,

        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/user/updatePermissions"

    }
    
    process {

        $Add = switch ($AddOrRemove) {

            "AddRole"       { $true     }
            "RemoveRole"    { $false    }

        }

        $Body = @{

            ids             = $IdentityAlias
            adminType       = $AdminRole
            isAdmin         = $Add

        } | ConvertTo-Json -Depth 10

        $Call = Invoke-WebRequest -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json" | Select-Object StatusCode,StatusDescription
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnSources                                         {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/sources"
        
    }
    
    process {

        <# do {

            In Beging BLOCK:

                    $Offset = 0
                    $Page   = 0
                    $Add    = 1
                    $Call   = @()

            try {

                <# $RstUri = $Uri + "limit=1?&offset=$Offset&count=true"
                $Rest   = Invoke-WebRequest -Method Get -Uri $RstUri -Headers $Tenant.TenantToken -ErrorAction Stop 
                $Cnvrt  = $Rest.Content | ConvertFrom-Json
                $Call  += $Cnvrt
                $Total  = $Rest.Headers.'X-Total-Count'
                $PgTtl  = [Math]::Ceiling($Total / $Add)
                $Page++
                $Offset += $Add 

                $RstUri = $Uri + "?limit=1&offset=1&count=true"
                $Rest   = Invoke-WebRequest -Method "Get" -Uri $RstUri -Headers $Tenant.TenantToken -ErrorAction "Stop" 
                $Cnvrt  = $Rest.Content | ConvertFrom-Json
                $Call  += $Cnvrt
                $Total  = $Rest.Headers.'X-Total-Count'
                $Offset += $Add
                Write-Progress -Activity "$($Call.Count) of $Total." -PercentComplete ($Call.Count / $Total * 100)
                Write-Host $RstUri -ForegroundColor Cyan 

            }

            catch {

                $PSItem.Exception               | Out-Host
                $PSItem.ErrorDetails.Message    | Out-Host

            }

        } until ($Call.Count -eq $Total) #>
        
        $Call = Invoke-RestMethod -Uri $Uri -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json"

    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnSourceSchemas                                   {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$SourceId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/schemas"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnSourcesById                                     {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(32,32)]
        [string[]]$SourceId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Source in $SourceId) {

            $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $Source
            $Call  += Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken
            
        }
        
    }
    
    end     {

        return $Call
        
    }

}

function Start-IdnSourceAccountAggregation                      {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(6,6)]
        [string]$SourceShortId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/loadAccounts/" + $SourceShortId
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken

    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnSourceAccountAggregationStatus                  {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(32,32)]
        [string]$AggregationId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/account-aggregations/" + $AggregationId + "/status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnProvisioningPoliciesBySource                    {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$SourceId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/provisioning-policies"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }

}

# Set function is the partial update of the 
# Provisioning Profile, currently not in a working state.
function Set-IdnProvisioningPoliciesBySource                    {

    [CmdletBinding()]

    param   (

        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$SourceId,

        [string]$UsageType = "CREATE",

        [string]$JsonPatch,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/provisioning-policies/" + $UsageType

    }

    process {

        $Call = Invoke-RestMethod -Method Patch -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonPatch -ContentType "application/json-patch+json"

    }

    end     {

        return $Call

    }

}

# Update function is the complete update of the 
# Provisioning Profile
<# function Update-IdnProvisioningPoliciesBySource              {

    [CmdletBinding()]
    
    param (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        #[ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$SourceCloudExternalId,

        [string]$UsageType = "Create",

        # Parameter for passing the new JSON config for the Profile
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the full JSON configuration to update the Profile with.")]
        [string]$JsonUpdate,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri = $Tenant.ModernBaseUri + "cc/api/source/update/" + $SourceCloudExternalId + "/provisioning-policies/" + $UsageType        
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonUpdate -ContentType "application/json"
        
    }
    
    end {

        return $Call
        
    }

} #>

function Update-IdnProvisioningPoliciesBySource                 {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 6 characters."}})]
        [string]$SourceCloudExternalId,

        # Parameter for Policy Type.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select which Usage Type to update.")]
        [ValidateSet("CREATE", "UPDATE", "DELETE", "ASSIGN", "UNASSIGN", "CREATE_GROUP", "UPDATE_GROUP", "DELETE_GROUP", "REGISTER",
        "CREATE_IDENTITY", "UPDATE_IDENTITY", "EDIT_GROUP", "ENABLE", "DISABLE", "UNLOCK", "CHANGE_PASSWORD")]
        [string]$UsageType,

        # Parameter for passing the new JSON config for the Profile
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the full JSON configuration to update the Profile with.")]
        [string]$JsonUpdate,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $SourceCloudExternalId + "/provisioning-policies/" + $UsageType
        
    }
    
    process {

        #Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonUpdate -ContentType "application/json"
        $Call = Invoke-RestMethod -Method "Put" -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonUpdate -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

} 

function Remove-IdnProvisioningPoliciesForSource                {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 6) {$true} else {throw "Provided value is not the correct length of 6 characters."}})]
        [string]$SourceCloudExternalId,

        # Parameter for selecting hte Usage Type.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the Usage Type for the Policy to delete from the source.")]
        [ValidateSet("CREATE","UPDATE","DELETE","ASSIGN","UNASSIGN","CREATE_GROUP","UPDATE_GROUP","DELETE_GROUP","REGISTER","CREATE_IDENTITY",
        "UPDATE_IDENTITY","EDIT_GROUP","ENABLE","DISABLE","UNLOCK","CHANGE_PASSWORD")]
        [string]$UsageType,

        # Parameter for passing the new JSON config for the Profile
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the full JSON configuration to update the Profile with.")]
        [string]$JsonUpdate,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $SourceLongId + "/provisioning-policies/" + $UsageType 
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Post -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonUpdate -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

} 

function Get-IdnTransformRules                                  {

    [CmdletBinding()]
    
    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/transforms"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end         {

        return $Call
        
    }

}

function New-IdnTransformRule                                   {

    [CmdletBinding()]
    
    param   (

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide the Criteria for the new Transform Rule.")]
        [ValidateScript({if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformRuleBase") {$true} else {throw "BaseType is not IdnTransformRuleBase."}})]
        [object]$TransformRule,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/transforms"
        
    }
    
    process {

        $RuleConfigAsJson   = ConvertTo-Json    -InputObject    $TransformRule  -Depth  100
        $Call               = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $RuleConfigAsJson -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Update-IdnTransformRule                                {

    [CmdletBinding()]
    
    param   (

        # Parameter for the ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Pass the ID of the Transform Rule.")]
        [guid]$RuleID,

        # Parameter Json Body
        [Parameter(Mandatory = $true,
        HelpMessage = "Pass the JSON for the rule you are creating as a string.")]
        [string]$RuleUpdateJson,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/transforms/" + $RuleID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Put" -Uri $Uri -Headers $Tenant.TenantToken -Body $RuleUpdateJson -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnRole                                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string[]]$Id,

        # Switch for including Access Profiles 
        [Parameter(Mandatory = $false,
        HelpMessage = "Use this switch to retrieve properties of associated Access Profiles.")]
        [switch]$ExpandAccessProfiles,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
                
    }
    
    process {

        foreach ($Entry in $Id) {
        
            $Uri     = $Tenant.ModernBaseUri + "beta/roles/" + $Entry
            $Current = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

            if ($ExpandAccessProfiles) {

                $ProfileList            = $Current.accessProfiles.id
                $Current.accessProfiles = @()

                foreach ($ProfileID in $ProfileList) {
                    
                    $Current.accessProfiles += Get-IdnAccessProfile -Id $ProfileID

                }

            }

            $Call += $Current

        }
        
    }
    
    end     {

        return $Call
        
    }
    
}

function New-IdnRole                                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the new Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a Name for the Role you want to create.")]
        [string]$Name,

        # Parameter for specifying a descrption.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify a Description for the new Role.")]
        [string]$Description,

        # Parameter for specifying the membership type.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the membership type.  Choose STANDARD (currently not permitted) to specify a rule, or IDENTITY_LIST for manual assignment.")]
        [ValidateSet("IDENTITY_LIST")]
        [string]$MembershipType = "IDENTITY_LIST",

        # Parameter for specifying a list of users.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the the Aliases/Names for the User Identities to add to the Role.")]
        [string[]]$UserAliases,

        # Parameter for entering Entitlements to assign.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a list of IDs for Entitlements for this Profile to Grant.")]
        [ValidateLength(32,32)]
        [string[]]$AccessProfiles,
        
        # Parameter for specifying the Profle owner
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the owner of the new Profile.")]
        [string]$OwnerAlias,

        # Parameter for specifying the Owner Type.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify what Type of Object the Owner is.  Default is Identity.")]
        [ValidateSet("ACCOUNT_CORRELATION_CONFIG","ACCESS_PROFILE","ACCESS_REQUEST_APPROVAL","ACCOUNT","APPLICATION","CAMPAIGN"         ,
        "CAMPAIGN_FILTER","CERTIFICATION","CLUSTER","CONNECTOR_SCHEMA","ENTITLEMENT","GOVERNANCE_GROUP","IDENTITY","IDENTITY_PROFILE"   ,
        "IDENTITY_REQUEST","LIFECYCLE_STATE","PASSWORD_POLICY","ROLE","RULE","SOD_POLICY","SOURCE","TAG_CATEGORY","TASK_RESULT"         ,
        "REPORT_RESULT","SOD_VIOLATION","ACCOUNT_ACTIVITY")]
        [string]$OwnerType = "IDENTITY",

        # Parameter for specifying whether the Role is Enabled or Disabled
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify whether to create this Role as Enabled or Disabled.  Default is set to Enabled.")]
        [bool]$Enabled = $true,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance

        $Uri        = $Tenant.ModernBaseUri + "beta/roles/" 
        $UserList   = @( Get-IdnIdentity        -Id $UserAliases      -Instance $Instance -ErrorAction "SilentlyContinue" )
        $APList     = @( Get-IdnAccessProfile   -Id $AccessProfiles   -Instance $Instance -ErrorAction "SilentlyContinue" )
        $Proceed    = $true
        
        try     {

            $OwnerInfo = Get-IdnIdentity  -Id $OwnerAlias -Instance $Instance

            if ( $UserList.Count    -lt 1 ) {

                $Proceed    = $false
                $Reason    += "Unable to find any Identites in the provided list.  Verify the IDs and try again."
    
            }

            if ( $APList.Count      -lt 1 ) {

                $Proceed    = $false
                $Reason    += "Unable to find any Access Profiles in the provided list.  Verify the IDs and try again."
    
            }
            
        }        

        catch   {

            $Proceed    = $false
            $Reason     = "Unable to find the Identity $OwnerAlias.  Verify this is the correct Alias."
            
        }
                
    }
    
    process {

        if ($Proceed) {

            $AccessProfileArray = @()
            $UserListArray      = @()

            $AccessProfileArray += foreach ($Profile    in $APList      ) {
                
                @{

                    id      = $Profile.id
                    type    = "ACCESS_PROFILE"
                    name    = $Profile.name

                }

            }

            $UserListArray      += foreach ($User       in $UserList    ) {
                
                @{

                    id          = $User.externalId
                    type        = "IDENTITY"
                    name        = $User.name
                    aliasName   = $User.alias

                }
                
            }

            $Membership = @{

                type        = $MembershipType
                identities  = $UserListArray

            }
        
            $Object = @{

                name            = $Name
                description     = $Description
                owner           = @{

                    type    = "IDENTITY"
                    id      = $OwnerInfo.id

                }

                accessProfiles  = $AccessProfileArray
                membership      = $Membership
                enabled         = $Enabled
                requestable     = $false

            }

            $Body = ConvertTo-Json -InputObject $Object -Depth 100
            $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body
        
        }
        
        else {

            $Message  = "Refer to the above warning for details.  Critical information is missing or incorrect.  Role has not been created.  "  
            $Message += "Verify the details provided and try again."
            Write-Warning $Reason
            Write-Host "`n$Message `n" -ForegroundColor "Yellow"

        }
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnRoles                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/role/list"
                
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken  
        
    }
    
    end     {

        return $Call.items
        
    }
    
}

function Update-IdnRoleMembers                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string]$Id,

        # Parameter for the list of users to add to the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a list of users to add.")]
        [string[]]$UsersToAdd,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/role/update"
                
    }
    
    process {

        $Object = @{

            id          = $Id
            selector    = @{

                aliasList = @(

                    $UsersToAdd

                )

                type = "IDENTITY_LIST"

            }

        }

        $Body = ConvertTo-Json      -Depth  10      -InputObject    $Object
        $Call = Invoke-RestMethod   -Method Post    -Headers        $Tenant.TenantToken  -Uri $Uri -ContentType "application/json" -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnAccessProfiles                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/access-profiles/"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnAccessProfile                                   {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string[]]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($IdProfile in $Id) {

            $Uri    = $Tenant.ModernBaseUri + "beta/access-profiles/" + $IdProfile
            $Call  += Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 
            
        }
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Start-IdnIdentityRefresh                               {

    [CmdletBinding()]
    
    param   (

        # Parameter for User's Alias to be refreshed.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Alias of the Identity to Refresh")]
        [string[]]$Alias,

        # Parameter for updating Roles.
        [Parameter(Mandatory = $false,
        HelpMessage = "Bool parameter for updating Roles.")]
        [bool]$ProvisionRoles = $true,

        # Parameter for updating Entitlements.
        [Parameter(Mandatory = $false,
        HelpMessage = "Bool parameter for updating Entitlements.")]
        [bool]$RefreshEntitlements = $true,

        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Array  = @()
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/system/refreshIdentities"

    }
    
    process {

        foreach ($User in $Alias) {
        
            $Body = [ordered]@{    
                
                filter      = "name == ""$User"""    
                refreshArgs = @{
                    
                    synchronizeAttributes   = $true        
                    promoteAttributes       = $true        
                    refreshLinks            = $true    
                    provision               = $ProvisionRoles
                    correlateEntitlements   = $RefreshEntitlements
                
                }
            
            } | ConvertTo-Json -Depth 10

            $Call   = Invoke-WebRequest -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json"
            $Array += [PSCustomObject]@{

                User        = $User
                Code        = $Call.StatusCode
                Description = $Call.StatusDescription
            
            }

        }

    }
    
    end     {

        return $Array
        
    }

}

function Get-IdnAccountAggregationStatus                        {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Account
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Account you're looking for.")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/account-aggregations/" + $Id + "/status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnPendingTasks                                    {
    
    [CmdletBinding()]

    param   (

        [int]$PageSize,
        [int]$OffSet,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/pending-tasks?limit=$PageSize&offset=$OffSet"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnQueue                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/message/getQueueStatus?"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnJobs                                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/message/getActiveJobs"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Set-IdnSource                                          {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$SourceId,

        # Parameter for JSON patch string.
        [Parameter(Mandatory = $true,
        HelpMessage = "Pass the JSON patch string to his parameter.")]
        [string]$JsonPatchObject,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json-patch+json" -Body $JsonPatchObject
    
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnRules                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/rule/list"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call.items
        
    }
    
}

function Get-IdnRule                                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for the ID of the Rule to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the Rule you are looking for.")]
        [ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$RuleId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/rule/get/$RuleId"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnPasswordPolicies                                {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/passwordPolicy/list"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnPasswordPolicy                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for the ID of the Rule to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the Rule you are looking for.")]
        #[ValidateScript({if ($_.Length -eq 32) {$true} else {throw "Provided value is not the correct length of 32 characters."}})]
        [string]$PolicyId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/passwordPolicy/get/$PolicyId"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function New-IdnPasswordPolicy                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for the name of the new policy.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a name for the Policy you want to create.")]
        [string]$Name,

        # Parameter for the Description of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Description for the Policy you want to create.")]
        [string]$Description,
        
        # Parameter for the Max Length of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Maximum Password Length for the Policy you want to create.")]
        [int32]$MaxLength,
        
        # Parameter for the Min Alpha of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Minimum amount of Alpha characters for the Policy you want to create.")]
        [int32]$MinAlpha,
        
        # Parameter for the Min Length of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Minimum Password Length for the Policy you want to create.")]
        [int32]$MinLength,
        
        # Parameter for the Min Lower of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Minimum number of lower case characters for the Policy you want to create.")]
        [int32]$MinLower,
        
        # Parameter for the min number count of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a minimum number of integer characters for the Policy you want to create.")]
        [int32]$MinNumber,
        
        # Parameter for the min count of special characters of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a minimum number of special characters for the Policy you want to create.")]
        [int32]$MinSpecial,
        
        # Parameter for the min upper case count of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a Minimum amount of Upper Case characters for the Policy you want to create.")]
        [int32]$MinUpper,
        
        # Parameter for the required amouont of character types of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a number for the required count of character types for the Policy you want to create.")]
        [int32]$MinCharacterTypes,
        
        # Parameter for the limiting repeated characters of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a maximum limit for repeated characters for the Policy you want to create.")]
        [int32]$MaxRepeatedChars,
        
        # Parameter for allowing account attributes in a password of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Set to True to allow users to use their account attributes in a password, False to deny.")]
        [bool]$BlockAccountAttributes,

        # Parameter for allowing identity attributes in a password of the new policy.
        [Parameter(Mandatory = $false,
        HelpMessage = "Set to True to allow users to use their identity attributes in a password, False to deny.")]
        [bool]$BlockIdentityAttributes,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/passwordPolicy/create/?name=$Name"
        
    }
    
    process {

        switch ($PSBoundParameters.Keys) {
            
            "Description"               { $Uri += "&description=$Description"                       } 
            "MaxLength"                 { $Uri += "&maxLength=$MaxLength"                           } 
            "MinAlpha"                  { $Uri += "&minAlpha=$MinAlpha"                             } 
            "MinLength"                 { $Uri += "&minLength=$MinLength"                           } 
            "MinLower"                  { $Uri += "&minLower=$MinLower"                             } 
            "MinNumber"                 { $Uri += "&minNumeric=$MinNumber"                          } 
            "MinSpecial"                { $Uri += "&minSpecial=$MinSpecial"                         } 
            "MinUpper"                  { $Uri += "&minUpper=$MinUpper"                             } 
            "MinCharacterTypes"         { $Uri += "&minCharacterTypes=$MinCharacterTypes"           }
            "MaxRepeatedChars"          { $Uri += "&maxRepeatedChars=$MaxRepeatedChars"             }
            "BlockAccountAttributes"    { $Uri += "&useAccountAttributes=$BlockAccountAttributes"   } 
            "BlockIdentityAttributes"   { $Uri += "&useIdentityAttributes=$BlockIdentityAttributes" } 
            
        }

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Set-IdnSourcePasswordPolicy                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for the ID of the Source to updatee.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the Source you want to update.")]
        [string]$CloudExternalIdForSource,

        # Paramter for the ID of the Password Policy.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the password policy to assign to the source.")]
        [string]$PwPolicyId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/source/update/$CloudExternalIdForSource`?passwordPolicy=$PwPolicyId"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnAccountActivity                                 {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.",
        ValueFromPipeline = $true)]
        [Alias("ExternalId")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/account-activities?requested-for=" + $Id
        $Call   = @()
        
    }
    
    process {

        $Call += Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnAccountHistory                                  {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.",
        ValueFromPipeline = $true)]
        [Alias("ExternalId")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        
    }
    
    process {

        $Uri    = $Tenant.ModernBaseUri + "v3/historical-identities/" + $Id + "/events"
        $Call   = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call
        
    }

}

# Update Identity Data (Not Working Yet)
function Update-IdnIdentity                                     {

    [CmdletBinding()]

    param   (

        # Account ID for the ID to update
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter Account ID or Alias of identity to update.")]
        [string]$AccountId,

        [string]$JsonPatch,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v2/identities/" + $AccountId

    }

    process {

        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken -Body $JsonPatch -ContentType "application/json"

    }

    end     {

        return $Call

    }

}

function Get-IdnAccount                                         {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/accounts/" + $Id
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call
        
    }

}

function Invoke-IdnAccountAggregation                           {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/accounts/" + $Id + "/reload"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnAccountList                                     {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for, example 'identityId eq ""2c91808a7ae63b23017aef2af5d80c8e""'",
        ValueFromPipeline = $true)]
        [string]$Filter,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/accounts/"
        
    }
    
    process {

        switch ($PSBoundParameters.Keys) {

            'Filter' { $Uri += "?filters=$($Filter)"    }

        }

        $Call = Invoke-RestMethod -Method Get -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call -creplace "immutableId","immutable_ID" | ConvertFrom-Json
        
    }

}

function Get-IdnIdentityProfiles                                {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles"


    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentityProfile                                 {
    
    [CmdletBinding()]

    param   (

        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/profile/get/$Id"

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentityProfileIdentityAttributes               {
    
    [CmdletBinding()]

    param   (

        # Parameter for the Long ID of a Source
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long (most likely External) of the Profile to retrieve.")]
        [ValidateLength(32,32)]
        [Alias("ExternalID","Id")]
        [string]$ProfileLongId,

        # Switch for getting only Default Attributes
        [Parameter(Mandatory = $false,
        HelpMessage = "Use this switch to return only the default attributes.")]
        [switch]$DefaultOnly,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileLongId 

        if ($DefaultOnly) {$Uri += "/default-identity-attribute-config"}

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

        if ($Call) {

            $Attributes = switch ($DefaultOnly) {

                $true   { $Call.attributeTransforms                         }
                Default { $Call.identityAttributeConfig.attributeTransforms }

            }

            $Attributes | Add-Member -MemberType "NoteProperty" -Name "Index" -Value "" -Force

            foreach ($Attribute in $Attributes) {

                $Attribute.Index = $Attributes.IndexOf( $Attribute )

            }

        }
        
    }
    
    end     {

        return $Attributes
        
    }
    
}

function Add-IdnIdentityProfileIdentityAttribute                {
    
    [CmdletBinding()]

    param   (

        # Parameter for the Long ID of a Source
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long (most likely External) of the Profile to update.")]
        [Alias("ExternalID","Id")]
        [string]$ProfileLongId,

        # Paramter for Json Patches
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide at least one Patch Object.")]
        [ValidateScript({if (($_.GetType().BaseType.Name -eq "IdnIdentityAttributePatchNewLogic")) {$true} else {throw "BaseType is not valid.  Must be IdnIdentityAttributePatchNewLogic"}})]
        [object[]]$Updates,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles/" + $ProfileLongId

    }
    
    process {

        foreach ($Patch in $Updates) {$Patch.op = 'add'}
        
        $Body = ConvertTo-Json -InputObject $Updates -Depth 10
        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json-patch+json" -Body $Body
        
    }
    
    end     {

        return $Call
                
    }
    
}

function Update-IdnIdentityProfileIdentityAttribute             {
    
    [CmdletBinding()]

    param   (

        # Parameter for the Long ID of a Source
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long (most likely External) of the Profile to update.")]
        [Alias("ExternalID","Id")]
        [string]$ProfileLongId,

        # Paramter for Json Patches
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide at least one Patch Object.")]
        [ValidateScript({if (($_.GetType().BaseType.Name -eq "IdnIdentityAttributePatchNewLogic")) {$true} else {throw "BaseType is not valid.  Must be IdnIdentityAttributePatchNewLogic"}})]
        [object[]]$Updates,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles/" + $ProfileLongId

    }
    
    process {

        foreach ($Patch in $Updates) {$Patch.op = 'replace'}

        $Body = ConvertTo-Json      -InputObject    $Updates    -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch"     -Uri    $Uri -Headers $Tenant.TenantToken -ContentType "application/json-patch+json" -Body $Body
        
    }
    
    end     {

        return $Call
                
    }
    
}

function Get-IdnLifeCycleState                                  {

    [CmdletBinding()]

    param   (

        # Parameter for specifying the name of the Life Cycle State.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify name of the Life Cycle State.")]
        [string]$LifeCycleStateExtId,

        # Parameter for specifying Profile ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify Profile ID the Life Cycle state is for.")]
        [string]$ProfileId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states/" + $LifeCycleStateExtId
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -Uri $Uri
        
    }
    
    end     {

        return $Call

    }

}

function Get-IdnLifeCycleStates                                 {

    [CmdletBinding()]

    param   (

        # Parameter for specifying Profile ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify Profile ID the Life Cycle state is for.")]
        [string]$ProfileId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states"
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -Uri $Uri
        
    }
    
    end     {

        return $Call

    }

}

function New-IdnLifeCycleState                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for specifying Profile ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify Profile ID the Life Cycle state is for.")]
        [string]$ProfileId,

        # Parameter for Name
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide a Name for the new LifeCycle State.")]
        [string]$Name,

        # Parameter for Description
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a description for the new LifeCycle State.")]
        [string]$Description,

        # Parameter to Enable/Disable.
        [Parameter(Mandatory = $false,
        HelpMessage = "Boolean parameter for Enabling the LifeCycle State, default is True.")]
        [bool]$Enabled = $true,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles/" + $ProfileId + "/lifecycle-states/" + $LifeCycleStateExtId
        
    }
    
    process {

        $Object = @{

            name            = $Name
            technicalName   = $Name.ToLower()
            enabled         = $Enabled
            description     = $Description

        }

        $Body = ConvertTo-Json      -InputObject $Object    -Depth      10
        $Call = Invoke-RestMethod   -Method     "Post"      -Headers    $Tenant.TenantToken -Uri $Uri -Body $Body -ContentType "application/json"
        
    }
    
    end     {

        return $Call

    }

}

function Update-IdnLifeCycleState                               {

    [CmdletBinding()]

    param   (

        # Parameter for specifying the name of the Life Cycle State.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify name of the Life Cycle State.")]
        [string]$LifeCycleStateExtId,

        # Parameter for specifying Profile ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify Profile ID the Life Cycle state is for.")]
        [string]$ProfileId,

        # Parameter for the JSON Patch body.
        [Parameter(Mandatory = $true,
        HelpMessage = "Paramoter for passing a JSON patch as the Body.")]
        [string]$JsonPatch,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states/" + $LifeCycleStateExtId
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Patch" -Headers $Tenant.TenantToken -Uri $Uri -ContentType "application/json-patch+json" -Body $JsonPatch
        
    }
    
    end {   

        return $Call

    }

}

function Write-IdnLifeCycleJsonPatch                            {

    [CmdletBinding()]
    
    param   (
        
        # Switch Parameters to set action to perform.
        [Parameter(ParameterSetName = 'CreateNew'       , Mandatory = $false)][Switch]$CreateNew        ,
        [Parameter(ParameterSetName = 'UpdateExisting'  , Mandatory = $false)][Switch]$UpdateExisting   ,

        # Parameter for listing IDs to add to new settings
        [Parameter(ParameterSetName = 'CreateNew',
        Mandatory = $true,
        HelpMessage = "Enter one or more Source IDs to add to this new Policy.")]
        [ValidateLength(32,32)]
        [string[]]$SourceIdList,

        # Parameter for specifying the action to take.
        [Parameter(ParameterSetName = 'CreateNew',
        Mandatory = $true,
        HelpMessage = "Choose whether the account action is DISABLE or ENBALE.")]
        [ValidateSet("ENABLE","DISABLE")]
        [string]$Action,

        # Parameter for specifying the current config as an object.
        [Parameter(ParameterSetName = 'UpdateExisting',
        Mandatory = $true,
        HelpMessage = "Pass the current config as an object.")]
        [ValidateScript({if ($_.sourceIds.Count -ge 1) {$true} else {throw "Provided object does not contain an Array of sourceIds with at least one entry."}})]
        [object]$CurrentSettings,

        # Parameter for listing Source IDs to Add.
        [Parameter(ParameterSetName = 'UpdateExisting',
        Mandatory = $false,
        HelpMessage = "Specify one ore more Source IDs to add to the current config.")]
        [ValidateLength(32,32)]
        [string[]]$SourceIDsToAdd,

        # Parameter for listing Source IDs to Add.
        [Parameter(ParameterSetName = 'UpdateExisting',
        Mandatory = $false,
        HelpMessage = "Specify one ore more Source IDs to remove from the current config.")]
        [ValidateLength(32,32)]
        [string[]]$SourceIDsToRemove
        
    )
    
    begin   {

        $Object = @(

            @{

                op      = "replace"
                path    = "/accountActions"
                value   = @(

                    @{

                        action      = ""
                        sourceIds   = @()

                    }

                )

            }

        )
        
    }
    
    process {

        switch ($PSBoundParameters.Keys) {

            "CreateNew"         { 
            
                $Object.value.action     = $Action
                $Object.value.sourceIds += $SourceIdList 
            
            }

            "UpdateExisting"    {

                [System.Collections.ArrayList]$Current = $CurrentSettings.sourceIds

                switch ($PSBoundParameters.Keys) {

                    "SourceIDsToAdd"    {

                        $Current += $SourceIDsToAdd
        
                    }
        
                    "SourceIDsToRemove" {
        
                        
                        $Found = Compare-Object -ReferenceObject $Current -DifferenceObject $SourceIDsToRemove -ExcludeDifferent -IncludeEqual
                        foreach ($Removal in $Found.InputObject) {
        
                            $Current.Remove($Removal)
                            
                        }
        
                    }

                }
            
                $Unique = $Current | Sort-Object -Unique
                $Object.value.action     = $CurrentSettings.action
                $Object.value.sourceIds += $Unique
            
            }

        }
        
    }
    
    end     {

        return ConvertTo-Json -InputObject $Object -Depth 100
        
    }

}

function Set-IdnRoleCriteria                                    {
    
    [CmdletBinding()]

    param   (

        # Switches are for specifying the Role to update the Membership Criteria for.
        [Parameter(ParameterSetName = "Microsoft365Licensing" , Mandatory = $true)][switch]$Microsoft365Licensing,

        # Parameter for listing domains to add to the Role.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter domains to add tot he current Rule in the following format: domain.com",
        ParameterSetName = "Microsoft365Licensing")]
        [ValidateScript({if ($_ -match '^\w*\.[a-zA-Z]*$') {$true} else {throw "$_ does not match required format of an email domain: domain.com"}})]
        [string[]]$DomainsToAdd,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.",
        ParameterSetName = "Microsoft365Licensing")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant         = Get-IdnTenantDetails -Instance $Instance
        $PatchObject    = @(

            @{

                op      = "replace"
                path    = "/membership"
                value   = @{

                    type        = "STANDARD"
                    criteria    = @{}
                    identities  = $null

                }

            }
                    
        )
                
    }
    
    process {

        switch ($PSCmdlet.ParameterSetName) {

            "Microsoft365Licensing"  {

                $LicenseRole    = Get-IdnRole  -Id "INSERT SOURCE EXTERNAL ID HERE"
                $Uri            = $Tenant.ModernBaseUri + "beta/roles/" + $LicenseRole.id 
                $LifeCycleRule  = $LicenseRole.membership.criteria.children | Where-Object { $_.operation -eq 'EQUALS' }
                $CurrentDomains = $LicenseRole.membership.criteria.children | Where-Object { $_.operation -eq 'OR'     }

                foreach ($EmailDomain in $DomainsToAdd) {

                    $CurrentDomains.children += [PSCustomObject]@{

                        operation   = 'CONTAINS'
                        key         = [PSCustomObject]@{

                            type        = 'ACCOUNT'
                            property    = 'attribute.email_address'
                            sourceId    = '2c91808365ce73c50165d44a0c764717'

                        }

                        stringValue = "@" + $EmailDomain
                        children    = @{}

                    }
                    
                }

                $PatchObject.value.criteria.Add( "operation"    , "AND" )
                $PatchObject.value.criteria.Add( "key"          , $null )
                $PatchObject.value.criteria.Add( "stringValue"  , ""    )
                $PatchObject.value.criteria.Add( "children"     , @()   )

                $PatchObject.value.criteria.children += $LifeCycleRule
                $PatchObject.value.criteria.children += $CurrentDomains

            }

            Default                 {

                Write-Warning "No Valid Role was selected."

            }

        }

        if ($PatchObject.value.criteria.children.Count -ge 1) {

            $Body = ConvertTo-Json      -Depth  100     -InputObject    $PatchObject
            Write-Host $Uri -ForegroundColor "Cyan"
            #Call = Invoke-RestMethod   -Method "Patch" -Headers        $Tenant.TenantToken       -Uri $Uri -ContentType "application/json-patch+json" -Body $Body

        }
        
    }
    
    end     {

        return $Body
        
    }
    
}

function New-IdnAccessProfile                                   {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the name of the Access Profile you'd like to create.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify name of the Access Profile you'd like to create.")]
        [string]$Name,

        # Parameter for specifying a descrption.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify a Description for the new Access Profile.")]
        [string]$Description,

        # Parameter for specifying the ID of the Source this Profile is for.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the 32 character ID of the Source this Profile is for.")]
        [ValidateLength(32,32)]
        [string]$SourceId,

        # Parameter for entering Entitlements to assign.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a list of IDs for Entitlements for this Profile to Grant.")]
        [ValidateLength(32,32)]
        [string[]]$EntitlmentIds,

        # Parameter for specifying the Profle owner
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the owner of the new Profile.")]
        [string]$OwnerAlias,

        # Parameter for specifying the Owner Type.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify what Type of Object the Owner is.  Default is Identity.")]
        [ValidateSet("ACCOUNT_CORRELATION_CONFIG","ACCESS_PROFILE","ACCESS_REQUEST_APPROVAL","ACCOUNT","APPLICATION","CAMPAIGN"         ,
        "CAMPAIGN_FILTER","CERTIFICATION","CLUSTER","CONNECTOR_SCHEMA","ENTITLEMENT","GOVERNANCE_GROUP","IDENTITY","IDENTITY_PROFILE"   ,
        "IDENTITY_REQUEST","LIFECYCLE_STATE","PASSWORD_POLICY","ROLE","RULE","SOD_POLICY","SOURCE","TAG_CATEGORY","TASK_RESULT"         ,
        "REPORT_RESULT","SOD_VIOLATION","ACCOUNT_ACTIVITY")]
        [string]$OwnerType = "IDENTITY",

        # Parameter for setting the Role as Enabled or Disabled.
        [Parameter(Mandatory = $false,
        HelpMessage = "Create the Profile as Enabled or Disabled, default is Enabled.")]
        [bool]$Enabled = $true,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Proceed    = $true
        $Tenant     = Get-IdnTenantDetails -Instance $Instance
        $Uri        = $Tenant.ModernBaseUri + "beta/access-profiles"

        try     {

            $OwnerInfo = Get-IdnIdentity  -Id $OwnerAlias -Instance $Instance
            
            try {

                $SourceInfo         = Get-IdnSourcesById    -SourceId $SourceId -Instance $Instance
                $EntitlementList    = Get-IdnEntitlements   -SourceId $SourceId -Instance $Instance
                $EntitlementInfo    = @()
                
                foreach ($Entitlment in $EntitlmentIds) {
                    
                    $EntitlementInfo += $EntitlementList | Where-Object {$_.id -eq $Entitlment}
        
                }

                if ($EntitlementInfo.Count -lt 1) {

                    $Proceed    = $false
                    $Reason     = "Unalbe to find any Entitlements in the provided list within the Source $($SourceInfo.name).  Verify the IDs and try again."
        
                }

            }

            catch {

                $Reason     = "Unabled to find the Source provided.  Verify the ID and try again."
                $Proceed    = $false
                
            }

        }        

        catch   {

            $Proceed    = $false
            $Reason     = "Unable to find the Identity $OwnerAlias.  Verify this is the correct Alias."
            
        }        

    }
    
    process {
        
        if ($Proceed) {

            $EntitlmentArray = @()
            
            foreach ($Entry in $EntitlementInfo) {

                $EntitlmentArray += @{

                    name    = $Entry.displayableName
                    id      = $Entry.id 
                    type    = "ENTITLEMENT"

                }

            }

            $Object = @{

                name            = $Name
                description     = $Description
                enabled         = $Enabled
                owner           = @{

                    type  = $OwnerType
                    id    = $OwnerInfo.externalId

                }

                source          = @{

                    id    = $SourceInfo.id
                    type  = "SOURCE"
                    name  = $SourceInfo.name

                }

                entitlements    = $EntitlmentArray
                requestable     = $false
                <# "accessRequestConfig": {
                "commentsRequired": true,
                "denialCommentsRequired": true,
                "approvalSchemes": [
                    {
                    "approverType": "GOVERNANCE_GROUP",
                    "approverId": "46c79819-a69f-49a2-becb-12c971ae66c6"
                    }
                ]
                },
                "revocationRequestConfig": {
                "approvalSchemes": [
                    {
                    "approverType": "GOVERNANCE_GROUP",
                    "approverId": "46c79819-a69f-49a2-becb-12c971ae66c6"
                    }
                ]
                },
                "segments": [
                "f7b1b8a3-5fed-4fd4-ad29-82014e137e19",
                "29cb6c06-1da8-43ea-8be4-b3125f248f2a"
                ] #>
            }

            $Body = ConvertTo-Json -InputObject $Object -Depth 100
            $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json"

        }

        else {

            $Message  = "Refer to the above warning for details.  Critical information is missing or incorrect.  Access Profile has not been created.  "  
            $Message += "Verify the details provided and try again."
            Write-Warning $Reason
            Write-Host "`n`n$Message `n" -ForegroundColor Yellow

        }
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnEntitlements                                    {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(32,32)]
        [string]$SourceId,

        # Parameter specifying the number of accounts to return.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a number between 1 and 250.")]
        [ValidateScript({if ($_ -gt 250) {$True} else {throw "$_ is greater than 250."}})]
        [int]$OffsetIncrease = 250,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $UTC    = [int][double]::Parse((Get-Date -UFormat %s))
        $OffSet = 0 
        $Page   = 0
        $Call   = @()
        
    }
    
    process {

        $Source     = Get-IdnSourcesById -SourceId $SourceId
        $RootUri    = $Tenant.ModernBaseUri + "cc/api/entitlement/list?_dc=" + $UTC + "&CISApplicationId=" + $Source.id + "&limit=" + "$OffsetIncrease" + "&count=true&start="
        
        do {

            try {

                $Uri     = $RootUri + "$Offset"
                $Rest    = Invoke-WebRequest -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ErrorAction "Stop" 
                $Item    = $Rest.Content -creplace 'ImmutableId','Immutable_Identity' | ConvertFrom-Json
                $Total   = $Item.count 
                $Call   += $Item.items
                $Offset += $OffsetIncrease
                $PgTtl   = [Math]::Ceiling($Total / $OffsetIncrease)
                $Page++
                Write-Progress -Activity "Page $Page of $PgTtl" -Status "Entitlements $($Call.Count) of $Total" -PercentComplete ($Page/$PgTtl*100) -CurrentOperation $Source.name 
                
            }

            catch {

                $PSItem.Exception               | Out-Host
                $PSItem.ErrorDetails.Message    | Out-Host

            }

        } until ($Page -eq $PgTtl)

        #Call = Invoke-WebRequest -Headers $Tenant.TenantToken -Uri $Uri -Method "Get" -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }
}

function Get-IdnAccountEntitlements                             {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/accounts/" + $Id + "/entitlements"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
        
    }
    
    end     {

        return $Call
        
    }

}

function Search-IdnIdentities                                   {

    [CmdletBinding( DefaultParameterSetName = "Bulk" )]

    param   (

        # Parameter for inserting the query.
        [Parameter(ParameterSetName = "Query",
        Mandatory = $true,
        HelpMessage = "Enter the query to submit.")]
        [string]$Query,

        # Parameter help description
        [Parameter(ParameterSetName = "Alias",
        Mandatory = $true,
        HelpMessage = "Enter the Alias of the Identity to search for.")]
        [string]$Alias,

        # Parameter for specifying first name to search.
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false)]
        [Parameter(ParameterSetName = "Firstname",
        Mandatory = $true,
        HelpMessage = "Enter the First Name to search for here.")]
        [Parameter(ParameterSetName = "Lastname",
        Mandatory = $false,
        HelpMessage = "Enter the First Name to search for here.")]
        [string]$FirstName,

        # Parameter for specifying last name to search.
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false)]
        [Parameter(ParameterSetName = "Firstname",
        Mandatory = $false,
        HelpMessage = "Enter the First Name to search for here.")]        
        [Parameter(ParameterSetName = "Lastname",
        Mandatory = $true,
        HelpMessage = "Enter the First Name to search for here.")]
        [string]$LastName,

        # Parameter for specifying the emailladdress to search for.
        [Parameter(ParameterSetName = "Email",
        Mandatory = $true,
        HelpMessage = "Enter the email address to search for here.")]
        [string]$EmailAddress,

        # Parameter for specifying the domain to search.
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Enter the domain to search for here.")]
        [Parameter(ParameterSetName = "Domain",
        Mandatory = $true,
        HelpMessage = "Enter the domain to search for here.")]
        [ValidateScript( { ( if ($_ -notlike "*@*" ) { $true } else { throw "$_ contains an '@' symbol.  This is included in the query and cannot be part of the value passed." } ) } ) ]
        [string]$EmailDomain,
        
        # Parameter for specifying Life Cycle State.
        [Parameter(ParameterSetName = "State",
        Mandatory = $true,
        HelpMessage = "Select the Life Cycle State to Search for.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Select the Life Cycle State to Search for.")]
        [ValidateSet("Active","Terminated","Terminated2","Terminated3","Pending","LOA")]
        [string]$LifeCycleState,

        # Parameter for the name of a Source
        [Parameter(ParameterSetName = "Sourcename",
        Mandatory = $true,
        HelpMessage = "Enter the Name of the Source to search for Identities that have accounts.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Enter the Name of the Source to search for Identities that have accounts.")]
        [string]$SourceName,

        # Parameter for the Source Long ID.
        [Parameter(ParameterSetName = "SourceID",
        Mandatory = $true,
        HelpMessage = "Specify the Long ID for the Source.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Specify the Long ID for the Source.")]
        [string]$LongSourceID,

        # Parameter for the number of hours.
        [Parameter(ParameterSetName = "Hours",
        Mandatory = $true,
        HelpMessage = "Specify the number hours to search Account creations for.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Specify the number hours to search Account creations for.")]
        [int32]$Hours,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant         = Get-IdnTenantDetails -Instance $Instance
        $Uri            = $Tenant.ModernBaseUri + "v3/search?count=true&from=0"
        $SearchStrings  = @()
        $ResultStore    = @()
    
    }

    process {

        switch ($PSBoundParameters.Keys) {

            'Query'                 { $SearchStrings += $Query                                                                  }
            'Alias'                 { $SearchStrings += 'identity_all:'                     + $Alias                            } 
            'LastName'              { $SearchStrings += '(attributes.lastname:"'            + $LastName         + '")'          } 
            'FirstName'             { $SearchStrings += '(attributes.firstname:"'           + $FirstName        + '")'          } 
            'EmailAddress'          { $SearchStrings += '(attributes.email:"'               + $EmailAddress     + '")'          }
            'EmailDomain'           { $SearchStrings += '(attributes.email:"'               + $EmailDomain      + '*@")'        }
            'LifeCycleState'        { $SearchStrings += '(attributes.cloudLifecycleState:"' + $LifeCycleState   + '")'          }
            'SourceName'            { $SearchStrings += '@accounts(source.name:"'           + $SourceName       + '")'          }
            'LongSourceID'          { $SearchStrings += '@accounts(source.id:"'             + $LongSourceID     + '")'          }
            'Hours'                 { $SearchStrings += '(created:[now-'                    + $Hours            + 'h TO now])'  }
            
        }

        $Search = $SearchStrings -join " AND "

        $Object = @{

            indices     = @(

                "identities"

            )

            query       = @{

                query = $Search

            }

            sort        = @("+id")
            searchAfter = @()

        }

        do {

            $Body                = ConvertTo-Json -InputObject $Object -Depth  10
            $Call                = Invoke-WebRequest -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body 
            $Numb                = [int32]"$($Call.Headers.Item("X-Total-Count"))"
            $ResultStore        += $Call.Content | ConvertFrom-Json
            $Object.searchAfter  = @( $ResultStore | Select-Object -Last 1 -ExpandProperty "id" )
            Write-Progress -Activity "Searching $Index." -Status "$($ResultStore.Count) of $Numb." -PercentComplete ( $ResultStore.Count / $Numb * 100 ) -CurrentOperation $CallUri
        
        } until ( $Numb -le $ResultStore.Count )
        
    }

    end     {

        return $ResultStore
        # return $Call.Content | ConvertFrom-Json

    }

}

function Get-IdnEventTriggers                                   {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/triggers"

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Set-IdnAccessProfileEntitlments                        {

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string]$Id,

        # Parameter help description
        [Parameter(Mandatory=$true)]
        [string[]]$Entitlements,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v2/access-profiles/" + $Id
        
    }
    
    process {
        
        $Object = @{

            entitlements = $Entitlements

        }

        $Body = ConvertTo-Json -InputObject $Object -Depth 10
        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentityEventHistory                            {

    [CmdletBinding()]
    
    param   (

        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Id for the account to search for.")]
        [ValidateLength(32,32)]
        [string]$IdentityLongID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/historical-identities/" + $IdentityLongID  + "/events"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken -ContentType "application/json" -Uri $Uri
            
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnDynamicRoleMembership                           {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Role Id for the account to search for.")]
        [ValidateLength(32,32)]
        [string]$RoleLongID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Start      = 0
        $Limit      = 250
        $TimeStamp  = [int][double]::Parse((Get-Date -UFormat "%s"))
        $Tenant     = Get-IdnTenantDetails -Instance $Instance
        $BaseUri    = $Tenant.ModernBaseUri + "cc/api/role/users/" + $RoleLongID + "/?dc=" + $TimeStamp + "&count=true&limit=" + $Limit
        
    }
    
    process {
        
        do {

            try     {

                $Uri    = $BaseUri + "&start=" + $Start
                $Rest   = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ErrorAction "Stop" 
                $Call  += $Rest.items 
                $Total  = $Rest.total
                $PgTtl  = [Math]::Ceiling($Total / $Limit)
                $Page++
                Write-Progress -Activity "Page $Page of $PgTtl" -Status "Accounts $($Call.Count) of $Total" -PercentComplete ($Call.Count/$Total*100) -CurrentOperation $Uri
                $Start += $Limit

            }

            catch   {

                $PSItem.Exception               | Out-Host
                $PSItem.ErrorDetails.Message    | Out-Host

            }

        } until ($Call.Count -eq $Total)

    }
    
    end     {
    
        return $Call

    }

}

function Start-IdnConfigExport                                  {

    [CmdletBinding( DefaultParameterSetName = "Description" )]
    
    param   (
        
        # Parameter the job Description
        [Parameter(ParameterSetName = "Description",
        Mandatory = $true,
        HelpMessage = "Enter a description for the Export Job.")]
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $true,
        HelpMessage = "Enter a description for the Export Job.")]
        [string]$Description,

        # Parameter for types to Exclude.
        [Parameter(ParameterSetName = "Description",
        Mandatory = $false,
        HelpMessage = "Select which Object Types to Include.  This Parameter takes precedence over the ExcludeTypes parameter.")]
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Select which Object Types to Include.  This Parameter takes precedence over the ExcludeTypes parameter.")]
        [ValidateSet("SOURCE","RULE","IDENTITY_PROFILE","TRANSFORM","TRIGGER_SUBSCRIPTION")]
        [string[]]$IncludeTypes,
        
        # Parameter for types to Exclude.
        [Parameter(ParameterSetName = "Description",
        Mandatory = $false,
        HelpMessage = "Select which Object Types to Exclude.  IncludeTypes takes precedent.")]
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Select which Object Types to Exclude.  IncludeTypes takes precedent.")]
        [ValidateSet("SOURCE","RULE","IDENTITY_PROFILE","TRANSFORM","TRIGGER_SUBSCRIPTION")]
        [string[]]$ExcludeTypes,

        # Parameter for Object Type to get additional details.
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $true,
        HelpMessage = "Choose witch Config Type to specify additional options for.")]
        [ValidateSet("SOURCE","RULE","IDENTITY_PROFILE","TRANSFORM","TRIGGER_SUBSCRIPTION")]
        [string]$AdditionalOptionsForConfigType,

        # Parameter for Objects to Include.
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Enter IDs to include for the requested Type.")]
        [string[]]$IncludeIDs,
        
        # Parameter for Names to Include.
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Enter the Names to include for the requested Type.")]
        [string[]]$IncludeNames,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(ParameterSetName = "Description",
        Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/export"
        
        $Table = [ordered]@{

            description     = $Description    
            excludeTypes    = @()
            includeTypes    = @()
            objectOptions   = @{}

        } 

    }
    
    process {

        switch ($PSBoundParameters.Keys) {

            "ExcludeTypes"                      { 
                
                $Table.excludeTypes += $ExcludeTypes 
            
            }

            "IncludeTypes"                      { 
                
                $Table.excludeTypes += $IncludeTypes 
            
            }

            "AdditionalOptionsForConfigType"    { 

                $IncludeHash = @{

                    includedIds     = @()
                    includedNames   = @()
    
                }
    
                $Table.objectOptions.Add( $AdditionalOptionsForConfigType , $IncludeHash )

            }

            "IncludeIDs"                       {

                $Table.objectOptions.includedIds += $IncludeIDs

            }
            
            "IncludeNames"                       {

                $Table.objectOptions.includedNames += $IncludeNames

            }
            
        }

        if ($AdditionalOptionsForConfigType) {

            

        }
        
        $Body = ConvertTo-Json      -InputObject    $Table -Depth   10
        $Call = Invoke-RestMethod   -Method         "Post" -Uri     $Uri -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnConfigExportStatus                              {

    [CmdletBinding()]
    
    param   (
        
        # Parameter the job ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the GUID for Export Job ID.")]
        [guid]$JobID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/export/" + $JobID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Receive-IdnConfigExportStatus                          {

    [CmdletBinding()]
    
    param   (
        
        # Parameter the job ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the GUID for Export Job ID.")]
        [guid]$JobID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/export/" + $JobID + "/download"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnConfigObjectDetails                             {

    [CmdletBinding()]
    
    param   (
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/config-objects"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Move-IdnAccountToNewIdentity                           {

    [CmdletBinding()]
    
    param   (
        
        # Parameter the Account ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long ID for the Account to move.")]
        [ValidateLength(32,32)]
        [string]$AccountID,

        # Parameter for the Identity ID
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long ID for the Identity to move the account to.")]
        [ValidateLength(32,32)]
        [string]$NewIdentityLongID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/accounts/" + $AccountID 
        
    }
    
    process {

        $Object = @(

            @{

                op      = "replace"
                path    = "/identityId"
                value   = $NewIdentityLongID

            }

        )

        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-WebRequest   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json-patch+json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnIdentityRoles                                   {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string]$IdentityExternalID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
                
    }
    
    process {
    
        $Uri    = $Tenant.ModernBaseUri + "beta/roles/identity/" + $IdentityExternalID + "/roles"
        $Call   = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentities                                      {

    [CmdletBinding()]

    param   (

        # Parameter specifying the number of accounts to return.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a comma separated list of attributes to query.")]
        [string[]]$includeAttributes,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/search"
        $Call           = @()
        $searchAfter    = ''
        $queryCount     = 250
        if ($includeAttributes -notcontains 'name') {$includeAttributes += 'name'}

    }

    process {

        do {

            try     {

                $body = @{

                    indices     = @('identities')

                    query       = @{

                        query   = '*'

                    }

                    sort        = @('+name')

                    queryResultFilter = @{

                        includes = @($includeAttributes)
                        
                    }

                    searchAfter = @($searchAfter)

                } | ConvertTo-Json
                Write-Progress -Activity "Seach in Progress" -Status "Queried $($queryCount) Identities"
                $Response = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken -Body $body -ContentType 'application/json' -ErrorAction "Stop"
                $Call += $Response
                $searchAfter = $Response[-1].name
                $queryCount += 250

            }

            catch   {

                $PSItem.Exception               | Out-Host
                $PSItem.ErrorDetails.Message    | Out-Host

            }

        } until ($Response.Count -lt '250')

    }

    end     {

        return $Call

    }

}

function Reset-IdnSource                                        {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(6,10)]
        [string[]]$SourceId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        
    }
    
    process {


        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/reset/" + $Source
        $Call   = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnManagedClusters                                 {
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/managed-clusters"

    }

    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

    }

    end     {

        return $Call

    }

}

function Get-IdnManagedCluster                                  {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for Clusteer ID
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the cluster.")]
        [string]$ClusterID

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/managed-clusters/" + $ClusterID

    }

    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

    }

    end     {

        return $Call

    }

}

function Get-IdnManagedClientStatus                             {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for Client ID
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the client.")]
        [string]$ClientID

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/managed-clients/" + $ClientID

    }

    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken

    }

    end     {

        return $Call

    }

}

function Initialize-IdnTransformRule                            {

    [CmdletBinding()]
    
    param   (

        [Parameter( ParameterSetName = 'AccountAttributeRule'   , Mandatory = $false )][Switch]$AccountAttributeRule    ,
        [Parameter( ParameterSetName = 'FirstValidRule'         , Mandatory = $false )][Switch]$FirstValidRule          ,
        [Parameter( ParameterSetName = 'LookupRule'             , Mandatory = $false )][Switch]$LookupRule              ,

        # Parameter for the Rule Name
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a name for the new Transform Rule.")]
        [string]$RuleName,

        # Parameter for the Source ID.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $true,
        HelpMessage = "Enter the Long ID for the Source.")]
        [ValidateLength(32,32)]
        [string]$LongSourceID,

        # Parameter for the Attribute Name.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $true,
        HelpMessage = "Enter the name of the Account Attribute to retrieve.")]
        [string]$AccountAttibuteName,
        
        # Parameter for the Account Property Filter.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $false,
        HelpMessage = "Enter the Account Property Filter Criteria.")]
        [string]$AccountPropertyFilter,
        
        # Parameter for the Account Filter.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $false,
        HelpMessage = "Enter the Filter Criteria.")]
        [string]$AccountFilter,

        # Parameter for the Sort Attribute.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $false,
        HelpMessage = "Enter the Account Attribute to sort by.")]
        [string]$SortAttribute,

        # Switch for the returning first link only.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $false,
        HelpMessage = "Switch to return only the first account.")]
        [switch]$ReturnFirstOnly,

        # Switch for the Sort Attribute.
        [Parameter(ParameterSetName = "AccountAttributeRule",
        Mandatory = $false,
        HelpMessage = "Switch to set the sort order to Descending.")]
        [switch]$EnableDescendingSort

    )
    
    begin   {

        $Type = $PSCmdlet.ParameterSetName
        $Rule = New-Object -TypeName $Type
        
    }
    
    process {

        switch ($Type) {

            "AccountAttributeRule"  { $Rule.SetRequiredAttributes( $LongSourceID , $RuleName , $AccountAttibuteName ) }              
            "FirstValidRule"        { $Rule.SetRequiredAttributes( $RuleName                                        ) }
            "LookupRule"            { $Rule.SetRequiredAttributes( $RuleName                                        ) }
        
        }

        switch ($PSBoundParameters.Keys) {

            "AccountFilter"         { $Rule.SetAccountFilter(           $AccountFilter          ) }     
            "AccountPropertyFilter" { $Rule.SetAccountPropertyFilter(   $AccountPropertyFilter  ) }  
            "SortAttribute"         { $Rule.SetSortProperty(            $SortAttribute          ) }
            "ReturnFirstOnly"       { $Rule.EnableReturnFirstLink(                              ) }
            "EnableDescendingSort"  { $Rule.EnableDescendingSort(                               ) }

        }
        
    }
    
    end     {

        return $Rule
        
    }

}

function Initialize-IdnIdentityAttribute                        {

    [CmdletBinding()]

    param   (

        [Parameter( ParameterSetName = 'ReferencePatch'         , Mandatory = $false )][Switch]$ReferencePatch          ,
        [Parameter( ParameterSetName = 'ReferencePatchAdd'      , Mandatory = $false )][Switch]$ReferencePatchAdd       ,
        [Parameter( ParameterSetName = 'ReferencePatchReplace'  , Mandatory = $false )][Switch]$ReferencePatchReplace   ,
        [Parameter( ParameterSetName = 'AccountAttributePatch'  , Mandatory = $false )][Switch]$AccountAttributePatch   ,
     
        # Parameter for insert position
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the index of the Idenity Attribute.  For Adds the new attribute will be inserted above the item at this Index.")]
        [int32]$Index,
        
        # Parameter for the Transform Name
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Identity attribute this is for.")]
        [string]$IdentityAttribute,

        # Parameter for Source ID
        [Parameter(<# ParameterSetName = "AccountAttributePatch", #>
        Mandatory = $true,
        HelpMessage = "Enter the Source ID to pull the attribute from.")]
        [string]$SourceLongID,

        # Parameter Source Name
        [Parameter(<# ParameterSetName = "AccountAttributePatch", #>
        Mandatory = $true,
        HelpMessage = "Enter the Name of the Source Name.")]
        [string]$SourceName,

        # Parameter Source Attribute
        [Parameter(<# ParameterSetName = "AccountAttributePatch", #>
        Mandatory = $true,
        HelpMessage = "Enter the Attribute Name to pull from the Source.")]
        [string]$SourceAttribute,

        # Parameter for the Transform Name
        [Parameter(ParameterSetName = "ReferencePatch",
        Mandatory = $true,
        HelpMessage = "Enter the name of the Transform Rule to Apply.")]
        [Parameter(ParameterSetName = "ReferencePatchReplace",
        Mandatory = $true,
        HelpMessage = "Enter the name of the Transform Rule to Apply.")]
        [string]$TransformRuleToApply

    )

    begin   {

        $Type   = $PSCmdlet.ParameterSetName
        $Patch  = New-Object -TypeName $Type

    }

    process {

        switch ($Type) {

            "ReferencePatchAdd"     { $Patch.ProvideRequiredProperties( $Index , $TransformRuleToApply  , $IdentityAttribute                                                            )   }
            "AccountAttributePatch" { $Patch.ProvideRequiredProperties( $Index , $IdentityAttribute     , $SourceLongID         , $SourceName , $SourceAttribute                        )   }
            "ReferencePatch"        { $Patch.ProvideRequiredProperties( $Index , $TransformRuleToApply  , $IdentityAttribute    , $SourceName , $SourceLongID       , $SourceAttribute  )   }
            "ReferencePatchReplace" { $Patch.ProvideRequiredProperties( $Index , $TransformRuleToApply  , $IdentityAttribute    , $SourceName , $SourceLongID       , $SourceAttribute  )   }
            Default                 { Write-Warning "$Type has not been configured yet." ; $Patch = $null                                                                                   }
        
        }

    }

    end     {

        return $Patch

    }

}

function Add-IdnAccessProfileToRole                             {

    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$RoleLongID,

        # Parameter for AP ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Access Profile to Add.")]
        [ValidateLength(32,32)]
        [string]$AccessProfileLongID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance

    }

    process {

        $Access = Get-IdnAccessProfile -Token $Token -Id $AccessProfileLongID -Instance $Instance -ErrorAction "Stop"
        
        if ($Access) {

            $Array           = @()
            $Patch           = New-Object -TypeName "IdnAddEntitlmentToRole"
            $Uri             = $Tenant.ModernBaseUri + "beta/roles/" + $RoleLongID
            $Patch.value.id  = $Access.id
            $Array          += $Patch

            $Body = ConvertTo-Json      -InputObject    $Array  -Depth  10
            $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json-patch+json"

        }

    }

    end     {

        return $Call

    }

}

function Remove-IdnAccessProfileFromRole                        {

    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$RoleLongID,

        # Switch to remove First entry.
        [Parameter(ParameterSetName = "First",
        Mandatory = $true)]
        [switch]$RemoveFirst,

        # Switch to remove First entry.
        [Parameter(ParameterSetName = "Last",
        Mandatory = $true)]
        [switch]$RemoveLast,

        # Parameter for specifing the Index
        [Parameter(ParameterSetName = "Index",
        Mandatory = $true)]
        [ValidateScript({(if ($_ -ge 1) {$true} else {throw "The number provided must be greater than or equal to 1.  Use the RemoveLast or RemoveFirst Switches to remove the first or last entry."})})]
        [int32]$Index,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )

    begin   {

        $Remove = New-Object            -TypeName "IdnRemoveEntitlmentFromRole"
        $Tenant = Get-IdnTenantDetails  -Instance $Instance


    }

    process {

        $Uri            = $Tenant.ModernBaseUri + "beta/roles/" + $RoleLongID
        $Remove.path   += switch ($PSCmdlet.ParameterSetName) {

            "Last"      { "-"       }
            "First"     { "0"       }
            Default     { $Index    }

        }
    
        $Body = ConvertTo-Json      -InputObject    @($Remove)  -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch"     -Uri    $Uri -Headers $Tenant.TenantToken -Body $Body -ContentType "application/json-patch+json"

    }

    end     {

        return $Call

    }

}

function Get-IdnRoleMembership                                  {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for specifying the Id of the account to retrieve.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the Role Id for the account to search for.")]
        [ValidateLength(32,32)]
        [string]$RoleLongID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
                
        $Tenant = Get-IdnTenantDetails  -Instance $Instance

    }
    
    process {
        
        $Uri    = $Tenant.ModernBaseUri + "beta/roles/" + $RoleLongID + "/assigned-identities"
        $First  = $Uri + "?count=true"
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.ModernBaseUri -ErrorAction "Stop" 

        if ($Rest) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken -StartUri $Uri -OffsetIncrease 250 -Total $Total
                $Array.AddRange( $Pages )

            }

        }
    
    }
    
    end     {
    
        return $Array

    }

}

function Search-IdnEvents                                       {

    [CmdletBinding( DefaultParameterSetName = "Bulk" )]

    param   (

        # Parameter for inserting the query.
        [Parameter(ParameterSetName = "Query",
        Mandatory = $true,
        HelpMessage = "Enter the query to submit.")]
        [string]$Query,

        # Parameter for the name of a Source
        [Parameter(ParameterSetName = "Sourcename",
        Mandatory = $true,
        HelpMessage = "Enter the Name of the Source to search for Identities that have accounts.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Enter the Name of the Source to search for Identities that have accounts.")]
        [string]$SourceName,

        # Parameter for the Source Long ID.
        [Parameter(ParameterSetName = "SourceID",
        Mandatory = $true,
        HelpMessage = "Specify the Long ID for the Source.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Specify the Long ID for the Source.")]
        [string]$LongSourceID,

        # Parameter for the number of hours.
        [Parameter(ParameterSetName = "Hours",
        Mandatory = $true,
        HelpMessage = "Specify the number hours to search Account creations for.")]
        [Parameter(ParameterSetName = "Bulk",
        Mandatory = $false,
        HelpMessage = "Specify the number hours to search Account creations for.")]
        [int32]$Hours,

        # Parameter for Limit.
        [Parameter(Mandatory = $false,
        HelpMessage = "Set the number if items to return per page, default is the max of 250.")]
        [ValidateRange(1 , 250)]
        [int32]$Limit = 250,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant         = Get-IdnTenantDetails -Instance $Instance
        $Uri            = $Tenant.ModernBaseUri + "v3/search?limit=" + $Limit
        $First          = $Uri + "&count=true"
        $SearchStrings  = @()
    
    }

    process {

        switch ($PSBoundParameters.Keys) {

            'Query'         { $SearchStrings += $Query                                                          }
            'LongSourceID'  { $SearchStrings += '(attributes.appId:"'           + $LongSourceID + '")'          }
            'SourceName'    { $SearchStrings += '(attributes.cloudAppName:"'    + $SourceName   + '")'          }
            'Hours'         { $SearchStrings += '(created:[now-'                + $Hours        + 'h TO now])'  }
            
        }

        $Search = $SearchStrings -join " AND "

        $Object = @{

            indices     = @(

                "events"

            )

            query = @{

                query = $Search 

            }

            sort        = @("+id")

        }

        $Body = ConvertTo-Json -InputObject $Object -Depth 10
        $Rest = Invoke-WebRequest -Method "Post" -Uri $First -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body 

        if ($Rest.Content.Length -ge 3) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Object.Add( "searchAfter" , @( $Begin | Select-Object -Last 1 -ExpandProperty "id" ) )
                $Pages = Invoke-IdnElasticPaging -Token $Tenant.TenantToken -StartUri $Uri -ElasticBody $Object -Total $Total -PerPage $Limit
                $Array.AddRange( $Pages )

            }

        }
    
    }

    end     {

        return $Array

    }

}

function Search-IdnCustom                                       {

    [CmdletBinding( DefaultParameterSetName = "Bulk" )]

    param   (

        # Parameter for Index to search.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify which Index to search against.")]
        [ValidateSet("accessprofiles", "accountactivities", "entitlements", "events", "identities", "roles")]
        [string]$Index,

        # Parameter for inserting the query.
        [Parameter(ParameterSetName = "Query",
        Mandatory = $true,
        HelpMessage = "Enter the query to submit.")]
        [string]$Query,

        # Parameter for Limit.
        [Parameter(Mandatory = $false,
        HelpMessage = "Set the number if items to return per page, default is the max of 250.")]
        [ValidateRange(1 , 250)]
        [int32]$Limit = 250,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/search?limit=" + $Limit
        $First  = $Uri + "&count=true"
    
    }

    process {

        $Object = @{

            indices     = @(

                $Index

            )

            query = @{

                query = $Query 

            }

            sort        = @("+id")

        }

        $Body = ConvertTo-Json -InputObject $Object -Depth 10
        $Rest = Invoke-WebRequest -Method "Post" -Uri $First -Headers $Tenant.TenantToken -ContentType "application/json" -Body $Body 

        if ($Rest.Content.Length -ge 3) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Object.Add( "searchAfter" , @( $Begin | Select-Object -Last 1 -ExpandProperty "id" ) )
                $Pages = Invoke-IdnElasticPaging -Token $Tenant.TenantToken -StartUri $Uri -ElasticBody $Object -Total $Total -PerPage $Limit
                $Array.AddRange( $Pages )

            }

        }
    
    }

    end     {

        return $Array

    }

}

function Add-IdnRoleCriteria                                    {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're updating.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter for String Operation. 
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the Operation to performon.")]
        [ValidateSet("EQUALS", "NOT_EQUALS", "CONTAINS", "STARTS_WITH", "ENDS_WITH", "AND", "OR")]
        [string]$StringOperation,

        [ValidateSet("IDENTITY", "ACCOUNT", "ENTITLEMENT")]
        [string]$Type,

        [string]$Property,

        [string]$StringValue,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant     = Get-IdnTenantDetails  -Instance $Instance
        $Patch      = New-Object            -TypeName "IdnRolePatch"
        $Uri        = $Tenant.ModernBaseUri + "beta/roles/" + $Id
        $PrePend    = "attribute."          + $Property
                
    }
    
    process {

        $Patch.SetCriteria( $StringOperation , $Type , $PrePend , $StringValue )
        $Body = ConvertTo-Json      -InputObject    $Patch  -Depth  10
        $Call = Invoke-RestMethod   -Uri            $Uri    -Method "Patch" -Headers $Tenant.TenantToken -ContentType "application/json-patch+json" -Body $Body
        
    }
    
    end     {

        return $Call 
        
    }
    
}

function Import-IdnSourceEntitlements                           {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for specifying the Id of the source.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the source's cloud external Id.")]
        [string]$SourceID,
        
        # Parameter for the csv file to post.
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide the path to the CSV to send.")]
        [string]$CSVPath,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/loadEntitlements/" + $SourceID
        
    }
    
    process {

        $fileBytes  = [System.IO.File       ]::ReadAllBytes(    $CSVPath    )
        $fileEnc    = [System.Text.Encoding ]::GetEncoding(     'UTF-8'     ).GetString( $fileBytes )
        $boundary   = New-Guid
        $Content    = 'multipart/form-data; boundary="{0}"' -f $boundary.Guid
        $LF         = "`r`n"

        $bodyLines = (

            "--$boundary",
            "Content-Disposition: form-data; name=`"file`"; filename=`"$CSVPath`"",
            '',
            $fileEnc,
            "--$boundary"

        ) -join $LF

        $Rest = Invoke-RestMethod -Uri $Uri -Headers $Tenant.TenantToken -Method "Post" -ContentType $Content -Body $bodyLines -DisableKeepAlive
    
    }
    
    end     {
    
        return $Rest

    }

}

function Import-IdnSourceAccounts                               {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for specifying the Id of the source.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the source's cloud external Id.")]
        [string]$SourceID,
        
        # Parameter for the csv file to post.
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide the path to the CSV to send.")]
        [string]$CSVPath,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/loadAccounts/" + $SourceID

    }
    
    process {

        $fileBytes  = [System.IO.File       ]::ReadAllBytes(    $CSVPath    )
        $fileEnc    = [System.Text.Encoding ]::GetEncoding(     'UTF-8'     ).GetString( $fileBytes )
        $boundary   = New-Guid
        $Content    = 'multipart/form-data; boundary="{0}"' -f $boundary.Guid
        $LF         = "`r`n"

        $bodyLines = (

            "--$boundary",
            "Content-Disposition: form-data; name=`"file`"; filename=`"$CSVPath`"",
            '',
            $fileEnc,
            "--$boundary"

        ) -join $LF

        $Rest = Invoke-RestMethod -Uri $Uri -Headers $Tenant.TenantToken -Method "Post" -ContentType $Content -Body $bodyLines -DisableKeepAlive
    
    }
    
    end     {
    
        return $Rest

    }

}

function Get-IdnTaskStatusLists                                 {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken 

    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnTaskStatus                                      {
    
    [CmdletBinding()]

    param   (

        # Parameter the Task ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID the task to check the status for.")]
        [ValidateLength(32,32)]
        [string]$TaskID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/" + $TaskID
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Token 
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Complete-IdnTask                                       {
    
    [CmdletBinding()]

    param   (

        # Parameter the Task ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID the task to mark complete.")]
        [ValidateLength(32,32)]
        [string]$TaskID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify the Production or SandBox instance to connect to.")]
        [ValidateSet("Production","Sandbox")]
        [string]$Instance = "Production"
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/" + $TaskID
        
    }
    
    process {

        $Task = Get-IdnIdentityTaskStatus -Token $Token -TaskID $TaskID -Instance $Instance

        if ($Task) {

            $Epoch  = Get-Date -Year 1970 -Month 1 -Date 1
            $Added  = $Task.created + 600000
            $Time   = $Epoch.AddMilliseconds($Added)

            $Object = @(

                @{

                    op = "replace"
                    path = "/completionStatus"
                    value = "Success"

                }

                @{

                    op = "replace"
                    path = "/completed"
                    value = $Time.ToString("yyyy-MM-ddTHH:mm:ss.fffZ")

                }

            )

            $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
            $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -ContentType "application/json-patch+json" -Headers $Token -Body $Body
            
        }

    }
    
    end     {

        return $Call
        
    }
    
}

<#
  _________________________
 |                         |
 | END OF PUBLIC FUNCTIONS |
 |_________________________|

#>

##############################################################################################################################################################################################################
