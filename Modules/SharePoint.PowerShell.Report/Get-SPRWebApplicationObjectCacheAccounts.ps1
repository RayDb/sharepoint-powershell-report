﻿#requires -Version 2.0
function Get-SPRWebApplicationObjectCacheAccounts
{
  param
  (
    [Parameter(Mandatory = $true)]
    [object[]]$SPWebApplication
  )
	
  foreach ($webApplication in $SPWebApplication)
  {
    $superUserAccount = $webApplication.Properties['portalsuperuseraccount'] 
    $superReaderAccount = $webApplication.Properties['portalsuperreaderaccount'] 
    $properties = @{
      'DisplayName'           = $webApplication.DisplayName
      'SuperUserAcount'       = $superUserAccount
      'SuperUserHasFullControl' = $webApplication.SuperUserHasFullControl
      'SuperReaderAcount'     = $superReaderAccount
      'SuperReaderHasFullRead' = $webApplication.SuperReaderHasFullRead
    } 

    $output = New-Object -TypeName PSObject -Property $properties
		
    Write-Output -InputObject $output
  }
}
