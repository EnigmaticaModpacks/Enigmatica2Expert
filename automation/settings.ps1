# Settings for the ModpackUploader
# For details/help see: https://github.com/NillerMedDild/ModpackUploader

# The main modpack folder
# Do not change or move
$INSTANCE_ROOT = ("$PSScriptRoot/.." | Resolve-Path)

# =====================================================================//
#  CURSEFORGE ACCOUNT SETTINGS
# =====================================================================//

$CURSEFORGE_USER = "NillerMedDild"

# For details see: https://www.curseforge.com/account/api-tokens
# Defined in secrets.ps1
# $CURSEFORGE_TOKEN =

# ProjectID can be found on the modpack's Curseforge Projects page, under "About This Project"
$CURSEFORGE_PROJECT_ID = 282744

# =====================================================================//
#  MAIN MODPACK SETTINGS
# =====================================================================//

# This is the modpack name as seen in it's CurseForge url: https://www.curseforge.com/minecraft/modpacks/[Enigmatica2Expert]
$MODPACK_NAME = "Enigmatica2Expert"

# Name of the Modpack in the ZIP File
$CLIENT_NAME = "Enigmatica2Expert"

# Version Of The Modpack
$MODPACK_VERSION = "1.93"

# Last Version Of The Modpack
# Needed For Changelog Parsing
$LAST_MODPACK_VERSION = "1.92"

# =====================================================================//
#  CHANGELOG SETTINGS
# =====================================================================//

# Changelog Type
# Can be "markdown", "text" or "html"
$CLIENT_CHANGELOG_TYPE = "html"

# Changelog
# Must be a single string.
$CLIENT_CHANGELOG = @"
<div style="font-family:sans-serif;text-align:center;max-width:480px;margin:0 auto;">
  <img src="https://github.com/EnigmaticaModpacks/Enigmatica2Expert/blob/master/resources/modpack/textures/gui/enigmatica2expert.png?raw=true"
       alt="Enigmatica 2: Expert Logo" style="width:80%;margin-bottom:16px;" />

  <p style="font-size:15px;margin:8px 0;">
    <a href="https://github.com/EnigmaticaModpacks/Enigmatica2Expert/blob/master/changelogs/CHANGELOG_MODS_$MODPACK_VERSION.md" target="_blank" style="color:#a8d8d0;text-decoration:none;">🔧 Mod Updates</a>
    <span style="color:#ccc;">&nbsp;|&nbsp;</span>
    <a href="https://github.com/EnigmaticaModpacks/Enigmatica2Expert/blob/master/changelogs/modlist_$MODPACK_VERSION.md" target="_blank" style="color:#a8d8d0;text-decoration:none;">📋 Modlist</a>
    <span style="color:#ccc;">&nbsp;|&nbsp;</span>
    <a href="https://www.bisecthosting.com/enigmatica" target="_blank" style="color:#a8d8d0;text-decoration:none;">🖥️ Get a Server</a>
  </p>

  <p style="font-size:12px;margin:4px 0;">
    <a href="https://github.com/EnigmaticaModpacks/Enigmatica2Expert/blob/master/CHANGELOG.md" target="_blank" style="color:#bbb;text-decoration:none;">See the full changelog on GitHub</a>
  </p>
</div>
"@

# =====================================================================//
#  CURSEFORGE PROJECT SETTINGS
# =====================================================================//

# Modpack's Minecraft Version
# @(6756) - is Minecraft 1.12.2
# @(7722) - is Minecraft 1.15.2
# @(8134) - is Minecraft 1.16.4
# More can be found by running GetGameVersions
$GAME_VERSIONS = @(6756)

# Can be "alpha", "beta" or "release"
$CLIENT_RELEASE_TYPE = "alpha"

#=====================================================================//
#  DEPENDENCIES URL
#=====================================================================//

# File name of the latest https://github.com/TheRandomLabs/ChangelogGenerator/releases
$CHANGELOG_GENERATOR_JAR = "ModListCreator-5.0.0-fatjar.jar"

# File name of the latest https://github.com/MelanX/ModListCreator/releases
$MODLIST_CREATOR_JAR = "ModListCreator-5.0.0-fatjar.jar"

#=====================================================================//
#  CLIENT FILE SETTINGS
#=====================================================================//

$CLIENT_FILE_AUTHOR = "EnigmaticaModpacks"

$FOLDERS_TO_INCLUDE_IN_CLIENT_FILES = @("config",
  "defaultconfigs")

$CONFIGS_TO_REMOVE_FROM_CLIENT_FILES = @(
  "InvTweaks.cfg",
  "MouseTweaks.cfg",
  "jei/worldSettings.cfg",
  "jei/lookupHistory.zip",
  "jei/bookmarks.ini"
)

# Example:
# $FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES = @("mods/Apotheosis-1.19.2-6.2.1.jar", "mods/create-1.19.2-0.5.1.b.jar")
$FILES_TO_INCLUDE_IN_MODS_FOLDER_IN_CLIENT_FILES = @()

$FOLDERS_TO_REMOVE_FROM_CLIENT_FILES = @(
  "resourcepacks"
)


#=====================================================================//
#  SERVER FILE SETTINGS
# =====================================================================//

# $CLIENT_MODS_TO_REMOVE_FROM_SERVER_FILES has been moved to remove-client-mods.ps1

$SERVER_FILES_FOLDER = "$INSTANCE_ROOT/server_files"

$SERVER_SETUP_CONFIG_PATH = "$INSTANCE_ROOT/server_files/server-setup-config.yaml"

# =====================================================================//
#  MODULES
# =====================================================================//

# Toggle automatic building of the manifest zip on/off
# Default: $true
$ENABLE_CLIENT_FILE_MODULE = $true

# Toggle the modpack uploader on/off
# Setting this to $false will also disable the Server File and Changelog Generator Modules.
# Default: $true
$ENABLE_MODPACK_UPLOADER_MODULE = $true

# Toggle server file feature on/off
# Default: $true
$ENABLE_SERVER_FILE_MODULE = $true

# Toggle serverstarter compatibility on/off
# This will update the "modpackUrl" in the file found at $SERVER_SETUP_CONFIG_PATH
# to point to your newly created client files on the CurseForge CDN.
# Default: $false
$ENABLE_SERVERSTARTER_MODULE = $true

# Toggle automatic changelog generator on/off
# This module requires an older modpack manifest zip to be present,
# $LAST_MODPACK_VERSION must be set, and the manifest naming must be consistent.
# Default: $false
$ENABLE_CHANGELOG_GENERATOR_MODULE = $true
# Path to the ChangelogGenerator's output file
$CHANGELOG_PATH = "$INSTANCE_ROOT/changelogs/CHANGELOG_MODS_$MODPACK_VERSION.md"

# Toggle creation of a modlist file on/off
# Default: $true
$ENABLE_MODLIST_CREATOR_MODULE = $true
# Path to the ModListCreator's output file
$MODLIST_PATH = "$INSTANCE_ROOT/changelogs/modlist_$MODPACK_VERSION.md"

# Toggle removal and re-download of jars on/off.
# Setting this to true will ensure that you always have the latest
# Twitch Export Builder and ChangelogGenerator, but increases the
# amount of time this script takes to execute.
# Default: $false
$ENABLE_ALWAYS_UPDATE_JARS = $false

# Toggles github release integration on/off.
# This will create a new release on your issue-tracker when using the modpack uploader.
# See below link for info:
# Default: $false
$ENABLE_GITHUB_RELEASE_MODULE = $true


# =====================================================================//
#  ADVANCED
#  Do not change anything unless you
#  know what you are doing!
# =====================================================================//

# Syntax of the Client ZIP File
$CLIENT_ZIP_NAME = "$CLIENT_NAME-$MODPACK_VERSION"

# Syntax of the Previous Versions Client ZIP File
$LAST_MODPACK_ZIP_NAME = "$CLIENT_NAME-$LAST_MODPACK_VERSION"

# Default: "$CLIENT_NAME $MODPACK_VERSION"
$CLIENT_FILE_DISPLAY_NAME = "Enigmatica 2: Expert $MODPACK_VERSION"

# Can be "markdown", "text" or "html"
# Default: $CLIENT_CHANGELOG_TYPE
$SERVER_CHANGELOG_TYPE = $CLIENT_CHANGELOG_TYPE

# Must be a single string. Use Powershell escaping for new lines etc. New line is `n and indent is `t
# Default: $CLIENT_CHANGELOG
$SERVER_CHANGELOG = $CLIENT_CHANGELOG

# Can be "alpha", "beta" or "release"
# Default: $CLIENT_RELEASE_TYPE
$SERVER_RELEASE_TYPE = $CLIENT_RELEASE_TYPE

# Default: "$CLIENT_NAME Server $MODPACK_VERSION"
$SERVER_ZIP_NAME = "$CLIENT_NAME`Server-$MODPACK_VERSION"

# Default: $SERVER_FILENAME
$SERVER_FILE_DISPLAY_NAME = "Enigmatica 2: Expert Server $MODPACK_VERSION"

# Path to the ModListCreators output file
$MODLIST_PATH = "$INSTANCE_ROOT/changelogs/modlist_$MODPACK_VERSION.md"
$CHANGELOG_PATH = "$INSTANCE_ROOT/changelogs/CHANGELOG_MODS_$MODPACK_VERSION.md"
