# Author: zhoutao
# Date: 2023/9/15 14:45
# Description: Install my custom Virtual Environments Manage Script

[string] $PSPATH="$HOME\Documents\PowerShell"

if ( Test-Path $PSPATH ) {
    echo "$PSPATH already exists"
} else {
    New-Item -Path "$HOME\Documents" -Name "PowerShell" -ItemType "directory"
}

Copy-Item ".\envs.ps1" -Destination $PSPATH

write-output '{"Microsoft.PowerShell:ExecutionPolicy":"RemoteSigned"}' | out-file -filepath "$PSPATH\powershell.config.json" -Force

write-output "Set-Alias v $PSPATH\envs.ps1" | out-file -filepath "$PSPATH\Microsoft.PowerShell_profile.ps1" -Force
