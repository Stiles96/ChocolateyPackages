param(
    [string]$Path
)

$apikey = ""
#Write-Host "Packing and pushing from $PSScriptRoot";
choco push $path --source="https://push.chocolatey.org" --api-key=$apikey