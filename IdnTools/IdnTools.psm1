<#
  ___________________________________________________________________________________________________________________________________________________________________________________________________________
 |                                                                                                                                                                                                           |
 |                                                                                                                                                                                                           |
 | Title         : IdnTools.psm1                                                                                                                                                                             |
 | By            : Derek Brown                                                                                                                                                                               |
 | Created       : 06/03/2021                                                                                                                                                                                |
 | Last Modified : 02/26/2024                                                                                                                                                                                |
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
 | Version: 1.53 - Removed Import script & added a  | Version: 1.54 - Added Import and Task management | Version: 1.55 - Fixed Get-IdnAccounts problems   | Version: 1.56 - Added Functions and classes for  |
 |                 function set org names.          |                 commands.                        |                 with its Parameters.             |                 building Standard Roles.         |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.57 - Add functions to Add, Replace &  | Version: 1.58 - Updated Get-Identites function   | Version: 1.59 - Added support for Ambassador     | Version: 1.60 - Added Filter support for APs,    |
 |                 remove Entitlements for APs.     |                 to use Identities endpoint.      |                 Tenants & Updated how the Tenant |                 Roles and Sources.               |
 |                                                  |                                                  |                 settings variabl works.          |                                                  |
 |                                                  |                                                  |                                                  |                                                  |
 | Version: 1.61 - Added Account & Entitlement      | Version: 1.62 - Added support for Role Criteria  | Version: 1.63 - Basic options for creating       | Version: 1.64 - Added support for ceating more   |
 |                 aggregation cmdlts & Classes for |                 in Update function.              |                 delimited file sources and for   |                 Transforms and getting Identity  |
 |                 Provisioning Criteria on APs.    |                                                  |                 deleting source schemas.         |                 Attributes                       |
 |                                                  |                                                  |                                                  |                                                  |
 |__________________________________________________|__________________________________________________|__________________________________________________|__________________________________________________|
 
#>

##############################################################################################################################################################################################################

<#
  __________________
 |                  |
 | START OF CLASSES |
 |__________________|

#>

class IdnPAT                                                    {
    
    [string         ]$ClientID 
    [securestring   ]$ClientSecret

    IdnPAT( [string] $ID , [securestring]$Secret ) {

        $this.ClientID      = $ID
        $this.ClientSecret  = $Secret

    }

}

class IdnBearerToken                                            {

    [hashtable]$Bearer = @{}

    IdnBearerToken( $Hash ) {

        $this.Bearer = $Hash

    }

}

class IdnContext                                                {

    [string     ]$token_type
    [datetime   ]$expires_in
    [string     ]$scope
    [string     ]$tenant_id
    [string     ]$pod
    [string     ]$strong_auth_supported
    [string     ]$org
    [string     ]$identity_id
    [string     ]$user_name
    [string     ]$strong_auth
    [string     ]$jti

}

class IdnProductionTenant                                       {

    [string         ]$ModernBaseUri
    [string         ]$LegacyBaseUri
    [IdnPAT         ]$PAT
    [IdnBearerToken ]$TenantToken
    [object         ]$Context


    IdnProductionTenant(    [string]$OrgName    ) {

        $this.ModernBaseUri = "https://{0}.api.identitynow.com/"    -f $OrgName
        $this.LegacyBaseUri = "https://{0}.identitynow.com/"        -f $OrgName
        
    }

    SetPAT(                 [IdnPAT]$PAT        ) {
        
        $this.PAT = $PAT

    }

    RefreshToken(                               ) {

        $BSTRID = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $this.PAT.ClientSecret  )
        $Plain  = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(    $BSTRID                 )
        $Uri    = "{0}oauth/token?grant_type=client_credentials&client_id={1}&client_secret={2}" -f $this.ModernBaseUri , $this.PAT.ClientID , $Plain
        $Time   = Get-Date
        $Call   = Invoke-RestMethod -Method "Post" -Uri $Uri 
        
        if ($Call) {

            $Bearer = [ordered]@{

                "Authorization" = "Bearer "     + $Call.access_token
                "cache-control" = "no-cache"

            }

            $Call.expires_in    = $Time.AddSeconds( $Call.expires_in ) 
            $Info               = $Call | Select-Object "*" -ExcludeProperty "access_token"
            $this.TenantToken   = [IdnBearerToken   ]::new( $Bearer )
            $this.Context       = [IdnContext       ]$Info
        
        }

    }
    
}

class IdnAmbassadorTenant                                       {

    [string         ]$ModernBaseUri
    [string         ]$LegacyBaseUri
    [IdnPAT         ]$PAT
    [IdnBearerToken ]$TenantToken
    [object         ]$Context


    IdnAmbassadorTenant(    [string]$OrgName    ) {

        $this.ModernBaseUri = "https://{0}.api.identitynow-demo.com/"    -f $OrgName
        $this.LegacyBaseUri = "https://{0}.identitynow-demo.com/"        -f $OrgName
        
    }

    SetPAT(                 [IdnPAT]$PAT        ) {

        $this.PAT = $PAT

    }

    RefreshToken(                               ) {

        $BSTRID = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $this.PAT.ClientSecret  )
        $Plain  = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(    $BSTRID                 )
        $Uri    = "{0}oauth/token?grant_type=client_credentials&client_id={1}&client_secret={2}" -f $this.ModernBaseUri , $this.PAT.ClientID , $Plain
        $Time   = Get-Date
        $Call   = Invoke-RestMethod -Method "Post" -Uri $Uri 
        
        if ($Call) {

            $Bearer = [ordered]@{

                "Authorization" = "Bearer "     + $Call.access_token
                "cache-control" = "no-cache"

            }

            $Call.expires_in    = $Time.AddSeconds( $Call.expires_in ) 
            $Info               = $Call | Select-Object "*" -ExcludeProperty "access_token"
            $this.TenantToken   = [IdnBearerToken   ]::new( $Bearer )
            $this.Context       = [IdnContext       ]$Info
        
        }

    }
    
}
 
class IdnConnectionDetails                                      {

    [ValidateSet("Production","Sandbox","Ambassador")]
    [string                 ]$DefaultInstance = "Production"
    [IdnProductionTenant    ]$Production
    [IdnProductionTenant    ]$Sandbox
    [IdnAmbassadorTenant    ]$Ambassador
    
    IdnConnectionDetails(                       ) {

        $Names = Import-IdnConfigSettings
        $Prod = [IdnProductionTenant]::new( $Names.IdnProd      )
        $Sand = [IdnProductionTenant]::new( $Names.IdnSandbox   )

        if ($Names.IdnAmbassador) {

            $Amb = [IdnAmbassadorTenant]::new( $Names.IdnAmbassador )
            $this.Ambassador = $Amb 

        }

        $this.Production    = $Prod
        $this.Sandbox       = $Sand

    }

    SetDefaultInstance( [string]$DefaultChoice  ) {

        $this.DefaultInstance = $DefaultChoice

    }

}

class IdnTransformLogicBase                                     {

    [object]$attributes = @{}
    [string]$type

}

class IdnIdentityAttributePatchNewLogic                         {

    [ValidateSet( "add" , "remove" , "replace" , "move" , "copy" , "test" )][string]$op
    [string     ]$path
    [hashtable  ]$value = @{

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

    [string     ]$op    = "add"
    [string     ]$path  = "/membership/criteria/children/-"
    [hashtable  ]$value = [ordered]@{}

    [void]SetCriteria( [string]$StringOp , [string]$Type , [string]$Prop , [string]$String ) {

        $this.value.Add(        "operation"     , $StringOp )
        $this.value.Add(        "key"           , @{}       )
        $this.value.Add(        "stringValue"   , $String   )
        $this.value.key.Add(    "type"          , $Type     )
        $this.value.key.Add(    "property"      , $Prop     )
        
    }

}

class RoleCriteriaChildItem                                     {
    
    [ValidateSet( "EQUALS", "NOT_EQUALS", "CONTAINS", "STARTS_WITH", "ENDS_WITH", "AND", "OR" )]
    [string                 ]$operation
    [PSCustomObject         ]$key
    [string                 ]$stringValue
    [RoleCriteriaChildItem[]]$children     #= @()

    [void]SetAndChild(                                                      ) {

        $this.operation     = 'AND'
        $this.key           = $null
        $this.stringValue   = ""

    }

    [void]SetOrChild(                                                       ) {

        $this.operation     = 'OR'
        $this.key           = $null
        $this.stringValue   = ""
        
    }

    [void]SetAccountKey(        $Ops    , $StringVal , $Poperty , $SourceID ) {

        $this.operation     = $Ops
        $this.stringValue   = $StringVal
        $this.key           = [PSCustomObject]@{

            type        = "ACCOUNT"                 
            property    = "attribute.$($Poperty)" 
            sourceId    = $SourceID                 

        }

    }

    [void]SetEntitlementKey(    $Ops    , $StringVal , $SourceID            ) {

        $this.operation     = $Ops
        $this.stringValue   = $StringVal
        $this.key           = [PSCustomObject]@{

            type        = "ENTITLEMENT"         
            property    = "attribute.memberOf"
            sourceId    = $SourceID             

        }

    }

    [void]SetIdentityKey(       $Ops    , $StringVal , $Poperty             ) {

        $this.operation     = $Ops
        $this.stringValue   = $StringVal
        $this.key           = [PSCustomObject]@{

            type        = "IDENTITY"                
            property    = "attribute.$($Poperty)" 
            sourceId    = ""                        

        }

    }

    [void]AddNestedChild(       $Child                                      ) {

        $this.children += $Child

    }

}

class StandardRoleCriteria                                      {

    [string                 ]$type          = "STANDARD"
    [RoleCriteriaChildItem  ]$criteria      
    [NullString             ]$identities    = $null

    [void]AddChildren( $Child ) {

        $this.criteria = $Child

    }

    [void]SetGroupOperator( $Operator ) {

        $this.criteria = New-Object "RoleCriteriaChildItem"
        $this.criteria.operation = $Operator
        $this.criteria.key = $null
        $this.criteria.stringValue = ""

    }

}

class IdnProvisioningCriteriaAP                                 {

    [ValidateSet( "OR" , "AND" )]
    [string                         ]$operation
    [System.Collections.ArrayList   ]$children = @()

    IdnProvisioningCriteriaAP( $Op ) {

        $this.operation = $Op

    }

    AddChildren( $Child ) {

        $this.children.Add( $Child ) | Out-Null

    }

}

class IdnProvisioningChild                                      {

    [string]$attribute
    [ValidateSet( "EQUALS" , "NOT_EQUALS" , "CONTAINS" , "HAS" )]
    [string]$operation
    [string]$value

    IdnProvisioningChild( $attr , $ops , $val ) {

        $this.attribute = $attr
        $this.operation = $ops 
        $this.value     = $val

    }

}

class IdnSource                                                 {

    [string     ]$name
    [string     ]$description
    [string     ]$connector
    [hashtable  ]$owner = @{

        type = 'IDENTITY'

    }

    IdnSource( $name , $dsc , $cntr , $ownid , $ownName ) {

        $this.name          = $name
        $this.description   = $dsc
        $this.connector     = $cntr

        $this.owner.Add( 'id'   , $ownid    )
        $this.owner.Add( 'name' , $ownName  )

    }

}

class AccountAttributeLogic : IdnTransformLogicBase              {

    [void]SetRequiredAttributes( [string]$SourceLongID , [string]$TargetProperty ) {

        $this.attributes.applicationId  = $SourceLongID
        $this.attributes.attributeName  = $TargetProperty
    }

    [void]EnableDescendingSort(                                 ) { $this.attributes.Add( "accountSortDescending"   , $true             ) }
    [void]EnableReturnFirstLink(                                ) { $this.attributes.Add( "accountReturnFirstLink " , $true             ) }
    [void]SetSortProperty(              [string]$SortProperty   ) { $this.attributes.Add( "accountSortAttribute"    , $SortProperty     ) }
    [void]SetAccountFilter(             [string]$AcctFilter     ) { $this.attributes.Add( "accountFilter"           , $AcctFilter       ) }
    [void]SetAccountPropertyFilter (    [string]$PropertyFilter ) { $this.attributes.Add( "accountPropertyFilter"   , $PropertyFilter   ) }

    AccountAttributeLogic() {        

        $this.type = "accountAttribute"
        $this.attributes.Add( "applicationId" , "" )
        $this.attributes.Add( "attributeName" , "" )
    
    }

}

class ConditionalLogic      : IdnTransformLogicBase              {

    ConditionalLogic() {

        $this.type = "conditional"

    }

    SetRequiredAttributes( $test , $target , $passed , $failed ) {

        $this.attributes.Add( "expression"          , ( "{0} eq {1}" -f $test , $target )    )
        $this.attributes.Add( "positiveCondition"   , $passed   )
        $this.attributes.Add( "negativeCondition"   , $failed   )

    }

    AddVariable( $Var , $Transform ) {

        $this.attributes.Add( $Var , $Transform )

    }

}

class DateFormatLogic       : IdnTransformLogicBase              {

    DateFormatLogic(                 ) { $this.type =            "dateFormat"                            }
    AddInputFormat(     $InForm     ) { $this.attributes.Add(   "inputFormat"             , $InForm   ) }
    AddOutputFormat(    $OutForm    ) { $this.attributes.Add(   "outputFormat"            , $OutForm  ) }
    SetPeriodicRefresh( $Set        ) { $this.attributes.Add(   "requiresPeriodicRefresh" , $Set      ) }
    AddInputTransform(  $Rule       ) { $this.attributes.Add(   "input"                   , $Rule     ) }

}

class StaticLogic           : IdnTransformLogicBase              {

    StaticRule( ) {

        $this.type = "static"
        $this.attributes.Add( "value" , "" )

    }

    SetRequiredAttributes( $Value ) {

        $this.attributes.value = $Value

    }

}

class DateCompareLogic      : IdnTransformLogicBase              {

    DateCompareLogic() {

        $this.type = "dateCompare"
        $this.attributes.Add( "firstDate"           , $null     )
        $this.attributes.Add( "secondDate"          , $null     )

    }

    SetRequiredAttributes( $Op , $Passed , $Failed ) {

        $this.attributes.Add( "operator"            , $Op       )
        $this.attributes.Add( "positiveCondition"   , $Passed   )
        $this.attributes.Add( "negativeCondition"   , $Failed   )

    }

    AddSecondDateTransfrom(  $Logic ) { $this.attributes.secondDate = $Logic    }
    AddFirstDateTransfrom(   $Logic ) { $this.attributes.firstDate  = $Logic    }
    AddSecondDateStaticDate( $Date  ) { $this.attributes.secondDate = $Date.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fff-00")     }
    #AddSecondDateStaticDate( $Date  ) { $this.attributes.secondDate = $Date.ToUniversalTime().ToString("s")     }
    AddFirstDateStaticDate(  $Date  ) { $this.attributes.firstDate  = $Date.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fff-00")     }
    SetFirstDateToNow(              ) { $this.attributes.firstDate  = "now"     }
    SetSecondDatToNow(              ) { $this.attributes.secondDate = "now"     }

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

        $OrgNames = $env:IdnConfig | ConvertFrom-Json
        
    }
    
    end     {

        return $OrgNames
        
    }

}

function Get-IdnTenantDetails                                   {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $true,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance

    )

    begin   {

        $DetailsForTenant = $IdnApiConnectionConfig.$Instance

    }

    process {

        Test-IdnToken -Instance $Instance

    }

    end     {

        return $DetailsForTenant

    }

}

function Invoke-IdnPaging                                       {
    
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
        $UriObj = [System.UriBuilder]::new( $StartUri )
        
    }
    
    process {

        if ($UriObj.Query) {

            $UriObj.Query += "&limit={0}&offset=" -f $OffsetIncrease

        }

        else {

            $UriObj.Query = "limit={0}&offset=" -f $OffsetIncrease

        }
        
        do {

            $Page++
            $Uri =  "$($UriObj.Uri)" + $Offset
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

function Invoke-IdnElasticSearch                                {
    
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

function Test-IdnToken                                          {

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $true,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance 

    )

    begin   {

        $Tenant = $IdnApiConnectionConfig.$Instance
        $Now    = Get-Date

    }

    process {

        if ( $Now -gt $Tenant.Context.expires_in ) {

            $Tenant.RefreshToken()

        }

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

function Update-IdnOrgNames                                     {

    [Alias( 'Update-IdnConfigSettings'  )]
    [CmdletBinding(                     )]
    
    param   (

        # Parameter for Production Org Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Org Name for your Production Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow.com"        -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$ProdName,
        
        # Parameter for Sandbox Org Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Org Name for your Sandbox Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow.com"        -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$SandboxName,

        # Parameter for Ambassador Tenant.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Org Name for your Sandbox Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow-demo.com"   -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$AmbassadorTenant,

        # Parameter for Variable Scrope.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the scope to create the variable.  Valid Options are User, System or LocalOnly.  LocalOnly just updates the Variable in the current session.")]
        [ValidateSet("User" , "System" , "LocalOnly")]
        [string]$Scope
        
    )
    
    begin   {

        $Hash   = @{}
        
    }
    
    process {

        $Hash.Add( "IdnProd"        , $ProdName     )
        $Hash.Add( "IdnSandbox"     , $SandboxName  )

        if ($AmbassadorTenant) {

            $Hash.Add( "IdnAmbassador" , $AmbassadorTenant )

        }

        $Json = ConvertTo-Json -InputObject $Hash

        if ( $Scope -ne "LocalOnly" ) {
        
            [System.Environment]::SetEnvironmentVariable( "IdnConfig" , $Json , $Scope )

        }
        
    }
    
    end     {

        Set-Item -Path "env:IdnConfig" -Value $Json -Force 

    }

}

function Set-IdnOrgNames                                        {

    [Alias( 'Set-IdnConfigSettings' )]
    [CmdletBinding(                 )]
    
    param   (

        # Parameter for Production Org Name.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Org Name for your Production Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow.com"        -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$ProdName,
        
        # Parameter for Sandbox Org Name.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Org Name for your Sandbox Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow.com"        -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$SandboxName,

        # Parameter for Ambassador Tenant.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Org Name for your Sandbox Tenant")]
        [ValidateScript( { if ( Test-Connection "$_.identitynow-demo.com"   -Count 1 ) {$true} else { throw "Failed to ping Tenant with name $_.  Confirm Tenant is up and try again." } } ) ]
        [string]$AmbassadorTenant,

        # Parameter for Variable Scrope.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the scope to create the variable.  Valid Options are User, System or LocalOnly.  LocalOnly just updates the Variable in the current session.")]
        [ValidateSet("User" , "System" , "LocalOnly")]
        [string]$Scope
        
    )
    
    begin   {

        $OrgNames = Import-IdnConfigSettings
        
    }
    
    process {

        switch ( $PSBoundParameters.Keys ) {

            "ProdName"          { $OrgNames.IdnProd       = $ProdName         }
            "SandboxName"       { $OrgNames.IdnSandbox    = $SandboxName      }
            "AmbassadorTenant"  { $OrgNames.IdnAmbassador = $AmbassadorTenant }

        }

        $Json = ConvertTo-Json -InputObject $OrgNames

        if ( $Scope -ne "LocalOnly" ) {
        
            [System.Environment]::SetEnvironmentVariable( "IdnConfig" , $Json , $Scope )

        }
        
    }
    
    end     {

        Set-Item -Path "env:IdnConfig" -Value $Json -Force 

    }

}

function Get-IdnToken                                           {

    [CmdletBinding()]

    param   (

        # Parameter for the Client ID of the Personal Access Token
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Client ID for your Personal Token here.")]
        [ValidateScript( { if ( $env:IdnConfig ) {$true} else { throw 'The $env:IdnConfig variable is missing.  Run Update-IdnConfigSettings to create it.' } } ) ]
        [string]$ClientId,

        # Parameter for the Client Secret of the Personal Access Token
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Client Secret for your Personal Token here.")]
        [securestring]$ClientSecret,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance = "Production"

    )

    begin   {

        if ( -not $IdnApiConnectionConfig ) {

            New-IdnConnectionSettings

        }

        $Tenant  = $IdnApiConnectionConfig.$Instance

    }

    process {

        $Pers = [IdnPAT]::new( $ClientId , $ClientSecret )
        $Tenant.SetPAT( $Pers )
        $IdnApiConnectionConfig.DefaultInstance = $Instance

    }

    end     {

        $Tenant.RefreshToken()

    }

}

function Update-IdnToken                                        {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

    )

    process {

        $Tenant = Get-IdnTenantDetails -Instance $Instance

    }

    end     {

        $Tenant.RefreshToken()

    }

}

function New-IdnConnectionSettings                              {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose to make the starting Default Sandbox or Ambassador.")]
        [ValidateSet( "Sandbox" , "Ambassador" )]
        [string]$Instance

    )

    process {
        
        $Settings = [IdnConnectionDetails]::new()
    }
    
    end     {

        return New-Variable -Name "IdnApiConnectionConfig" -Value $Settings -Scope "Global" -Option "ReadOnly" -Force
        
        if ($Instance) {
        
            $IdnApiConnectionConfig.DefaultInstance = $Instance

        }

    }

}

function Get-IdnTenantContext                                   {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance

    }

    process {

        $Context = $Tenant.Context        

    }

    end     {

        return $Context

    }

}

function Set-IdnDefaultTentant                                  {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $true,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance 

    )

    process {

        $IdnApiConnectionConfig.DefaultInstance = $Instance

    }

    end     {

        $IdnApiConnectionConfig | Out-Host

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

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
                $Rest   = Invoke-WebRequest -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ErrorAction "Stop" 
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production","Sandbox","Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Account in $Id) {

            $Uri   = $Tenant.ModernBaseUri + "beta/identities/" + $Account
            $Call += Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
            
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
        HelpMessage = "Specify the Id for the Identity to Delete.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identities/{1}" -f $Tenant.ModernBaseUri , $Id
                
    }
    
    process {

        $Call = Invoke-WebRequest -Method "Delete" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri | Select-Object StatusCode
                    
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Account in $Id) {

            $Uri   = $Tenant.ModernBaseUri + "beta/historical-identities/" + $Account
            $Call += Invoke-RestMethod -Method Get -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
            
        }
        
    }
    
    end     {

        return $Call
        
    }

}

# V3 version found: https://developer.sailpoint.com/idn/api/v3/set-lifecycle-state
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

# V3 replacment: https://developer.sailpoint.com/idn/api/v3/patch-auth-user/
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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

        $Call = Invoke-WebRequest -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json" | Select-Object StatusCode,StatusDescription
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnSources                                         {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the complete name to search for.")]
        [string]$Name,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Status to search for.")]
        [string]$Status,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Connection Type to search for.")]
        [string]$ConnectionType,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Connector Name to search for.")]
        [string]$ConnectorName,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Owner's ID.")]
        [ValidateLength( 32 , 32 )]
        [string]$OwnedBy,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Search if Source is Authorative or not.")]
        [ValidateSet( "true" , "false" )]
        [string]$IsAuthoritative,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the complete name to search for.")]
        [ValidateSet( "true" , "false" )]
        [string]$IsHealthy,

        # Parameter for Filter Operator.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Filter Operator. Will only apply to criteria using 'friendly' strings.  Default is 'and'.")]
        [ValidateSet("eq" , "sw")]
        [string]$Operator = "eq",

        # Parameter for Filter Operator.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Filter Composite Operator.  Default is 'and'.")]
        [ValidateSet("and","or")]
        [string]$CompositeOperator = "and",

        # Parameter for entering a Custom Filter.
        [Parameter(Mandatory = $true,
        ParameterSetName = "Custom",
        HelpMessage = "Enter a Custom Filter to search Sources for.")]
        [string]$CustomFilter,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Params = @()
        
    }
    
    process {

        switch ( $PSBoundParameters.Keys ) {

            "Name"              { $Params += 'name {0} "{1}"'           -f $Operator , $Name            }
            "Status"            { $Params += 'status {0} "{1}"'         -f $Operator , $Status          }   
            "ConnectionType"    { $Params += 'connectionType {0} "{1}"' -f $Operator , $ConnectionType  }           
            "ConnectorName"     { $Params += 'connectorName {0} "{1}"'  -f $Operator , $ConnectorName   }       
            "IsAuthoritative"   { $Params += 'authoritative eq {0}'     -f $IsAuthoritative             }           
            "OwnedBy"           { $Params += 'owner.id eq "{0}"'        -f $OwnedBy                     }
            "IsHealthy"         { $Params += 'healthy eq "{0}"'         -f $IsHealthy                   }
            "CustomFilter"      { $Params += '{0}'                      -f $CustomFilter                }
        
        }

        $Filter = $Params -join " $CompositeOperator "
        $Uri    = "{0}v3/sources?filters={1}"    -f $Tenant.ModernBaseUri , $Filter
        $First  = "{0}&count=true"              -f $Uri
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.TenantToken.Bearer  

        if ($Rest.Content.Length -ge 3) {

            $Total      = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $SrcesAll   = New-Object -TypeName "System.Collections.ArrayList"
            $Begin      = @( ConvertFrom-Json -InputObject $Rest.Content )
            $SrcesAll.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $Uri -OffsetIncrease 250 -Total $Total
                $SrcesAll.AddRange( $Pages )

            }

        }
        
        #Call = Invoke-RestMethod -Uri $Uri -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json"

    }
    
    end     {

        return $SrcesAll
        
    }

}

function Get-IdnSourceSchemas                                   {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength( 32 ,32 )]
        [string]$SourceId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/schemas"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end     {

        return $Call
        
    }

}

function Remove-IdnSourceSchema                                 {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the source ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source.")]
        [ValidateLength( 32 ,32 )]
        [string]$SourceId,

        # Parameter for the schema ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the schema to delete.")]
        [ValidateLength( 32 ,32 )]
        [string]$SchemaId,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/sources/{1}/schemas/{2}" -f $Tenant.ModernBaseUri , $SourceId , $SchemaId
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Delete" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($Source in $SourceId) {

            $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $Source
            $Call  += Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken.Bearer
            
        }
        
    }
    
    end     {

        return $Call
        
    }

}

# Last Check for V3/Beta was 02/14/2024
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/loadAccounts/" + $SourceShortId
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/account-aggregations/" + $AggregationId + "/status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/provisioning-policies"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId + "/provisioning-policies/" + $UsageType

    }

    process {

        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $JsonPatch -ContentType "application/json-patch+json"

    }

    end     {

        return $Call

    }

}

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $SourceCloudExternalId + "/provisioning-policies/" + $UsageType
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Put" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $JsonUpdate -ContentType "application/json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/sources/" + $SourceLongId + "/provisioning-policies/" + $UsageType 
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Post -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $JsonUpdate -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

} 

function Get-IdnIdentityAttributes                              {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identity-attributes" -f $Tenant.ModernBaseUri
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }

} 

function Get-IdnIdentityAttribute                               {

    [CmdletBinding()]
    
    param   (

        # Parameter for Attribute Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the name of the Identity Attribute to retrieve.")]
        [string]$Name,
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identity-attributes/{1}" -f $Tenant.ModernBaseUri , $Name
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }

} 

function Remove-IdnIdentityAttribute                            {

    [CmdletBinding()]
    
    param   (

        # Parameter for Attribute Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the name of the Identity Attribute to retrieve.")]
        [string]$Name,
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identity-attributes/{1}" -f $Tenant.ModernBaseUri , $Name
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Delete" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }

} 

function Get-IdnTransforms                                      {

    [CmdletBinding()]
    
    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/transforms"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end         {

        return $Call
        
    }

}

function Get-IdnTransform                                       {

    [CmdletBinding()]
    
    param   (

        # Parameter for Transform ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID of the Transform to lookup.")]
        [guid]$ID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/transforms/{1}" -f $Tenant.ModernBaseUri , $ID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end         {

        return $Call
        
    }

}

function Remove-IdnTransform                                       {

    [CmdletBinding()]
    
    param   (

        # Parameter for Transform ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID of the Transform to lookup.")]
        [guid]$ID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/transforms/{1}" -f $Tenant.ModernBaseUri , $ID
        
    }
    
    process {

        $Call = Invoke-WebRequest -Method "Delete" -Uri $Uri -Headers $Tenant.TenantToken.Bearer | Select-Object "StatusCode","StatusDescription"
        
    }
    
    end         {

        return $Call
        
    }

}

function Publish-IdnTransform                                   {

    [CmdletBinding()]
    
    param   (

        # Parameter Transform's Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a name for the Transform.")]
        [string]$Name,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide the Criteria for the new Transform Rule.")]
        [ValidateScript( { if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformLogicBase" ) {$true} else { throw "BaseType is not IdnTransformLogicBase." } } ) ]
        [object]$TransformLogic,

        # Parameter for Requiring regular refreshes
        [Parameter(Mandatory = $false,
        HelpMessage = "Set to True to refresh result during regular refreshes.  Set to False to skip.")]
        [bool]$RequireRefresh,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/transforms"
        
    }
    
    process {

        $TransformLogic | Add-Member -MemberType "NoteProperty" -Name "name" -Value $Name
        $TransformLogic.attributes.Add( "requiresPeriodicRefresh" , $RequireRefresh )

        $RuleConfigAsJson   = ConvertTo-Json    -InputObject    $TransformLogic  -Depth  100
        $Call               = Invoke-RestMethod -Method         "Post"          -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $RuleConfigAsJson -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Update-IdnTransform                                    {

    [CmdletBinding()]
    
    param   (

        # Parameter for the ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Pass the ID of the Transform Rule.")]
        [guid]$RuleID,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide the Criteria for the new Transform Rule.")]
        [ValidateScript( { if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformLogicBase" ) {$true} else { throw "BaseType is not IdnTransformLogicBase." } } ) ]
        [object]$NewLogic,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/transforms/" + $RuleID
        
    }
    
    process {

        if (-not $NewLogic.name) {

            $Current = Get-IdnTransform -ID $RuleID -Instance $Instance
            $NewLogic | Add-Member -MemberType "NoteProperty" -Name "name" -Value $Current.name

        }

        $RuleUpdateJson     = ConvertTo-Json    -InputObject    $NewLogic   -Depth  100
        $Call               = Invoke-RestMethod -Method         "Put"       -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $RuleUpdateJson -ContentType "application/json"
        
    }
    
    end     {

        return $Call
        
    }

}

# No exported in the Manifest.  Retaining for now in case the New Transform command needs broken down into individual ones for teach Type.
function New-IdnTransformForDateFormat                          {

    [CmdletBinding()]

    param (

        # Parameter for Input Template. 
        [Parameter(Mandatory = $true,
        ParameterSetName = "TemplateInput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "TemplateOutput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "CustomOutput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [ValidateSet("ISO8601" , "LDAP" , "PEOPLE_SOFT" , "EPOCH_TIME_JAVA" , "EPOCH_TIME_WIN32")]
        [string]$DateInputTemplate,

        # Parameter for Output Template. 
        [Parameter(Mandatory = $true,
        ParameterSetName = "TemplateOutput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "TemplateInput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "CustomInput",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [ValidateSet("ISO8601" , "LDAP" , "PEOPLE_SOFT" , "EPOCH_TIME_JAVA" , "EPOCH_TIME_WIN32")]
        [string]$DateOutputTemplate,

        # Parameter for Input Custom. 
        [Parameter(Mandatory = $true,
        ParameterSetName = "CustomInput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "TemplateOutput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "CustomOutput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [string]$DateInputCustom,
        
        # Parameter for Input Custom. 
        [Parameter(Mandatory = $true,
        ParameterSetName = "CustomOutput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "TemplateInput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [Parameter(Mandatory = $false,
        ParameterSetName = "CustomInput",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [string]$DateOutputCustom,

        # Parameter for Input Transform
        [Parameter(Mandatory = $false,
        HelpMessage = "Specify a Transform to use for Input.")]
        [string]$Input
        
    )

    begin {
        
        $Conditional = New-Object -TypeName "DateFormatLogic"
        Write-Host $PSCmdlet.ParameterSetName -ForegroundColor Cyan

    }

    process {

        switch ($PSBoundParameters.Keys) {

            "DateInputTemplate"     { $Conditional.AddInputFormat($DateInputTemplate) }
            "DateOutputTemplate"    { $Conditional.AddOutputFormat($DateInputTemplate) }
            "DateInputCustom"       { $Conditional.AddInputFormat($DateInputCustom) }
            "DateOutputCustom"      { $Conditional.AddOutputFormat($DateOutputCustom) }
            "Input"                 { $Conditional.AddInputTransform($Input) }
            
        }

    }

    end {

        return $Conditional

    }

}

function New-IdnTransformLogic                                  {

    [CmdletBinding()]
    
    param   (

        [Parameter( ParameterSetName = 'AccountAttributeLogic'   , Mandatory = $false )][Switch]$AccountAttributeLogic   ,
        [Parameter( ParameterSetName = 'ConditionalLogic'        , Mandatory = $false )][Switch]$ConditionalLogic        ,
        [Parameter( ParameterSetName = 'DateFormatLogic'         , Mandatory = $false )][Switch]$DateFormatLogic         ,
        [Parameter( ParameterSetName = 'StaticLogic'             , Mandatory = $false )][Switch]$StaticLogic             ,
        [Parameter( ParameterSetName = 'DateCompareLogic'        , Mandatory = $false )][Switch]$DateCompareLogic        ,

        # Parameter for Static String.
        [Parameter(Mandatory = $true,
        ParameterSetName = "StaticRule",
        HelpMessage = "Enter the value of the Static String to use.")]
        [string]$StaticString,

        # Parameter for the Source ID.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $true,
        HelpMessage = "Enter the Long ID for the Source.")]
        [ValidateLength(32,32)]
        [string]$LongSourceID,

        # Parameter for the Attribute Name.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $true,
        HelpMessage = "Enter the name of the Account Attribute to retrieve.")]
        [string]$AccountAttibuteName,
        
        # Parameter for the Account Property Filter.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $false,
        HelpMessage = "Enter the Account Property Filter Criteria.")]
        [string]$AccountPropertyFilter,
        
        # Parameter for the Account Filter.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $false,
        HelpMessage = "Enter the Filter Criteria.")]
        [string]$AccountFilter,

        # Parameter for the Sort Attribute.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $false,
        HelpMessage = "Enter the Account Attribute to sort by.")]
        [string]$SortAttribute,

        # Switch for the returning first link only.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $false,
        HelpMessage = "Switch to return only the first account.")]
        [switch]$ReturnFirstOnly,

        # Switch for the Sort Attribute.
        [Parameter(ParameterSetName = "AccountAttributeLogic",
        Mandatory = $false,
        HelpMessage = "Switch to set the sort order to Descending.")]
        [switch]$EnableDescendingSort,

        # Parameter for Test Value.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $true,
        HelpMessage = "Enter the value to test.  This will be on the Left side of the Expression.")]
        [string]$ValueToTest,

        # Parameter for value to test against.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $true,
        HelpMessage = "Enter the value to test against.  This will be on the Right side of the Expression.")]
        [string]$ValueToTestAgainst,

        # Parameter for the True Output.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $true,
        HelpMessage = "Enter the value to use if the test passes.")]
        [string]$ResultIfTrue,

        # Parameter for the False Output.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $true,
        HelpMessage = "Enter the value to use if the test fails.")]
        [string]$ResultIfFalse,

        # Parameter for the Variable's Name.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $false,
        HelpMessage = "Enter the name of the Variable to use.")]
        [string]$VariableName,

        # Parameter for the Variable Transfrom Logic.
        [Parameter(ParameterSetName = "ConditionalLogic",
        Mandatory = $false,
        HelpMessage = "Enter the nested Transform Logic for the Variable.")]
        [ValidateScript( { if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformLogicBase" ) {$true} else { throw "BaseType is not IdnTransformLogicBase." } } ) ]
        [object]$VariableTransform,

        # Parameter for Input Template. 
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateFormatLogic",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [ValidateSet("ISO8601" , "LDAP" , "PEOPLE_SOFT" , "EPOCH_TIME_JAVA" , "EPOCH_TIME_WIN32")]
        [string]$DateInputTemplate,

        # Parameter for Output Template. 
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateFormatLogic",
        HelpMessage = "Select the Input Template to use for the Date Format.")]
        [ValidateSet("ISO8601" , "LDAP" , "PEOPLE_SOFT" , "EPOCH_TIME_JAVA" , "EPOCH_TIME_WIN32")]
        [string]$DateOutputTemplate,

        # Parameter for Input Custom. 
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateFormatLogic",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [string]$DateInputCustom,
        
        # Parameter for Input Custom. 
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateFormatLogic",
        HelpMessage = "Enter Custom format for the Input Date.  Refer to http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html for help")]
        [string]$DateOutputCustom,

        # Parameter for Input Transform
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateFormatLogic",
        HelpMessage = "Specify a Transform to use for Input.")]
        [ValidateScript( { if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformLogicBase" ) {$true} else { throw "BaseType is not IdnTransformLogicBase." } } ) ]
        [object]$InputTransform,

        # Parameter for comparison Operator.
        [Parameter(Mandatory = $true,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Specify the Comparison Operator to use for the Date test.")]
        [ValidateSet( "lt" , "lte" , "gt" , "gte" )]
        [string]$Operator,

        # Parameter for the Positive value.
        [Parameter(Mandatory = $true,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Specify the value to use the test is positive.")]
        [string]$PositiveCondition,
        
        # Parameter for the Negative value.
        [Parameter(Mandatory = $true,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Specify the value to use the test is negative.")]
        [string]$NegativeCondition,

        # Parameter for First Date Transform.
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Specify a Transform to use for the First Date.")]
        [ValidateScript( { if ( ( $_.GetType() ).BaseType.Name -eq "IdnTransformLogicBase" ) {$true} else { throw "BaseType is not IdnTransformLogicBase." } } ) ]
        [object]$FirstDateTransform,

        # Parameter second date static.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter datetime value to test against as the Second Date.")]
        [datetime]$TestAgainstStaticDate,

        # Switch for setting Test Date to Now.
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Switch parameter to use the current time for the Test Date.")]
        [switch]$TestForCurrentTime,
        
        # Switch for setting Test Date to Now.
        [Parameter(Mandatory = $false,
        ParameterSetName = "DateCompareLogic",
        HelpMessage = "Switch parameter to use the current time to test against.")]
        [switch]$TestAgainstCurrentTime
        
    )
    
    begin   {

        $Type = $PSCmdlet.ParameterSetName
        $Rule = New-Object -TypeName $Type
        
    }
    
    process {

        switch ($Type) {

            "AccountAttributeLogic"  { $Rule.SetRequiredAttributes( $LongSourceID , <# $RuleName , #> $AccountAttibuteName ) }
            "ConditionalLogic"       { $Rule.SetRequiredAttributes( $ValueToTest , $ValueToTestAgainst , $ResultIfTrue , $ResultIfFalse ) }
            "DateCompareLogic"       { $Rule.SetRequiredAttributes( $Operator , $PositiveCondition , $NegativeCondition ) }
            "StaticRule"            { $Rule.SetRequiredAttributes( $StaticString ) }
            #Default                 { throw "$Type has not be configured yet.  You will need to write your transform manually." }
        
        }

        switch ($PSBoundParameters.Keys) {

            "AccountFilter"         { $Rule.SetAccountFilter(           $AccountFilter          ) }     
            "AccountPropertyFilter" { $Rule.SetAccountPropertyFilter(   $AccountPropertyFilter  ) }  
            "SortAttribute"         { $Rule.SetSortProperty(            $SortAttribute          ) }
            "ReturnFirstOnly"       { $Rule.EnableReturnFirstLink(                              ) }
            "EnableDescendingSort"  { $Rule.EnableDescendingSort(                               ) }
            "VariableName"          { $Rule.AddVariable(                $VariableName , $VariableTransform) }
            "DateInputTemplate"     { $Rule.AddInputFormat($DateInputTemplate) }
            "DateOutputTemplate"    { $Rule.AddOutputFormat($DateOutputTemplate) }
            "DateInputCustom"       { $Rule.AddInputFormat($DateInputCustom) }
            "DateOutputCustom"      { $Rule.AddOutputFormat($DateOutputCustom) }
            "InputTransform"        { $Rule.AddInputTransform($InputTransform) }
            "FirstDateTransform"    { $Rule.AddFirstDateTransfrom($FirstDateTransform) }
            "TestAgainstStaticDate" { $Rule.AddSecondDateStaticDate($TestAgainstStaticDate) }
            "TestForCurrentTime"    { $Rule.SetFirstDateToNow() }
            "TestAgainstCurrentTime"    { $Rule.SetSecondDatToNow() }
            
        }
        
    }
    
    end     {

        return $Rule
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
                
    }
    
    process {

        foreach ($Entry in $Id) {
        
            $Uri     = $Tenant.ModernBaseUri + "v3/roles/" + $Entry
            $Current = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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

function Get-IdnRoleMembershipCriteria                          {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/roles/{1}" -f $Tenant.ModernBaseUri , $Id
                
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

        if ($Call) {

            $Rule = [StandardRoleCriteria]$Call.membership

        }
        
    }
    
    end     {

        return $Rule
        
    }
    
}

function New-IdnRole                                            {
    
    [CmdletBinding()]

    param   (

        # Switch for New Role with Identity_Lst
        [Parameter(Mandatory = $false,
        HelpMessage=  "Switch to specify the Role uses Membership Type of IDENTITY_LIST.",
        ParameterSetName = "List")]
        [switch]$IdentityListRole,

        # Switch for New Role with Identity_Lst
        [Parameter(Mandatory = $false,
        HelpMessage=  "Switch to specify the Role uses Membership Type of STANDARD.",
        ParameterSetName = "Rule")]
        [switch]$StandardRole,

        # Parameter for entering the new Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a Name for the Role you want to create.")]
        [string]$Name,

        # Parameter for specifying a descrption.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify a Description for the new Role.")]
        [string]$Description,

        # Parameter for specifying a list of users.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the the Aliases/Names for the User Identities to add to the Role.",
        ParameterSetName = "List")]
        [string[]]$IdentityIDs,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify Membership Criteria with a StandardRoleCriteria object.",
        ParameterSetName = "Rule")]
        [ValidateScript( { if ( $_.GetType().Name -eq 'StandardRoleCriteria' ) { $true } else { throw "Object is not of required Type: StandardRoleCriteria" } } ) ]
        [object]$MembershipRule,

        # Parameter for entering Entitlements to assign.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a list of IDs for Entitlements for this Profile to Grant.")]
        [ValidateLength(32,32)]
        [string[]]$AccessProfiles,
        
        # Parameter for specifying the Profle owner
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the owner of the new Role.")]
        [ValidateLength(32,32)]
        [string]$OwnerID,

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant     = Get-IdnTenantDetails      -Instance   $Instance
        $OwnerInfo  = Get-IdnIdentity           -Id         $OwnerID            -Instance $Instance
        $APList     = @( Get-IdnAccessProfile   -Id         $AccessProfiles     -Instance $Instance -ErrorAction "SilentlyContinue" )
        $Uri        = $Tenant.ModernBaseUri + "v3/roles/" 
        $AccessProfileArray = @()
      
    }
    
    process {

        $AccessProfileArray += foreach ($Profile    in $APList      ) {
            
            @{

                id      = $Profile.id
                type    = "ACCESS_PROFILE"
                name    = $Profile.name

            }

        }

        switch ($PSCmdlet.ParameterSetName) {

            "List" {
                
                $UserList   = @( Get-IdnIdentity -Id $IdentityIDs -Instance $Instance -ErrorAction "SilentlyContinue" )
                $UserListArray      = @()
                $UserListArray      += foreach ($User       in $UserList    ) {
            
                    @{
        
                        id          = $User.externalId
                        type        = "IDENTITY"
                        name        = $User.name
                        aliasName   = $User.alias
        
                    }
                    
                }
                
                $Membership = @{

                    type        = "IDENTITY_LIST"
                    identities  = $UserListArray

                }
            
            }
            
            "Rule" {

                $Membership = $MembershipRule
            

            }
        }

        $Object = [ordered]@{

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
        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body
    
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnRoles                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for Starting Name
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter a string to search the start of the Name for.")]
        [string]$NameStartsWith,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the complete name to search for.")]
        [string]$NameIs,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Owner's ID.")]
        [ValidateLength( 32 , 32 )]
        [string]$OwnedBy,

        # Parameter for entering a Custom Filter.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Search by whether a Role is requestable or not.")]
        [ValidateSet("true" , "false")]
        [string]$Requestable,

        # Parameter for Filter Operator.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Filter Operator.  Default is 'and'.")]
        [ValidateSet("and","or")]
        [string]$CompositeOperator = "and",

        # Parameter for entering a Custom Filter.
        [Parameter(Mandatory = $true,
        ParameterSetName = "Custom",
        HelpMessage = "Enter a Custom Filter to search Roles for.")]
        [string]$CustomFilter,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Params = @()
                
    }
    
    process {

        switch ( $PSBoundParameters.Keys ) {

            "NameStartsWith"    { $Params += 'name sw "{0}"'        -f $NameStartsWith  }
            "NameIs"            { $Params += 'name eq "{0}"'        -f $NameIs          }
            "OwnedBy"           { $Params += 'owner.id eq "{0}"'    -f $OwnedBy         }
            "Requestable"       { $Params += 'requestable eq {0}'   -f $Requestable     }
            "CustomFilter"      { $Params += '{0}'                  -f $CustomFilter    }
        
        }

        $Filter = $Params -join " $CompositeOperator "
        $Uri    = "{0}v3/roles?filters={1}" -f $Tenant.ModernBaseUri , $Filter
        $First  = "{0}&count=true"  -f $Uri
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.TenantToken.Bearer  

        if ($Rest.Content.Length -ge 3) {

            $Total      = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $RolesAll   = New-Object -TypeName "System.Collections.ArrayList"
            $Begin      = @( ConvertFrom-Json -InputObject $Rest.Content )
            $RolesAll.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $Uri -OffsetIncrease 50 -Total $Total
                $RolesAll.AddRange( $Pages )

            }

        }
        
    }
    
    end     {

        return $RolesAll
        
    }
    
}

function Update-IdnRoleMembers                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$RoleId,

        # Parameter for the list of users to add to the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a list of users to add.",
        ParameterSetName = "IdenityList")]
        [ValidateLength(32,32)]
        [string[]]$IdentityIDs,

        # Parameter for new Criteria
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a new set of Standard Role Criteria.",
        ParameterSetName = "Standard")]
        [ValidateScript( { if ($_.GetType().Name -eq 'StandardRoleCriteria' ) { $true } else { throw "The Type of $($_.GetType().Name) needs to be 'StandardRoleCriteria'." } } ) ]
        [object]$NewCriteria,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/roles/{1}" -f $Tenant.ModernBaseUri , $RoleId
                
    }
    
    process {

        switch ( $PSCmdlet.ParameterSetName ) {

            "IdenityList"   {
                        
                $IdentityList = foreach ($Id in $IdentityIDs) {
                    
                    @{

                        id = $id

                    }
                    
                }

                $Object = @(

                    [ordered]@{

                        op      = 'replace'
                        path    = '/membership'
                        value   = [ordered]@{

                            type        = 'IDENTITY_LIST'
                            identities  = @(
                                
                                $IdentityList
                                
                            )

                        }

                    }

                )

            }

            "Standard"      {

                $Object = @(

                    [ordered]@{

                        op      = 'replace'
                        path    = '/membership'
                        value   = $NewCriteria
                        
                    }

                )

            }

        }

        $Body = ConvertTo-Json      -Depth  10      -InputObject    $Object
        $Call = Invoke-RestMethod   -Method "Patch" -Headers        $Tenant.TenantToken.Bearer  -Uri $Uri -ContentType "application/json-patch+json" -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnAccessProfiles                                  {
    
    [CmdletBinding()]

    param   (

        # Parameter for Starting Name
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter a string to search the start of the Name for.")]
        [string]$NameStartsWith,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the complete name to search for.")]
        [string]$NameIs,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Source ID.")]
        [ValidateLength( 32 , 32 )]
        [string]$SourceID,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Owner's ID.")]
        [ValidateLength( 32 , 32 )]
        [string]$OwnedBy,

        # Parameter for Filter Operator.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Filter Operator.  Default is 'and'.")]
        [ValidateSet("and","or")]
        [string]$CompositeOperator = "and",

        # Parameter for entering a Custom Filter.
        [Parameter(Mandatory = $true,
        ParameterSetName = "Custom",
        HelpMessage = "Enter a Custom Filter to search Roles for.")]
        [string]$CustomFilter,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Params = @()
        
    }
    
    process {

        switch ( $PSBoundParameters.Keys ) {

            "NameStartsWith"    { $Params += 'name sw "{0}"'        -f $NameStartsWith  }
            "NameIs"            { $Params += 'name eq "{0}"'        -f $NameIs          }
            "OwnedBy"           { $Params += 'owner.id eq "{0}"'    -f $OwnedBy         }
            "SourceID"          { $Params += 'source.id eq "{0}"'   -f $SourceID        }
            "Requestable"       { $Params += 'requestable eq {0}'   -f $Requestable     }
            "CustomFilter"      { $Params += '{0}'                  -f $CustomFilter    }
        
        }

        $Filter = $Params -join " $CompositeOperator "
        $Uri    = "{0}v3/access-profiles?filters={1}" -f $Tenant.ModernBaseUri , $Filter
        $First  = "{0}&count=true" -f $Uri
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 
        
        if ($Rest.Content.Length -ge 3) {

            $Total      = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $ProfList   = New-Object -TypeName "System.Collections.ArrayList"
            $Begin      = @(ConvertFrom-Json    -InputObject    $Rest.Content)
            $ProfList.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $Uri -OffsetIncrease 50 -Total $Total
                $ProfList.AddRange( $Pages )

            }

        }

    }
    
    end     {

        return $ProfList
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Call   = @()
        
    }
    
    process {

        foreach ($IdProfile in $Id) {

            $Uri    = $Tenant.ModernBaseUri + "v3/access-profiles/" + $IdProfile
            $Call  += Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 
            
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
        [ValidateCount(     1   , 250    )]
        [ValidateLength(    32  , 32     )]
        [string[]]$Ids,
        <# 
        # Parameter for updating Roles.
        [Parameter(Mandatory = $false,
        HelpMessage = "Bool parameter for updating Roles.")]
        [bool]$ProvisionRoles = $true,

        # Parameter for updating Entitlements.
        [Parameter(Mandatory = $false,
        HelpMessage = "Bool parameter for updating Entitlements.")]
        [bool]$RefreshEntitlements = $true,
        #>
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identities/process" -f $Tenant.ModernBaseUri

    }
    
    process {

        $Object = [ordered]@{

            identityIds = $Ids

        }

        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-RestMethod   -Method         "Post"  -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body

    }
    
    end     {

        return $Call
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/account-aggregations/" + $Id + "/status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/pending-tasks?limit=$PageSize&offset=$OffSet"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }
    
}

# Last Check for V3/Beta was 02/14/2024
function Get-IdnQueue                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/message/getQueueStatus?"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }
    
}

# Last Check for V3/Beta was 02/14/2024
function Get-IdnJobs                                            {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "cc/api/message/getActiveJobs"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sources/" + $SourceId
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json-patch+json" -Body $JsonPatchObject
    
    }
    
    end     {

        return $Call
        
    }

}

# Last Check for V3/Beta was 02/14/2024
function Get-IdnRules                                           {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/rule/list"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call.items
        
    }
    
}

# Last Check for V3/Beta was 12/28/2023
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/rule/get/$RuleId"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }
    
}

# Last Check for V3/Beta was 02/14/2024
function Get-IdnPasswordPolicies                                {
    
    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/passwordPolicy/list"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }
    
}

# Last Check for V3/Beta was 12/28/2023
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.LegacyBaseUri + "api/passwordPolicy/get/$PolicyId"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
    }
    
    end     {

        return $Call
        
    }
    
}

# Last Check for V3/Beta was 12/28/2023
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body
        
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
        [ValidateLength(32,32)]
        [string]$SourceID,

        # Paramter for the ID of the Password Policy.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the password policy to assign to the source.")]
        [ValidateLength(32,32)]
        [string]$PwPolicyId,

        # Parameter for Policy Name.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the name of the Password Policy.")]
        [string]$PwPolicyName,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/sources/{1}" -f $Tenant.ModernBaseUri , $SourceID
        
    }
    
    process {

        $Object = @(

        [ordered]@{

            op = 'replace'
            path = '/passwordPolicies'
            value = [ordered]@{

                type = 'PASSWORD_POLICY'
                id = $PolicyId
                name = $PwPolicyName

            }

        }

        )

        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/account-activities?requested-for=" + $Id
        $Call   = @()
        
    }
    
    process {

        $Call += Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        
    }
    
    process {

        $Uri    = $Tenant.ModernBaseUri + "v3/historical-identities/" + $Id + "/events"
        $Call   = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/accounts/" + $Id
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/accounts/" + $Id + "/reload"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/accounts/"
        
    }
    
    process {

        switch ($PSBoundParameters.Keys) {

            'Filter' { $Uri += "?filters=$($Filter)"    }

        }

        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles"


    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentityProfile                                 {
    
    [CmdletBinding()]

    param   (

        # Parameter for Profile ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Identity Profile.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/identity-profiles/{1}" -f $Tenant.ModernBaseUri , $Id

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileLongId 

        if ($DefaultOnly) {$Uri += "/default-identity-attribute-config"}

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles/" + $ProfileLongId

    }
    
    process {

        foreach ($Patch in $Updates) {$Patch.op = 'add'}
        
        $Body = ConvertTo-Json -InputObject $Updates -Depth 10
        $Call = Invoke-RestMethod -Method "Patch" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json-patch+json" -Body $Body
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/identity-profiles/" + $ProfileLongId

    }
    
    process {

        foreach ($Patch in $Updates) {$Patch.op = 'replace'}

        $Body = ConvertTo-Json      -InputObject    $Updates    -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch"     -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json-patch+json" -Body $Body
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states/" + $LifeCycleStateExtId
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states"
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -Uri $Uri
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
        $Call = Invoke-RestMethod   -Method     "Post"      -Headers    $Tenant.TenantToken.Bearer -Uri $Uri -Body $Body -ContentType "application/json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/identity-profiles/" + $ProfileId + "/lifecycle-states/" + $LifeCycleStateExtId
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Patch" -Headers $Tenant.TenantToken.Bearer -Uri $Uri -ContentType "application/json-patch+json" -Body $JsonPatch
        
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
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
            #Call = Invoke-RestMethod   -Method "Patch" -Headers        $Tenant.TenantToken.Bearer       -Uri $Uri -ContentType "application/json-patch+json" -Body $Body

        }
        
    }
    
    end     {

        return $Body
        
    }
    
}

function New-IdnAccessProfileProvisioningCriteria               {

    [CmdletBinding()]

    param (

        # Paramter for Group Operator.
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify AND or OR as the opertaor Between Groups.")]
        [ValidateSet( "AND" , "OR" )]
        [string]$BetweenGroupOperator,

        # Parameter for Attribute Name
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the name of the account attribute.")]
        [string]$AttributeName,

        # Parameter attribute operator.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter comparison operator for attribute.")]
        [ValidateSet( "EQUALS" , "NOT_EQUALS" , "CONTAINS" , "HAS" )]
        [string]$AttributeOperator,

        # Parameter for attribute value
        [Parameter(Mandatory = $true,
        HelpMessage = "Specify the value to look for.")]
        [string]$AttributeValue
    
    )

    begin {

        $Criteria = [IdnProvisioningCriteriaAP]::new( $BetweenGroupOperator )

    }

    process {

        
        $Other = switch ($BetweenGroupOperator) {

            "OR"    { "AND" }
            "AND"   { "OR"  }
        
        }
        
        $ChildAttr = [IdnProvisioningCriteriaAP ]::new( $Other                                                  )
        $ChildCrit = [IdnProvisioningChild      ]::new( $AttributeName , $AttributeOperator , $AttributeValue   )
        
        $ChildAttr.AddChildren( $ChildCrit )
        $Criteria.AddChildren(  $ChildAttr )

    }

    end {

        return $Criteria

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
        [ValidateLength(32,32)]
        [string]$OwnerId,

        # Parameter for ProvisioningCriteria.
        [Parameter(Mandatory = $false,
        HelpMessage = "Pass a IdnProvisioningCriteriaAP object.")]
        [IdnProvisioningCriteriaAP]$ProvisioningCriteria,

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

        # Parameter for setting the Role as Enabled or Disabled.
        [Parameter(Mandatory = $false,
        HelpMessage = "Create the Profile as Enabled or Disabled, default is Enabled.")]
        [bool]$Requestable = $false,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant             = Get-IdnTenantDetails  -Instance   $Instance
        $SourceInfo         = Get-IdnSourcesById    -Instance   $Instance -SourceId   $SourceId
        $EntitlementInfo    = Get-IdnEntitlement    -Instance   $Instance -Id         $EntitlmentIds
        $Uri                = $Tenant.ModernBaseUri + "v3/access-profiles"
        
    }
    
    process {
        
        if ( $SourceInfo.id -eq ( $EntitlementInfo.source.id | Select-Object -Unique ) ) {

            $EntitlmentArray = foreach ($Entry in $EntitlementInfo) {

                @{

                    name    = $Entry.name
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
                    id    = $OwnerId

                }

                source          = @{

                    id    = $SourceInfo.id
                    type  = "SOURCE"
                    name  = $SourceInfo.name

                }

                entitlements    = @($EntitlmentArray)
                requestable     = $Requestable
               
            }

            if ($ProvisioningCriteria) {

                $Object.Add( 'provisioningCriteria' , $ProvisioningCriteria )

            }

            $Body = ConvertTo-Json -InputObject $Object -Depth 100
            $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json"

        }

        else {
            
            Write-Warning "Source ID does not match the ID for the Entitlments."
        
        }
        
    }
    
    end     {

        return $Call
        
    }

}

function Get-IdnEntitlements                                    {

    [CmdletBinding( DefaultParameterSetName = "Staged" )]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(32,32)]
        [string]$SourceId,

        # Parameter for Starting Name
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter a string to search the start of the Name for.")]
        [string]$NameStartsWith,

        # Parameter for name equels.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the complete name to search for.")]
        [string]$NameEquals,

        # Parameter for Attribute string.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Search for Entitlment matching Attribute value.")]
        [string]$Attribute,

        # Parameter for Filter Operator.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Staged",
        HelpMessage = "Enter the Filter Operator.  Default is 'and'.")]
        [ValidateSet("and","or")]
        [string]$CompositeOperator = "and",

        # Parameter for entering a Custom Filter.
        [Parameter(Mandatory = $true,
        ParameterSetName = "Custom",
        HelpMessage = "Enter a Custom Filter to search Entitlements for.")]
        [string]$CustomFilter,

        # Parameter specifying the number of accounts to return.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter a number between 1 and 250.")]
        [ValidateScript({if ($_ -gt 250) {$True} else {throw "$_ is greater than 250."}})]
        [int]$OffsetIncrease = 250,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Params = @()
        
    }
    
    process {

        switch ($PSBoundParameters.Keys) {
            
            "SourceId"          { $Params += 'source.id eq "{0}"'   -f $SourceId        }
            "NameStartsWith"    { $Params += 'name sw "{0}"'        -f $NameStartsWith  }
            "NameEquals"        { $Params += 'name eq "{0}"'        -f $NameEquals      }
            "Attribute"         { $Params += 'attribute eq "{0}"'   -f $Attribute       }
            "CustomFilter"      { $Params += '{0}'                  -f $CustomFilter    }

        }

        $Filter     = $Params -join " $CompositeOperator "
        $RootUri    = "{0}beta/entitlements?filters={1}"    -f $Tenant.ModernBaseUri , $Filter
        $First      = "{0}&count=true"                      -f $RootUri
        $Rest       = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.TenantToken.Bearer -ErrorAction "Stop" 
        
        if ( $Rest.Content.Length -ge 3 ) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $EntLst = New-Object            -TypeName       "System.Collections.ArrayList"
            $Begin  = @(ConvertFrom-Json    -InputObject    $Rest.Content)
            $EntLst.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $RootUri -OffsetIncrease 250 -Total $Total
                $EntLst.AddRange( $Pages )

            }

        }

    }
    
    end     {

        return $EntLst
        
    }

}

function Get-IdnEntitlement                                     {

    [CmdletBinding()]
    
    param   (
    
        # Parameter for the ID of the source to query
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter ID of the source you are looking for.")]
        [ValidateLength(32,32)]
        [string[]]$Id,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        
    }
    
    process {
        
        $Call = foreach ($Item in $id) {
            
            $Uri    = "{0}beta/entitlements/{1}" -f $Tenant.ModernBaseUri , $Item
            Invoke-RestMethod -Headers $Tenant.TenantToken.Bearer -Uri $Uri -Method "Get" -ContentType "application/json"

        }
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/accounts/" + $Id + "/entitlements"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method Get -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
        
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
        [ValidateScript( { if ($_ -notlike "*@*" ) { $true } else { throw "$_ contains an '@' symbol.  This is included in the query and cannot be part of the value passed." } } ) ]
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

        # Parameter for all Inactive Identities.
        [Parameter(Mandatory = $true,
        ParameterSetName = "AllInactive",
        HelpMessage = "Get a list of all Inactive Identities with at least one Role assigned.")]
        [switch]$AllInactiveIdentities,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

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
            'EmailDomain'           { $SearchStrings += '(attributes.email:"*@'             + $EmailDomain      + '")'          }
            'LifeCycleState'        { $SearchStrings += '(attributes.cloudLifecycleState:"' + $LifeCycleState   + '")'          }
            'SourceName'            { $SearchStrings += '@accounts(source.name:"'           + $SourceName       + '")'          }
            'LongSourceID'          { $SearchStrings += '@accounts(source.id:"'             + $LongSourceID     + '")'          }
            'Hours'                 { $SearchStrings += '(created:[now-'                    + $Hours            + 'h TO now])'  }
            'AllInactiveIdentities' { $SearchStrings += '((attributes.cloudLifecycleState:term*) AND (roleCount:>0))'           }
            
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
            $Call                = Invoke-WebRequest -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body 
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/triggers"

    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Add-IdnAccessProfileEntitlments                        {

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide a list of Entitlements to Add by ID.")]
        [ValidateLength(32,32)]
        [string[]]$EntitlementIds,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Object = New-Object            -TypeName "System.Collections.ArrayList"
        $Access = Get-IdnAccessProfile  -Instance $Instance                         -Id $Id
        $Tenant = Get-IdnTenantDetails  -Instance $Instance
        $Uri    = "{0}v3/access-profiles/{1}" -f $Tenant.ModernBaseUri , $Id
        
    }
    
    process {

        foreach ($Permission in $EntitlementIds) {

            $Confirm = Get-IdnEntitlement -Id $Permission -Instance $Instance

            if ( $Access.source.id -eq $Confirm.source.id ) {

                $Entry = [ordered]@{

                    op      = "add"
                    path    = "/entitlements/-"
                    value   = [ordered]@{
    
                        id      = $Confirm.id
                        type    = "ENTITLEMENT"
                        name    = $Confirm.name
    
                    }
                        
                }
                
                $Object.Add( $Entry ) | Out-Null
    
            }

        }
        
        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -ContentType "application/json-patch+json" -Headers $Tenant.TenantToken.Bearer -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Update-IdnAccessProfileEntitlments                     {

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide a list of Entitlements to Add by ID.")]
        [ValidateLength(32,32)]
        [string[]]$EntitlementIds,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Access = Get-IdnAccessProfile -Instance $Instance -Id $Id
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/access-profiles/{1}" -f $Tenant.ModernBaseUri , $Id
        
    }
    
    process {

        $AddEnts = foreach ($Permission in $EntitlementIds) {

            $Confirm = Get-IdnEntitlement -Id $Permission -Instance $Instance

            if ( $Access.source.id -eq $Confirm.source.id ) {

                [ordered]@{

                    id      = $Confirm.id
                    type    = "ENTITLEMENT"
                    name    = $Confirm.name

                }

            }

        }
        
        $Object = @(

            [ordered]@{

                op      = "replace"
                path    = "/entitlements"
                value   = @(

                    $AddEnts

                )

            }            

        )

        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -ContentType "application/json-patch+json" -Headers $Tenant.TenantToken.Bearer -Body $Body
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Remove-IdnAccessProfileEntitlments                     {

    param   (

        # Parameter for entering the ID of the Role
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID for the Role you're looking for.")]
        [ValidateLength(32,32)]
        [string]$Id,

        # Parameter help description
        [Parameter(Mandatory = $true,
        HelpMessage = "Provide a list of Entitlements to Add by ID.")]
        [ValidateLength(32,32)]
        [string[]]$EntitlementIds,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Access = Get-IdnAccessProfile  -Instance $Instance -Id $Id
        $Object = [System.Collections.ArrayList]@( $Access.entitlements.id )
        
    }
    
    process {

        foreach ($Permission in $EntitlementIds) {

            if ($Access.entitlements.id -contains $Permission) {

                $Object.Remove( $Permission )
                
            }

        }

        $Call = Update-IdnAccessProfileEntitlments -Id $Id -EntitlementIds $Object -Instance $Instance
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/historical-identities/" + $IdentityLongID  + "/events"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Uri $Uri
            
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [Parameter(ParameterSetName = "AdditionalOptionsForConfigType",
        Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
        $Call = Invoke-RestMethod   -Method         "Post" -Uri     $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/export/" + $JobID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/export/" + $JobID + "/download"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/sp-config/config-objects"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer -ContentType "application/json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
        $Call = Invoke-WebRequest   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json-patch+json"
        
    }
    
    end     {

        return $Call
        
    }

}

function Remove-IdnAccountFromIdentity                          {

    [CmdletBinding()]
    
    param   (
        
        # Parameter the Account ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Long ID for the Account to move.")]
        [ValidateLength(32,32)]
        [string]$AccountID,

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "v3/accounts/" + $AccountID 
        
    }
    
    process {

        $Object = @(

            @{

                op      = "remove"
                path    = "/identityId"

            }

        )

        $Body = ConvertTo-Json      -InputObject    $Object -Depth  10
        $Call = Invoke-WebRequest   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json-patch+json"
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
                
    }
    
    process {
    
        $Uri    = $Tenant.ModernBaseUri + "beta/roles/identity/" + $IdentityExternalID + "/roles"
        $Call   = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end     {

        return $Call
        
    }
    
}

function Get-IdnIdentities                                      {

    [CmdletBinding()]

    param   (

        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

    )

    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}beta/identities" -f $Tenant.ModernBaseUri

    }

    process {

        $First  = "{0}?count=true" -f $Uri
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.TenantToken.Bearer -ErrorAction "Stop" 

        if ( $Rest.Content.Length -ge 3 ) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $IdLst  = New-Object            -TypeName       "System.Collections.ArrayList"
            $Begin  = @(ConvertFrom-Json    -InputObject    $Rest.Content)
            $IdLst.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $Uri -OffsetIncrease 250 -Total $Total
                $IdLst.AddRange( $Pages )

            }

        }


    }

    end     {

        return $IdLst

    }

}

# Last Check for V3/Beta was 02/14/2024
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
    
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        
    }
    
    process {


        $Uri    = $Tenant.ModernBaseUri + "cc/api/source/reset/" + $Source
        $Call   = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
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

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

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

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

    }

    end     {

        return $Call

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
            $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json-patch+json"

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
        $Call = Invoke-RestMethod   -Method         "Patch"     -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -Body $Body -ContentType "application/json-patch+json"

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {
                
        $Tenant = Get-IdnTenantDetails  -Instance $Instance

    }
    
    process {
        
        $Uri    = $Tenant.ModernBaseUri + "v3/roles/" + $RoleLongID + "/assigned-identities"
        $First  = $Uri + "?count=true"
        $Rest   = Invoke-WebRequest -Method "Get" -Uri $First -Headers $Tenant.TenantToken.Bearer -ErrorAction "Stop" 

        if ($Rest) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Pages = Invoke-IdnPaging -Token $Tenant.TenantToken.Bearer -StartUri $Uri -OffsetIncrease 250 -Total $Total
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

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
        $Rest = Invoke-WebRequest -Method "Post" -Uri $First -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body 

        if ($Rest.Content.Length -ge 3) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Object.Add( "searchAfter" , @( $Begin | Select-Object -Last 1 -ExpandProperty "id" ) )
                $Pages = Invoke-IdnElasticSearch -Token $Tenant.TenantToken.Bearer -StartUri $Uri -ElasticBody $Object -Total $Total -PerPage $Limit
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance

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
        $Rest = Invoke-WebRequest -Method "Post" -Uri $First -Headers $Tenant.TenantToken.Bearer -ContentType "application/json" -Body $Body 

        if ($Rest.Content.Length -ge 3) {

            $Total  = [int32]"$( $Rest.Headers."X-Total-Count" )"
            $Array  = New-Object        -TypeName       "System.Collections.ArrayList"
            $Begin  = ConvertFrom-Json  -InputObject    $Rest.Content
            $Array.AddRange( $Begin )

            if ($Total -gt $Begin.Count) {

                $Object.Add( "searchAfter" , @( $Begin | Select-Object -Last 1 -ExpandProperty "id" ) )
                $Pages = Invoke-IdnElasticSearch -Token $Tenant.TenantToken.Bearer -StartUri $Uri -ElasticBody $Object -Total $Total -PerPage $Limit
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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
        $Call = Invoke-RestMethod   -Uri            $Uri    -Method "Patch" -Headers $Tenant.TenantToken.Bearer -ContentType "application/json-patch+json" -Body $Body
        
    }
    
    end     {

        return $Call 
        
    }
    
}

# Last Check for V3/Beta was 02/14/2024
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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

        $Rest = Invoke-RestMethod -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Method "Post" -ContentType $Content -Body $bodyLines -DisableKeepAlive
    
    }
    
    end     {
    
        return $Rest

    }

}

# Last Check for V3/Beta was 02/14/2024
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
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

        $Rest = Invoke-RestMethod -Uri $Uri -Headers $Tenant.TenantToken.Bearer -Method "Post" -ContentType $Content -Body $bodyLines -DisableKeepAlive
    
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status"
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -ContentType "application/json" -Headers $Tenant.TenantToken.Bearer 

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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/" + $TaskID
        
    }
    
    process {
        
        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer 
        
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
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
    )
    
    begin   {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = $Tenant.ModernBaseUri + "beta/task-status/" + $TaskID
        
    }
    
    process {

        $Task = Get-IdnIdentityTaskStatus -TaskID $TaskID -Instance $Instance

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
            $Call = Invoke-RestMethod   -Method         "Patch" -Uri    $Uri -ContentType "application/json-patch+json" -Headers $Tenant.TenantToken.Bearer -Body $Body
            
        }

    }
    
    end     {

        return $Call
        
    }
    
}

function New-IdnRoleCriteria                                    {

    [CmdletBinding()]
    
    param   (

        # Parameter for Between Groups Operator.
        [Parameter(Mandatory = $true,
        ParameterSetName = "WithChild",
        HelpMessage = "Select the Operator to use for Between Groups.")]
        [ValidateSet("AND","OR")]
        [string]$BetweenOperator,

        # Switch to make just Role. 
        [Parameter(Mandatory = $true,
        ParameterSetName = "Empty",
        HelpMessage = "Switch to create the Role Object with no Children.")]
        [switch]$WithoutChildren
        
    )
    
    begin   {

        #CriteriaObj        = New-Object -TypeName "RoleCriteriaChildItem"
        $StandardCriteria   = New-Object -TypeName "StandardRoleCriteria"

    }
    
    process {

        if ( -not $WithoutChildren ) {

            $CriteriaObj        = New-Object -TypeName "RoleCriteriaChildItem"

            switch ($BetweenOperator) {

                "AND"   { $CriteriaObj.SetAndChild( )   }
                "OR"    { $CriteriaObj.SetOrChild(  )   }
            
            }

            $StandardCriteria.AddChildren( $CriteriaObj )

        }
        
    }
    
    end     {

        return $StandardCriteria
        
    }

}

function New-IdnRoleChild                                       {

    [CmdletBinding()]
    
    param   (

        # Switch for Identity Child.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Identity",
        HelpMessage = "Switch to create criteria for an Identity Attribute.")]
        [switch]$IdentityAttribute,
    
        # Switch for Account Child.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Account",
        HelpMessage = "Switch to create criteria for an Account Attribute.")]
        [switch]$AccountAttribute,
    
        # Switch for Entitlement Child.
        [Parameter(Mandatory = $false,
        ParameterSetName = "Entitlement",
        HelpMessage = "Switch to create criteria for an Identity Attribute.")]
        [switch]$EntitlementAttribute,

        # Switch for Entitlement Child.
        [Parameter(Mandatory = $false,
        ParameterSetName = "OrParent",
        HelpMessage = "Switch to create Parent group with the Or Operator.")]
        [switch]$OrParent,

        # Switch for Entitlement Child.
        [Parameter(Mandatory = $false,
        ParameterSetName = "AndParent",
        HelpMessage = "Switch to create Parent group with the And Operator.")]
        [switch]$AndParent,

        # Parameter for Between Groups Operator.
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the Operator to evaluate the String.",
        ParameterSetName = "Identity")]
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the Operator to evaluate the String.",
        ParameterSetName = "Account")]
        [Parameter(Mandatory = $true,
        HelpMessage = "Select the Operator to evaluate the String.",
        ParameterSetName = "Entitlement")]
        [ValidateSet( "EQUALS", "NOT_EQUALS", "CONTAINS", "STARTS_WITH", "ENDS_WITH" )]
        [string]$Operator,

        # Parameter String criteria.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the string to matcha against the Identity Attribute.",
        ParameterSetName = "Identity")]
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the string to matcha against the Account Attribute.",
        ParameterSetName = "Account")]
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the string to matcha against Entitlement name.",
        ParameterSetName = "Entitlement")]
        [string]$CriteriaString,

        # Parameter for Property
        [Parameter(Mandatory = $true,
        ParameterSetName = "Identity",
        HelpMessage = "Enter the Identity Attribute to match against.")]
        [Parameter(Mandatory = $true,
        ParameterSetName = "Account",
        HelpMessage = "Enter the Account Attribute to match against.")]
        [string]$AttributeName,

        # Parameter for Source ID.
        [Parameter(Mandatory = $true,
        ParameterSetName = "Entitlement",
        HelpMessage = "Enter the Source ID the Entitlement is from.")]
        [Parameter(Mandatory = $true,
        ParameterSetName = "Account",
        HelpMessage = "Enter the Source ID the Account Attribute is from.")]
        [ValidateLength(32,32)]
        [string]$SourceID
        
    )
    
    begin   {

        $ChildItem = New-Object -TypeName "RoleCriteriaChildItem"

    }
    
    process {

        switch ($PSCmdlet.ParameterSetName) {

            "Account"       { $ChildItem.SetAccountKey(     $Operator , $CriteriaString , $AttributeName , $SourceID    ) }
            "Identity"      { $ChildItem.SetIdentityKey(    $Operator , $CriteriaString , $AttributeName                ) }
            "Entitlement"   { $ChildItem.SetEntitlementKey( $Operator , $CriteriaString , $SourceID                     ) }
            "OrParent"      { $ChildItem.SetOrChild(                                                                    ) }
            "AndParent"     { $ChildItem.SetAndChild(                                                                   ) }
        
        }
        
    }
    
    end     {

        return $ChildItem
        
    }

}

# Last Check for V3/Beta was 02/14/2024
function Start-IdnEntitlementAggregation                        {

    [CmdletBinding()]
    
    param (

        # Parameter for Source ID
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Source's Cloud External ID to refresh Entitlment's for.")]
        [string]$CloudExternalID,
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
        
        
    )
    
    begin {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}cc/api/source/loadEntitlements/{1}" -f $Tenant.ModernBaseUri , $CloudExternalID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end {

        return $Call
        
    }

}

# Last Check for V3/Beta was 02/14/2024
function Start-IdnAccountAggregation                            {

    [CmdletBinding()]
    
    param (

        # Parameter for Source ID
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Source's Cloud External ID to refresh Entitlment's for.")]
        [string]$CloudExternalID,
    
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
                
    )
    
    begin {
        
        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}cc/api/source/loadAccounts/{1}" -f $Tenant.ModernBaseUri , $CloudExternalID
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Post" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end {

        return $Call
        
    }

}

function ConvertTo-IdnStandardRoleCriteria                      {
    
    [CmdletBinding()]
    
    param (

        # Parameter for Role Criteria
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Standard Role Criteria.")]
        [StandardRoleCriteria]$RoleCriteria
        
    )
        
    end {

        return [StandardRoleCriteria]$RoleCriteria
        
    }

}

function Get-IdnConnectorList                                   {

    [CmdletBinding()]
    
    param (
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
                
    )
    
    begin {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/connectors" -f $Tenant.ModernBaseUri
        
    }
    
    process {

        $Call = Invoke-RestMethod -Method "Get" -Uri $Uri -Headers $Tenant.TenantToken.Bearer
        
    }
    
    end {

        $Call
        
    }

}

function New-IdnSource                                          {

    [CmdletBinding()]
    
    param (

        # Parameter for Connector Script.
        [Parameter(Mandatory = $false,
        HelpMessage = "Enter the Connector Script for the Connector this Source will use.",
        ParameterSetName = "DelimitedFile")]
        [switch]$DelimitedFile,
    
        # Parameter Source Name
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the name for the new Source.")]
        [string]$Name,

        # Parameter for Description
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter a brief description for the source.")]
        [string]$Description,

        # Parameter for Owner ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the Owner's ID.")]
        [ValidateLength( 32 , 32 )]
        [string]$OwnerID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
                
    )
    
    begin {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/sources" -f $Tenant.ModernBaseUri
        
    }
    
    process {

        $Owner = Get-IdnIdentity -Id $OwnerID -Instance $Instance
        
        if ( $OwnerID -eq $Owner.id ) {

            switch ($PSCmdlet.ParameterSetName) {

                "DelimitedFile" {

                    $Uri       += "?provisionAsCsv=true"
                    $ConScript  = "delimited-file-angularsc"

                }

                Default         {
                
                    throw "$($PSCmdlet.ParameterSetName) has not been configured yet."
                
                }

            }
        
            $Config = [IdnSource]::new( $Name , $Description , $ConScript , $OwnerID , $Owner.name )
            $Body   = ConvertTo-Json    -InputObject    $Config -Depth  10
            $Call   = Invoke-RestMethod -Method         "Post"  -Uri    $Uri -Headers $Tenant.TenantToken.Bearer -ContentType 'application/json' -Body $Body

        }
        
    }
    
    end {

        return $Call
        
    }

}

function Remove-IdnSource                                       {

    [CmdletBinding()]
    
    param (

        # Parameter for ID.
        [Parameter(Mandatory = $true,
        HelpMessage = "Enter the ID of the Source to delete.")]
        [ValidateLength( 32 , 32 )]
        [string]$ID,
        
        # Parameter for setting wich instance of SailPoint you are connecting to.
        [Parameter(Mandatory = $false,
        HelpMessage = "Choose which Tenant to connect to.  Choices are Production, Sandbox or Ambassador")]
        [ValidateSet("Production" , "Sandbox" , "Ambassador")]
        [string]$Instance = $IdnApiConnectionConfig.DefaultInstance
                
    )
    
    begin {

        $Tenant = Get-IdnTenantDetails -Instance $Instance
        $Uri    = "{0}v3/sources/{1}" -f $Tenant.ModernBaseUri , $ID
        
    }

    process {

        $Call = Invoke-RestMethod -Method "Delete" -Uri $Uri -Headers $Tenant.TenantToken.Bearer

    }

    end {

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
