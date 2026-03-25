$BaseURL = "https://dxlog.net/sw/files/";
$AppName = "DXLog";
$Basedir = "DXLog";

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

cd $PSScriptRoot;

$nuspecfile = $($Basedir + "\" + $AppName + ".nuspec")
$xml = Read-Xml -FilePath $nuspecfile

$currentVersion = $xml.package.metadata.version
$currentnugetpack = $($Basedir + "\" + $AppName + "." + $currentVersion + ".nupkg")
Write-Host "Current version: $currentVersion"

$html = curl $BaseURL -UseBasicParsing

# Parse the HTML to extract the MSI file name and version
$msiMatch = $html.Content | Select-String -Pattern 'DXLog\.net-(\d+\.\d+\.\d+)\.msi'
if ($msiMatch) 
{
    $latestVersion = $msiMatch.Matches.Groups[1].Value
    $msiName = $msiMatch.Matches.Value
    Write-Host "Latest version: $latestVersion"
    Write-Host "MSI file name: $msiName"
} 
else 
{
    throw "Could not find MSI file in the HTML content."
}

if ($latestVersion -ne $currentVersion)
{
    Remove-Item $currentnugetpack -Force -Confirm:$false;
    $xml.package.metadata.version = $latestVersion;
    $nugetpack = $($Basedir + "\" + $AppName + "." + $latestVersion + ".nupkg")
    Write-XML -FilePath $nuspecfile -doc $xml

    curl "$BaseURL/$msiName" -OutFile $msiName
    $checksum = Get-FileHash $msiName;
    Remove-Item $msiName -Force -Confirm:$false;

    # Update the chocolateyinstall.ps1 with the new MSI filename
    $installScriptPath = "$PSScriptRoot\$Basedir\tools\chocolateyinstall.ps1"
    $content = Get-Content $installScriptPath -Raw
    $content = $content -replace '\$filename = .+', "`$filename = '$msiName'"
    $content = $content -replace '\$checksum = .+', "`$checksum = '$($checksum.Hash)'"
    Set-Content $installScriptPath $content

    choco pack $nuspecfile
    Copy-Item $nugetpack $RepoFolder
}