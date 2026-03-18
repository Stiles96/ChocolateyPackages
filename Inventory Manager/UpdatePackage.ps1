$Basedir = "Inventory Manager";
$AppName = "inventorymanager";
$RepoFolder = "\\Zuhause.local\data\GPO\Programme\chocolatey.server\App_Data\Packages\";

function Read-Xml 
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )

    if (-not (Test-Path -LiteralPath $FilePath)) {
        throw "File not found: $FilePath"
    }

    try {
        # Use -Raw to preserve encoding and line breaks
        $content = Get-Content -LiteralPath $FilePath -Raw
        [xml]$doc = $content
        return $doc
    }
    catch {
        throw "Failed to read or parse XML file '$FilePath': $($_.Exception.Message)"
    }
}

function Write-XML
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath,
        [Parameter(Mandatory = $true)]
        [xml]$doc
    )
    if (-not (Test-Path -LiteralPath $FilePath)) {
        throw "File not found: $FilePath"
    }
    try 
    {
        $FilePath = "$PSScriptRoot\$FilePath"
        $doc.Save($FilePath);
    }
    catch {
        throw "Failed to read or parse XML file '$FilePath': $($_.Exception.Message)"
    }
}

$nuspecfile = $($Basedir + "\" + $AppName + ".nuspec")
$nugetpack = $($Basedir + "\" + $AppName + ".nupkg")

$xml = Read-Xml -FilePath $nuspecfile

$currentVersion = $xml.package.metadata.version
Write-Host "Current version: $currentVersion"

$latestVersion = (curl "https://inventorymanager.westeurope.cloudapp.azure.com/version.txt" -UseBasicParsing).Content;

if ($latestVersion -ne $currentVersion)
{
    $xml.package.metadata.version = $latestVersion;
    Write-XML -FilePath $nuspecfile -doc $xml

    choco pack $nuspecfile
    Copy-Item $nugetpack $RepoFolder
}