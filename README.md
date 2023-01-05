# IdentityNow-Module

Once you have installed this module you will need to update the variable $OrgName with the name of your Tenant.

![OrgName](/Idn-OrgName.png)

To Authenticate run Get-IdnToken command.  It only supports the Client Credential method and the Secret must be passed as a Secure String.  If the command succeeds it will create the variable $IdentityNowToken that contains your Access Token and will be used by subsequent calls.  

Below is an example of using the command to generate a new Transform Rule.  This does not submit the Rule, just creates an object following the correct format for an Account Attribute Rule.  You have to enter a 32 Character string for the Source ID referencing the account or the command won't execute.  

![Demo](/Idn-Demo.png)
