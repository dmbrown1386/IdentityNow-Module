# IdentityNow-Module

## DISCLAIMER: This is a community tool and not an official module from SailPoint.  Use at your own risk.

### Getting Started

Once you have the Module installed run the `Update-IdnOrgNames` command (formally `Update-IdnConfigSettings`) to create an Environmental Variable with the Organization names for your tenants.  The required Parameters are `-ProdName` for the name of your Production Tenant, `-SandboxName` for your Sandbox name and `-Scope` for defining where to create the variable.  Options are:

- `User`        : Create the variable for the Current User only.  Will persist for future sessions for this user.
- `System`      : Create the variable for the All Users on the machine.  Will persist for future sessions for all users.
- `LocalOnly`   : Create the variable for the current session only.  Will not persist to future sessions.  

There is now a third option for adding the name for Ambassador Tenants.  This is not required and works the same as the Parameters for Production and Sandbox.  All Tenants will be pinged once to confirm they are available and the names were entered correcty. If any fail the command will need rerun.  The `Update-IdnOrgNames` will overwrite your current variable in the specified scope.  If you do not want to update all of the Names you can use `Set-IdnOrgNames` to just update the names you want.  Only the `-Scope` parameter is required.

Once you have set the required Org names you can run the `Get-IdnToken` command to Authenticate with a Client ID and Secret.  Secret's must be passed as SecureStrings  The `-Instance` Parameter can be used to select which Tenant you wish to obtain a Bearer Token for.  The default is `Production`, but `Sandbox` and `Ambassador` are also valid options.  This is the only command where `Production` is set as the Default option.  This command will create or update the variable `$IdnApiConnectionConfig` which maintains all the settings needed to connect to your Tenants. Tokens wlll now automatically Refresh after they have expired.  This command will only need run when connecting to a Tenant for the first time after changing your Organization names.  

One of the attributes in the `$IdnApiConnectionConfig` variable is `DefaultInstance` and will specify which of the three Tenants is your Default Connection.  All commands (except `Get-IdnToken` which is set to `Production` by Default) will run against this Tenant unless you use the `-Instance` Parameter to override it.  This value can be permanantly changed by running `Set-IdnDefaultTentant` or running `Get-IdnToken`.  This command will set the `DefaultInstance` property to the Tenant it was run against.

### Examples

Below is sample code to run to get started using the `Get-Credential` command to create a `PSCredential` Object and get the Identity for the Personal Access Token used.:

```PowerShell
Demo> $PAT = Get-Credential
Demo> Update-IdnOrgNames -ProdName $ProdName -SandboxName $SbName -Scope 'User'
Demo> Get-IdnToken -ClientId $PAT.UserName -ClientSecret $PAT.Password
Demo> $IdnApiConnectionConfig

DefaultInstance Production          Sandbox             Ambassador
--------------- ----------          -------             ----------
Production      IdnProductionTenant IdnProductionTenant IdnAmbassadorTenant


Demo> $TestIdentity = Get-IdnIdentity -Id $IdnApiConnectionConfig.Production.Context.identity_id 
Demo> $TestIdentity | select name,isManager

name         isManager
----         ---------
Brown, Derek     False


Demo> 
```

