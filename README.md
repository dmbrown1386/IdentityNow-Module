# IdentityNow-Module

## DISCLAIMER: This is a community tool and not an official module from SailPoint.  Use at your own risk.

### Getting Started

Once installed you must run Import-Module to trigger the setup script.  This script will check the current system to make sure the Environmental Variables have been setup.  These Variables store the Org Names for your Production and Sandbxo tenants.  If one or both of these is missing you will unlikely be able to execute any functions until after you manually import the module.

To Authenticate run the Get-IdnToken command.  It only supports the Client Credential method and the Secret must be passed as a Secure String.  If the command succeeds it will create the variable $IdentityNowToken that contains your Access Token and will be used by subsequent calls.  

```PowerShell
IAM> $PAT = Get-Credential
IAM>
IAM> Get-IdnToken           -ClientId       $PAT.UserName -ClientSecret $PAT.Password
IAM> Search-IdnIdentities   -EmailAddress   $Email

_type               : identity
_version            : v7
```
