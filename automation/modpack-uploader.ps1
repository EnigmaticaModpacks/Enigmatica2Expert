[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$manifest = "manifest.json"
$minecraftInstanceFile = "minecraftinstance.json"
$overridesFolder = "overrides"
$secretsFile = "secrets.ps1"

function Validate-SecretsFile {
    if (!(Test-Path "$PSScriptRoot/$secretsFile")) {
        Write-Host "You need a valid CurseForge API Token in a $secretsFile file" -ForegroundColor Red
        Write-Host "Creating $secretsFile" -ForegroundColor Cyan
        New-Item -Path $PSScriptRoot -ItemType File -Name $secretsFile -Value "# To generate an API token go to: https://authors.curseforge.com/account/api-tokens `n $CURSEFORGE_TOKEN = `"your-curseforge-token-here`""
    }
}

function Get-GitHubRelease {
    param(
        [parameter(Mandatory = $true)]
        [string]
        $repo,
        [parameter(Mandatory = $true)]
        [string]
        $file
    )
	
    $releases = "https://api.github.com/repos/$repo/releases"

    Write-Host "Determining latest release of $repo"
    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name

    $download = "https://github.com/$repo/releases/download/$tag/$file"

    Write-Host "Dowloading..."
    Invoke-WebRequest $download -Out $file
}

function Test-ForDependencies {
    $is7zAvailable = Get-Command 7z
    if (-not $is7zAvailable) {
        Clear-Host
        Write-Host 
        Write-Host "Install 7zip and add it's folder to the environment variable 'Path'`n" -ForegroundColor Red
        Write-Host "7zip can be downloaded here: " -NoNewline
        Write-Host "https://www.7-zip.org/download.html" -ForegroundColor Blue
        Write-Host 
        Write-Host "When you're done, rerun this script.`n"

        throw "7zip not command available. Please follow the instructions above." 
    }

    $isCurlAvailable = Get-Command $curl
    if (-not $isCurlAvailable) {
        Clear-Host
        Write-Host 
        Write-Host "Install Curl and add it's folder to the environment variable 'Path'`n" -ForegroundColor Red
        Write-Host "Curl can be downloaded here: " -NoNewline
        Write-Host "https://curl.se/download.html" -ForegroundColor Blue
        Write-Host "To install it, simply unzip the folder somewhere and point path to it."
        Write-Host 
        Write-Host "When you're done, rerun this script.`n"

        throw "curl not available. Please follow the instructions above." 
    }
}

function Update-BetterCompatibilityCheckerVersion {
    param(
        [Parameter(Position = 0)]
        [string]$mode
    )

    $configPath = "$INSTANCE_ROOT/config/bcc-common.toml"
    if (!(Test-Path $configPath)) {
        Write-Host "Failed to find a BetterCompatibilityChecker config in path '$configPath'"
    }
    # Replace anything that matches semver of the type 1.0.0 with $MODPACK_VERSION
    $contents = [System.IO.File]::ReadAllText($configPath) -replace "\d+\.\d+\.\d+", $MODPACK_VERSION
    $contents = $contents -replace "modpackProjectID.*", "modpackProjectID = $CURSEFORGE_PROJECT_ID"

    [System.IO.File]::WriteAllText($configPath, $contents)
}

function New-ClientFiles {
    if ($ENABLE_CLIENT_FILE_MODULE) {
        Write-Host 
        Write-Host "Creating Client Files..." -ForegroundColor Cyan
        Write-Host 

        $clientZip = "$CLIENT_ZIP_NAME.zip"

        Remove-Item $clientZip -Recurse -Force -ErrorAction SilentlyContinue
        
        New-ManifestJson

        if (Test-Path -PathType Container $overridesFolder) {
            Write-Host "The folder 'overrides' will be removed by manifest generation." -ForegroundColor Red
            Write-Host "Press any key to proceed, CTRL + C To cancel."
            pause
        }

        Remove-Item $overridesFolder -Force -Recurse -ErrorAction SilentlyContinue
        New-Item -ItemType Directory $overridesFolder
        
        $FOLDERS_TO_INCLUDE_IN_CLIENT_FILES | ForEach-Object {
            Write-Host "Adding " -ForegroundColor Cyan -NoNewline
            Write-Host $_ -ForegroundColor Blue -NoNewline
            Write-Host " to client files." -ForegroundColor Cyan
            Copy-Item -Path $_ -Destination "$overridesFolder/$_" -Recurse
        }

        Add-ThirdPartyMods
        Remove-BlacklistedFiles

        # Zipping up the newly created overrides folder and $manifest
        7z a $clientZip $manifest -sdel
        7z a $clientZip $overridesFolder -r -sdel

        Remove-Item $manifest -Force -Recurse -ErrorAction SilentlyContinue
        Write-Host "Client files $clientZip created!" -ForegroundColor Green
    }
}

function New-ManifestJson {
    if (!(Test-Path $minecraftInstanceFile)) {
        Write-Host "Generating a $manifest requires a $minecraftInstanceFile file." -ForegroundColor Red
    }

    $minecraftInstanceJson = Get-Content $minecraftInstanceFile | ConvertFrom-Json

    $mods = [System.Collections.ArrayList]@()
    foreach ($addon in $minecraftInstanceJson.installedAddons) {
        $mods.Add(@{
                required    = $true
                projectID   = $addon.addonID
                fileID      = $addon.installedFile.id
                downloadUrl = $addon.installedFile.downloadUrl
            }) > $null
    }

    $modloaderId = $minecraftInstanceJson.baseModLoader.name

    if ($MODLOADER -eq "fabric") {
        # Example output: "fabric-0.13.3-1.18.1"
        $splitModloaderId = $modloaderId -split "-"
        # Only keep "fabric-0.13.3"
        $modloaderId = $splitModloaderId[0] + "-" + $splitModloaderId[1]
    }

    $jsonOutput = @{
        minecraft       = @{
            version    = $minecraftInstanceJson.baseModLoader.minecraftVersion
            modLoaders = @(@{
                    id      = $modloaderId
                    primary = $true
                })
        }
        manifestType    = "minecraftModpack"
        manifestVersion = 1
        name            = $MODPACK_NAME
        version         = $MODPACK_VERSION
        author          = $CLIENT_FILE_AUTHOR
        files           = $mods
        overrides       = "overrides"
    } 

    Remove-Item $manifest -Force -Recurse -ErrorAction SilentlyContinue
    $jsonString = $jsonOutput | ConvertTo-Json -Depth 3
    $outfile = "$INSTANCE_ROOT/$manifest"
    [System.IO.File]::WriteAllLines($outfile, $jsonString)
    Write-Host "$manifest created!" -ForegroundColor Green
}

function Add-ThirdPartyMods {
    if ($FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES.Count -gt 0) {
        New-Item -ItemType Directory -Name "$overridesFolder/mods"
    }
    $FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES | ForEach-Object {

        $fileFilter = $_

        $matchedFiles = Get-ChildItem -Path $INSTANCE_ROOT -Recurse -File | Where-Object { $_.Name -match $fileFilter -and $_.Extension -eq ".jar" }
        
        if ($matchedFiles.Count -eq 0) {
            Write-Warning "No file found matching regex pattern: $_"
            continue
        }
        
        if ($matchedFiles.Count -gt 1) {
            Write-Warning "Multiple files found matching regex pattern: $_ - Using first match. "
            Write-Host "Press any key to continue"
            pause
        }
    
        $fileToCopy = $matchedFiles[0]
        $fileName = $fileToCopy.Name
    
        Write-Host "Adding " -ForegroundColor Cyan -NoNewline
        Write-Host $fileName -ForegroundColor Blue -NoNewline
        Write-Host " to the mods folder in the client files." -ForegroundColor Cyan
        
        Copy-Item -Path $fileToCopy.FullName -Destination "$overridesFolder/mods/$fileName" -Recurse
    }
}

function Remove-BlacklistedFiles {
    if ($ENABLE_CLIENT_FILE_MODULE -or $ENABLE_SERVER_FILE_MODULE) {    
        $FOLDERS_TO_REMOVE_FROM_CLIENT_FILES | ForEach-Object {
            Write-Host "Removing overrides/$_"
            Remove-Item -Path "overrides/$_" -Recurse -ErrorAction SilentlyContinue
        }
    
        $CONFIGS_TO_REMOVE_FROM_CLIENT_FILES | ForEach-Object {
            Write-Host "Removing overrides/config/$_"
            Remove-Item -Path "overrides/config/$_" -Recurse -ErrorAction SilentlyContinue
        }
    
        Write-Host "Removing all .bak files from overrides" -ForegroundColor Cyan
        Get-ChildItem "overrides/*.bak" | ForEach-Object { 
            Write-Host "Removing $($_.FullName)"
            Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
        }    
    }
}

function New-Changelog {
    if ($ENABLE_CHANGELOG_GENERATOR_MODULE `
            -and $null -ne $MODPACK_VERSION `
            -and $null -ne $LAST_MODPACK_VERSION `
            -and (Test-Path "$INSTANCE_ROOT/$LAST_MODPACK_ZIP_NAME.zip") `
            -and (Test-Path "$INSTANCE_ROOT/$CLIENT_ZIP_NAME.zip")
    ) {
        if (-not (Test-Path $CHANGELOG_GENERATOR_JAR) -or $ENABLE_ALWAYS_UPDATE_JARS) {
            Remove-Item $CHANGELOG_GENERATOR_JAR -Recurse -Force -ErrorAction SilentlyContinue
            Get-GitHubRelease -repo "ModdingX/ModListCreator" -file $CHANGELOG_GENERATOR_JAR
        }
        Write-Host 
        Write-Host "Generating mod changelog..." -ForegroundColor Cyan
        Write-Host 

        Remove-Item $CHANGELOG_PATH -ErrorAction SilentlyContinue

        java -jar $CHANGELOG_GENERATOR_JAR `
            changelog `
            --output $CHANGELOG_PATH `
            --new "$CLIENT_ZIP_NAME.zip" `
            --old "$LAST_MODPACK_ZIP_NAME.zip"

        Write-Host "Mod changelog generated!" -ForegroundColor Green
    }
}

function Push-ClientFiles {
    if ($ENABLE_MODPACK_UPLOADER_MODULE) {

        if ($ENABLE_CLIENT_FILE_MODULE -eq $false) {
            Remove-BlacklistedFiles
        }

        $metadataObj = [ordered]@{
            changelog     = $CLIENT_CHANGELOG -replace '\r\n|\r|\n', ' ' -replace '\s{2,}', ' '
            changelogType = $CLIENT_CHANGELOG_TYPE
            displayName   = $CLIENT_FILE_DISPLAY_NAME
            gameVersions  = @($GAME_VERSIONS | ForEach-Object { [int]$_ })
            releaseType   = $CLIENT_RELEASE_TYPE
        }
        $CLIENT_METADATA = ConvertTo-SafeJson ($metadataObj | ConvertTo-Json -Compress)

        $metadataTempFile = ([System.IO.Path]::GetTempFileName() + ".json").Replace('\', '/')
        [System.IO.File]::WriteAllText($metadataTempFile, $CLIENT_METADATA, (New-Object System.Text.UTF8Encoding $false))

        Write-Host
        Write-Host "Client Metadata:" -ForegroundColor Cyan
        Write-Host
        Write-Host $CLIENT_METADATA -ForegroundColor Blue

        Write-Host
        Write-Host "Uploading client files to https://minecraft.curseforge.com/api/projects/$CURSEFORGE_PROJECT_ID/upload-file" -ForegroundColor Green
        Write-Host

        $response = & $curl `
            --url "https://minecraft.curseforge.com/api/projects/$CURSEFORGE_PROJECT_ID/upload-file" `
            --user "$CURSEFORGE_USER`:$CURSEFORGE_TOKEN" `
            -H "Accept: application/json" `
            -H "X-Api-Token:$CURSEFORGE_TOKEN" `
            -F "metadata=<$metadataTempFile;type=application/json" `
            -F "file=@$CLIENT_ZIP_NAME.zip" `
            --progress-bar | ConvertFrom-Json

        Remove-Item $metadataTempFile -ErrorAction SilentlyContinue

        $clientFileReturnId = $response.id

        if (-not $response.id) {
            Write-Host "Failed to upload client files: $response" -ForegroundColor Red
            throw "Failed to upload client files: $response"
        }

        Write-Host 
        Write-Host "Uploaded modpack!" -ForegroundColor Green
        Write-Host 
        Write-Host "Return Id: $clientFileReturnId" -ForegroundColor Cyan
        Write-Host

        if ($ENABLE_SERVERSTARTER_MODULE) {
            Update-FileLinkInServerFiles -ClientFileReturnId $clientFileReturnId
        }
    }
}

function Update-FileLinkInServerFiles {
    param(
        [int]$ClientFileReturnId
    )
    if ($clientFileReturnId) {
        $clientFileIdString = $clientFileReturnId.toString()
        $idPart1 = $clientFileIdString.Substring(0, 4)
        $idPart1 = Remove-LeadingZero -text $idPart1
        $idPart2 = $clientFileIdString.Substring(4, $clientFileIdString.length - 4)
        $idPart2 = Remove-LeadingZero -text $idPart2
        # CurseForge replaces whitespace in filenames with + in their CDN urls
        $sanitizedClientZipName = $CLIENT_ZIP_NAME.Replace(" ", "+")
        $curseForgeCdnUrl = "https://edge.forgecdn.net/files/$idPart1/$idPart2/$sanitizedClientZipName.zip"        
        $content = (Get-Content -Path $SERVER_SETUP_CONFIG_PATH) -replace "https://edge.forgecdn.net/files/\d+/\d+/.*.zip", $curseForgeCdnUrl 
        [System.IO.File]::WriteAllLines(($SERVER_SETUP_CONFIG_PATH | Resolve-Path), $content)

        if ($ENABLE_SERVER_FILE_MODULE) {
            New-ServerFiles -ClientFileReturnId $clientFileReturnId
        }
    }
}

function New-ServerManifestJson {
    if (!(Test-Path $minecraftInstanceFile)) {
        Write-Host "Generating a $manifest requires a $minecraftInstanceFile file." -ForegroundColor Red
    }

    $minecraftInstanceJson = Get-Content $minecraftInstanceFile | ConvertFrom-Json

    $mods = [System.Collections.ArrayList]@()
    foreach ($addon in $minecraftInstanceJson.installedAddons) {
        $mods.Add([ordered]@{
                projectID = $addon.addonID
                fileID    = $addon.installedFile.id
                required  = $true
                isLocked  = $false
            }) > $null
    }

    $modloaderId = $minecraftInstanceJson.baseModLoader.name

    if ($MODLOADER -eq "fabric") {
        # Example output: "fabric-0.13.3-1.18.1"
        $splitModloaderId = $modloaderId -split "-"
        # Only keep "fabric-0.13.3"
        $modloaderId = $splitModloaderId[0] + "-" + $splitModloaderId[1]
    }

    $jsonOutput = [ordered]@{
        minecraft       = [ordered]@{
            version    = $minecraftInstanceJson.baseModLoader.minecraftVersion
            modLoaders = @([ordered]@{
                    id      = $modloaderId
                    primary = $true
                })
        }
        manifestType    = "minecraftModpack"
        manifestVersion = 1
        name            = "$MODPACK_NAME Server"
        version         = $MODPACK_VERSION
        author          = $CLIENT_FILE_AUTHOR
        files           = $mods
        overrides       = "overrides"
    }

    $serverManifest = "server-manifest.json"
    Remove-Item $serverManifest -Force -Recurse -ErrorAction SilentlyContinue
    $outfile = "$INSTANCE_ROOT/$serverManifest"
    $jsonOptions = [System.Text.Json.JsonSerializerOptions]::new()
    $jsonOptions.WriteIndented = $true
    $jsonString = [System.Text.Json.JsonSerializer]::Serialize($jsonOutput, $jsonOptions)
    [System.IO.File]::WriteAllLines($outfile, $jsonString)
    Write-Host "Server $serverManifest created!" -ForegroundColor Green
    return $serverManifest
}

function New-ServerFiles {
    param(
        [int]$ClientFileReturnId
    )
    if ($ENABLE_SERVER_FILE_MODULE) {
        Write-Host
        Write-Host "Creating server files..." -ForegroundColor Cyan
        Write-Host

        $serverZip = "$SERVER_ZIP_NAME.zip"
        $serverOverridesFolder = "server-overrides"

        Remove-Item $serverZip -Force -ErrorAction SilentlyContinue
        Remove-Item $serverOverridesFolder -Force -Recurse -ErrorAction SilentlyContinue

        # Generate server manifest.json
        $serverManifest = New-ServerManifestJson

        # Create server overrides folder
        New-Item -ItemType Directory $serverOverridesFolder

        # Copy the same folders as client files
        $FOLDERS_TO_INCLUDE_IN_CLIENT_FILES | ForEach-Object {
            Write-Host "Adding " -ForegroundColor Cyan -NoNewline
            Write-Host $_ -ForegroundColor Blue -NoNewline
            Write-Host " to server files." -ForegroundColor Cyan
            Copy-Item -Path $_ -Destination "$serverOverridesFolder/$_" -Recurse
        }

        # Add third-party mods to server overrides (same logic as client)
        if ($FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES.Count -gt 0) {
            New-Item -ItemType Directory -Name "$serverOverridesFolder/mods" -ErrorAction SilentlyContinue
        }
        $FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES | ForEach-Object {
            $fileFilter = $_
            $matchedFiles = Get-ChildItem -Path $INSTANCE_ROOT -Recurse -File | Where-Object { $_.Name -match $fileFilter -and $_.Extension -eq ".jar" }

            if ($matchedFiles.Count -eq 0) {
                Write-Warning "No file found matching regex pattern: $_"
                continue
            }

            if ($matchedFiles.Count -gt 1) {
                Write-Warning "Multiple files found matching regex pattern: $_ - Using first match."
            }

            $fileToCopy = $matchedFiles[0]
            $fileName = $fileToCopy.Name

            Write-Host "Adding " -ForegroundColor Cyan -NoNewline
            Write-Host $fileName -ForegroundColor Blue -NoNewline
            Write-Host " to the mods folder in the server files." -ForegroundColor Cyan

            Copy-Item -Path $fileToCopy.FullName -Destination "$serverOverridesFolder/mods/$fileName" -Recurse
        }

        # Remove blacklisted files/folders from server overrides (reuse client blacklist)
        $FOLDERS_TO_REMOVE_FROM_CLIENT_FILES | ForEach-Object {
            Write-Host "Removing $serverOverridesFolder/$_"
            Remove-Item -Path "$serverOverridesFolder/$_" -Recurse -ErrorAction SilentlyContinue
        }

        $CONFIGS_TO_REMOVE_FROM_CLIENT_FILES | ForEach-Object {
            Write-Host "Removing $serverOverridesFolder/config/$_"
            Remove-Item -Path "$serverOverridesFolder/config/$_" -Recurse -ErrorAction SilentlyContinue
        }

        Write-Host "Removing all .bak files from server overrides" -ForegroundColor Cyan
        Get-ChildItem "$serverOverridesFolder/*.bak" -Recurse | ForEach-Object {
            Write-Host "Removing $($_.FullName)"
            Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
        }

        # Zip up server manifest and overrides folder
        7z a $serverZip $serverManifest -sdel
        7z a $serverZip $serverOverridesFolder -r -sdel

        # Add server_files to zip root (start scripts, config yaml, etc.)
        Write-Host "Adding server files from " -ForegroundColor Cyan -NoNewline
        Write-Host $SERVER_FILES_FOLDER -ForegroundColor Blue -NoNewline
        Write-Host " to zip root." -ForegroundColor Cyan
        7z a $serverZip "$SERVER_FILES_FOLDER/*"

        # Rename manifest and overrides folder inside zip to expected names
        7z rn $serverZip $serverManifest "manifest.json"
        7z rn $serverZip $serverOverridesFolder overrides

        Move-Item -Path "automation/$serverZip" -Destination $serverZip -ErrorAction SilentlyContinue
        Remove-Item $serverManifest -Force -ErrorAction SilentlyContinue

        Write-Host "Server files $serverZip created!" -ForegroundColor Green

        if ($ENABLE_MODPACK_UPLOADER_MODULE) {
            Push-ServerFiles -clientFileReturnId $clientFileReturnId
        }
    }
}

function Push-ServerFiles {
    param(
        [int]$clientFileReturnId
    )
    if ($ENABLE_SERVER_FILE_MODULE -and $ENABLE_MODPACK_UPLOADER_MODULE) {
        $serverFilePath = "$SERVER_ZIP_NAME.zip"

        $serverMetadataObj = [ordered]@{
            changelog     = $SERVER_CHANGELOG -replace '\r\n|\r|\n', ' ' -replace '\s{2,}', ' '
            changelogType = $SERVER_CHANGELOG_TYPE
            displayName   = $SERVER_FILE_DISPLAY_NAME
            parentFileId  = [int]$clientFileReturnId
            releaseType   = $SERVER_RELEASE_TYPE
        }
        $SERVER_METADATA = ConvertTo-SafeJson ($serverMetadataObj | ConvertTo-Json -Compress)

        $serverMetadataTempFile = ([System.IO.Path]::GetTempFileName() + ".json").Replace('\', '/')
        [System.IO.File]::WriteAllText($serverMetadataTempFile, $SERVER_METADATA, (New-Object System.Text.UTF8Encoding $false))

        Write-Host
        Write-Host "Uploading server files..." -ForegroundColor Cyan
        Write-Host

        $serverFileResponse = & $curl `
            --url "https://minecraft.curseforge.com/api/projects/$CURSEFORGE_PROJECT_ID/upload-file" `
            --user "$CURSEFORGE_USER`:$CURSEFORGE_TOKEN" `
            -H "Accept: application/json" `
            -H "X-Api-Token:$CURSEFORGE_TOKEN" `
            -F "metadata=<$serverMetadataTempFile;type=application/json" `
            -F "file=@$serverFilePath" `
            --progress-bar | ConvertFrom-Json

        Remove-Item $serverMetadataTempFile -ErrorAction SilentlyContinue

        if ($serverFileResponse.errorCode) {
            throw "Failed to upload server files: $serverFileResponse"
        }

        if ($serverFileResponse.id) {
            Write-Host "Uploaded server files!" -ForegroundColor Green
        }
    }
}

function New-GitHubRelease {
    if ($ENABLE_GITHUB_RELEASE_MODULE) {

        $Base64Token = [System.Convert]::ToBase64String([char[]]$GITHUB_TOKEN);
        $Uri = "https://api.github.com/repos/$GITHUB_NAME/$GITHUB_REPOSITORY/releases?access_token=$GITHUB_TOKEN"
    
        $Headers = @{
            Authorization = 'Basic {0}' -f $Base64Token;
        };
    
        $Body = @{
            tag_name         = $MODPACK_VERSION
            target_commitish = 'master'
            name             = $MODPACK_VERSION
            body             = ''
            draft            = $false
            prerelease       = $false
        } | ConvertTo-Json

    
        Write-Host 
        Write-Host "Making GitHub Release..." -ForegroundColor Green
        Write-Host 
    
        Invoke-RestMethod -Headers $Headers -Uri $Uri -Body $Body -Method Post
    }
}

function Update-Modlist {
    if ($ENABLE_MODLIST_CREATOR_MODULE) {
        if (-not (Test-Path $MODLIST_CREATOR_JAR) -or $ENABLE_ALWAYS_UPDATE_JARS) {
            Remove-Item $MODLIST_CREATOR_JAR -Recurse -Force -ErrorAction SilentlyContinue
            Get-GitHubRelease -repo "ModdingX/ModListCreator" -file $MODLIST_CREATOR_JAR
        }

        Remove-Item $MODLIST_PATH -ErrorAction SilentlyContinue
        java -jar $MODLIST_CREATOR_JAR modlist --output $MODLIST_PATH --detailed "$CLIENT_ZIP_NAME.zip"
        Copy-Item -Path $MODLIST_PATH -Destination "$INSTANCE_ROOT/MODLIST.md"
    }
}

function ConvertTo-SafeJson {
    param([string]$json)
    # PowerShell 5.1's ConvertTo-Json embeds raw UTF-16 surrogate pairs for emoji/supplementary
    # characters instead of \uXXXX escape sequences, producing invalid UTF-8 when written to disk.
    # Replace each surrogate pair with a proper \uHigh\uLow JSON escape.
    return [regex]::Replace($json, '[\uD800-\uDBFF][\uDC00-\uDFFF]', {
        param($m)
        $high = [int][char]$m.Value[0]
        $low  = [int][char]$m.Value[1]
        '\u{0:X4}\u{1:X4}' -f $high, $low
    })
}

function Remove-LeadingZero {
    param(
        [string]$text
    )
    return [int]$text
}

# Script execution starts here
. "$PSScriptRoot/settings.ps1"
. "$PSScriptRoot/$secretsFile"

$startLocation = Get-Location
Set-Location $INSTANCE_ROOT

if ($null -eq $IsWindows -or $IsWindows) {
    # The script is running on Windows, use curl.exe
    $curl = "curl.exe"
}
else {
    $curl = "curl"
}

Test-ForDependencies

. "$PSScriptRoot/$secretsFile"
Validate-SecretsFile

New-ClientFiles
Push-ClientFiles

if ($ENABLE_SERVER_FILE_MODULE -and -not $ENABLE_MODPACK_UPLOADER_MODULE) {
    New-ServerFiles
}

New-GitHubRelease
New-Changelog
Update-Modlist


Write-Host "Modpack Upload Complete!" -ForegroundColor Green
Set-Location $startLocation

pause
break