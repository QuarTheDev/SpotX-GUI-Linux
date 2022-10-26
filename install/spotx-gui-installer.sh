#!/usr/bin/env bash

## VARIABLES ##

INSTALL_PATH=$(readlink -e `type -p spotify` 2>/dev/null | rev | cut -d/ -f2- | rev);
CACHE_PATH="${HOME}/.cache/spotify/"
XPUI_PATH="${INSTALL_PATH}/Apps"
XPUI_DIR="${XPUI_PATH}/xpui"
XPUI_BAK="${XPUI_PATH}/xpui.bak"
XPUI_SPA="${XPUI_PATH}/xpui.spa"
XPUI_JS="${XPUI_DIR}/xpui.js"
XPUI_CSS="${XPUI_DIR}/xpui.css"
HOME_V2_JS="${XPUI_DIR}/home-v2.js"
VENDOR_XPUI_JS="${XPUI_DIR}/vendor~xpui.js"
CACHE_FLAG='FALSE'
EXPERIMENTAL_FLAG='FALSE'
FORCE_FLAG='FALSE'
PREMIUM_FLAG='FALSE'
## VARIABLES ##

# Dependencies check
command -v yad >/dev/null || { echo -e "\nYAD was not found, installation canceled.\n\nTry running 'sudo apt install yad' for a working GUI." >&2; exit 1; }
## SEPARATOR ##

yad \
	--borders=15 \
	--no-escape \
	--image=icons/icon64x64.png \
	--width=500 \
	--height=0 \
	--fixed \
	--button="Next >":0 \
	--button="Cancel":1 \
	--title="SpotX Installer" \
	--text='<span font="16"><b>Welcome to the SpotX Setup Wizard!</b></span>\n\nThis will install SpotX on your computer.\n\nIt is recommended that you close all other applications before continuing.\n\nClick Next to continue, or Cancel to exit Setup.\n'

test $? -ne 0 && yad --borders=15 --title="SpotX Installer" --text="Are you sure you want to cancel the SpotX installation?" --button="Yes":2 --button="No":3;
case $? in
    2) exit;;
    3) exec $0;;
esac

yad \
	--borders=15 \
	--text-info \
	--no-escape \
	--filename=license \
	--wrap \
	--image=icons/icon64x64.png \
	--width=550 \
	--height=500 \
	--fixed \
	--button="I Agree":0 \
	--button="Cancel":1 \
	--title="SpotX-GUI Installer" \
	--text='<span font="16"><b>License Agreement</b></span>\n\nPlease read the following license agreement carefully.'\

test $? -ne 0 && yad --borders=15 --title="SpotX Installer" --text="Are you sure you want to cancel the SpotX installation?" --button="Yes":2 --button="No":3;
case $? in
    2) exit;;
    3) exec $0;;
esac

chk=$(yad \
	--output-by-row \
	--borders=15 \
	--image=icons/icon64x64.png \
	--no-escape \
	--text='<span font="16"><b>Choose Components</b></span>\n\nCheck the components you want to install and\nuncheck the components you do not want to install.\n<a href="https://github.com/SpotX-CLI/SpotX-Linux#optional-install-arguments">Learn more</a>\n' \
	--form \
	--fixed \
	--field "Enable experimental features":CHK FALSE \
	--field "Force patch":CHK FALSE \
	--field "Clear app cache":CHK FALSE \
	--field "Premium subscription setup":CHK FALSE \
	--title="SpotX-GUI Installer" \
	--button="Next >":0 \
	--button="Cancel":1 \
)

test $? -ne 0 && yad --borders=15 --title="SpotX Installer" --text="Are you sure you want to cancel the SpotX installation?" --button="Yes":2 --button="No":3;
case $? in
    2) exit;;
    3) exec $0;;
esac

IFS="|" read -r EXPERIMENTAL_FLAG FORCE_FLAG CACHE_FLAG PREMIUM_FLAG <<< "$chk"

INSTALL_PATH=$(yad \
	--borders=15 \
	--image=icons/icon64x64.png \
	--no-escape \
	--text='<span font="16"><b>Choose Install Location</b></span>\n\nChoose the location you wish to install SpotX.\n' \
	--title="SpotX-GUI Installer" \
	--button="Next >" \
	--button="Cancel":1 \
	--form \
	--fixed \
	--field "Path" "$INSTALL_PATH" \
)

test $? -ne 0 && yad --borders=15 --title="SpotX Installer" --text="Are you sure you want to cancel the SpotX installation?" --button="Yes":2 --button="No":3;
case $? in
    2) exit;;
    3) exec $0;;
esac

echo CHECKSUM
echo CACHE_FLAG=$CACHE_FLAG
echo EXPERIMENTAL_FLAG=$EXPERIMENTAL_FLAG
echo FORCE_FLAG=$FORCE_FLAG
echo PREMIUM_FLAG=$PREMIUM_FLAG
echo OK

## SEPARATOR ##

## SPOTX VARIABLES ONLY ##

PERL="perl -pi -w -e"

# Ad-related regex
AD_EMPTY_AD_BLOCK='s|adsEnabled:!0|adsEnabled:!1|'
AD_PLAYLIST_SPONSORS='s|allSponsorships||'
AD_UPGRADE_BUTTON='s/(return|.=.=>)"free"===(.+?)(return|.=.=>)"premium"===/$1"premium"===$2$3"free"===/g'
AD_AUDIO_ADS='s/(case .:|async enable\(.\)\{)(this.enabled=.+?\(.{1,3},"audio"\),|return this.enabled=...+?\(.{1,3},"audio"\))((;case 4:)?this.subscription=this.audioApi).+?this.onAdMessage\)/$1$3.cosmosConnector.increaseStreamTime(-100000000000)/'
AD_BILLBOARD='s|.(\?\[.{1,6}[a-zA-Z].leaderboard,)|false$1|'
AD_UPSELL='s|(Enables quicksilver in-app messaging modal",default:)(!0)|$1false|'

# Experimental (A/B test) features
#ENABLE_BALLOONS='s|(Enable showing balloons on album release date anniversaries",default:)(!1)|$1true|s'
ENABLE_BLOCK_USERS='s|(Enable block users feature in clientX",default:)(!1)|$1true|s'
#ENABLE_CAROUSELS='s|(Use carousels on Home",default:)(!1)|$1true|s'
#ENABLE_CLEAR_DOWNLOADS='s|(Enable option in settings to clear all downloads",default:)(!1)|$1true|s'
ENABLE_DISCOG_SHELF='s|(Enable a condensed disography shelf on artist pages",default:)(!1)|$1true|s'
ENABLE_ENHANCE_PLAYLIST='s|(Enable Enhance Playlist UI and functionality for end-users",default:)(!1)|$1true|s'
#ENABLE_ENHANCE_SONGS='s|(Enable Enhance Liked Songs UI and functionality",default:)(!1)|$1true|s'
#ENABLE_EQUALIZER='s|(Enable audio equalizer for Desktop and Web Player",default:)(!1)|$1true|s'
ENABLE_IGNORE_REC='s|(Enable Ignore In Recommendations for desktop and web",default:)(!1)|$1true|s'
#ENABLE_LIKED_SONGS='s|(Enable Liked Songs section on Artist page",default:)(!1)|$1true|s'
#ENABLE_LYRICS_CHECK='s|(With this enabled, clients will check whether tracks have lyrics available",default:)(!1)|$1true|s'
#ENABLE_LYRICS_MATCH='s|(Enable Lyrics match labels in search results",default:)(!1)|$1true|s'
ENABLE_MADE_FOR_YOU='s|(Show "Made For You" entry point in the left sidebar.,default:)(!1)|$1true|s'
#ENABLE_NEW_SIDEBAR='s|(Enable Your Library X view of the left sidebar",default:)(!1)|$1true|s'
ENABLE_PLAYLIST_CREATION_FLOW='s|(Enables new playlist creation flow in Web Player and DesktopX",default:)(!1)|$1true|s'
ENABLE_PLAYLIST_PERMISSIONS_FLOWS='s|(Enable Playlist Permissions flows for Prod",default:)(!1)|$1true|s'
#ENABLE_SEARCH_BOX='s|(Adds a search box so users are able to filter playlists when trying to add songs to a playlist using the contextmenu",default:)(!1)|$1true|s'
#ENABLE_SIMILAR_PLAYLIST='s/,(.\.isOwnedBySelf&&)((\(.{0,11}\)|..createElement)\(.{1,3}Fragment,.+?{(uri:.|spec:.),(uri:.|spec:.).+?contextmenu.create-similar-playlist"\)}\),)/,$2$1/s'

# Hide Premium-only features
HIDE_DL_QUALITY='s/(\(.,..jsxs\)\(.{1,3}|(.\(\).|..)createElement\(.{1,4}),\{(filterMatchQuery|filter:.,title|(variant:"viola",semanticColor:"textSubdued"|..:"span",variant:.{3,6}mesto,color:.{3,6}),htmlFor:"desktop.settings.downloadQuality.+?).{1,6}get\("desktop.settings.downloadQuality.title.+?(children:.{1,2}\(.,.\).+?,|\(.,.\){3,4},|,.\)}},.\(.,.\)\),)//'
HIDE_DL_ICON=' .BKsbV2Xl786X9a09XROH {display:none}'
HIDE_DL_MENU=' button.wC9sIed7pfp47wZbmU6m.pzkhLqffqF_4hucrVVQA {display:none}'
HIDE_VERY_HIGH=' #desktop\.settings\.streamingQuality>option:nth-child(5) {display:none}'

# Log-related regex
LOG_1='s|sp://logging/v3/\w+||g'
LOG_SENTRY='s|this\.getStackTop\(\)\.client=.|return;$&|'

# Spotify Connect unlock
CONNECT_1='s| connect-device-list-item--disabled||'
CONNECT_2='s|connect-picker.unavailable-to-control|spotify-connect|'
CONNECT_3='s|(className:.,disabled:)(..)|$1false|'
CONNECT_4='s/return (..isDisabled)(\?(..createElement|\(.{1,10}\))\(..,)/return false$2/'

## END SPOTX VARIABLES. REGEX##

# SPOTX FUNCTION #

# Detect client in PATH
if [[ ! -d "${INSTALL_PATH}" ]]; then
  echo -e "\nSpotify path not found.\nSet directory path with -P flag.\nExiting...\n"
  exit; fi

# xpui detection
if [[ ! -f "${XPUI_SPA}" ]]; then
  echo -e "\nxpui not found!\nReinstall Spotify then try again.\nExiting...\n"
  exit
else
  if [[ ! -w "${XPUI_PATH}" ]]; then
    echo -e "\nSpotX does not have write permission in Spotify directory.\nRequesting sudo permission...\n"
    sudo chmod a+wr "${INSTALL_PATH}" && sudo chmod a+wr -R "${XPUI_PATH}"; fi
  if [[ "${FORCE_FLAG}" == "false" ]]; then
    if [[ -f "${XPUI_BAK}" ]]; then
      echo "SpotX backup found, SpotX has already been used on this install."
      echo -e "Re-run SpotX using the '-f' flag to force xpui patching.\n"
      echo "Skipping xpui patches and continuing SpotX..."
      XPUI_SKIP="true"
    else
      echo "Creating xpui backup..."
      cp "${XPUI_SPA}" "${XPUI_BAK}"
      XPUI_SKIP="false"; fi
  else
    if [[ -f "${XPUI_BAK}" ]]; then
      echo "Backup xpui found, restoring original..."
      rm "${XPUI_SPA}"
      cp "${XPUI_BAK}" "${XPUI_SPA}"
      XPUI_SKIP="false"
    else
      echo "Creating xpui backup..."
      cp "${XPUI_SPA}" "${XPUI_BAK}"
      XPUI_SKIP="false"; fi; fi; fi

# Extract xpui.spa
if [[ "${XPUI_SKIP}" == "false" ]]; then
  echo "Extracting xpui..."
  unzip -qq "${XPUI_SPA}" -d "${XPUI_DIR}"
  if grep -Fq "SpotX" "${XPUI_JS}"; then
    echo -e "\nWarning: Detected SpotX patches but no backup file!"
    echo -e "Further xpui patching not allowed until Spotify is reinstalled/upgraded.\n"
    echo "Skipping xpui patches and continuing SpotX..."
    XPUI_SKIP="true"
    rm "${XPUI_BAK}" 2>/dev/null
    rm -rf "${XPUI_DIR}" 2>/dev/null
  else
    rm "${XPUI_SPA}"; fi; fi

## APPLICATION OF SPOTX STARTS HERE ##

echo "Applying SpotX patches..."

if [[ "${XPUI_SKIP}" == "false" ]]; then
  if [[ "${PREMIUM_FLAG}" == "false" ]]; then
    # Remove Empty ad block
    echo "Removing empty ad block..."
    $PERL "${AD_EMPTY_AD_BLOCK}" "${XPUI_JS}"
    
    # Remove Playlist sponsors
    echo "Removing playlist sponsors..."
    $PERL "${AD_PLAYLIST_SPONSORS}" "${XPUI_JS}"
    
    # Remove Upgrade button
    echo "Removing upgrade button..."
    $PERL "${AD_UPGRADE_BUTTON}" "${XPUI_JS}"
    
    # Remove Audio ads
    echo "Removing audio ads..."
    $PERL "${AD_AUDIO_ADS}" "${XPUI_JS}"
    
    # Remove billboard ads
    echo "Removing billboard ads..."
    $PERL "${AD_BILLBOARD}" "${XPUI_JS}"
    
    # Remove premium upsells
    echo "Removing premium upselling..."
    $PERL "${AD_UPSELL}" "${XPUI_JS}"
    
    # Remove Premium-only features
    echo "Removing premium-only features..."
    $PERL "${HIDE_DL_QUALITY}" "${XPUI_JS}"
    echo "${HIDE_DL_ICON}" >> "${XPUI_CSS}"
    echo "${HIDE_DL_MENU}" >> "${XPUI_CSS}"
    echo "${HIDE_VERY_HIGH}" >> "${XPUI_CSS}"
    
    # Unlock Spotify Connect
    echo "Unlocking Spotify Connect..."
    $PERL "${CONNECT_1}" "${XPUI_JS}"
    $PERL "${CONNECT_2}" "${XPUI_JS}"
    $PERL "${CONNECT_3}" "${XPUI_JS}"
    $PERL "${CONNECT_4}" "${XPUI_JS}"
  else
    echo "Premium subscription setup selected..."; fi; fi

# Experimental patches
if [[ "${XPUI_SKIP}" == "false" ]]; then
  if [[ "${EXPERIMENTAL_FLAG}" == "true" ]]; then
    echo "Adding experimental features..."
    #$PERL "${ENABLE_BALLOONS}" "${XPUI_JS}"
    $PERL "${ENABLE_BLOCK_USERS}" "${XPUI_JS}"
    #$PERL "${ENABLE_CAROUSELS}" "${XPUI_JS}"
    #$PERL "${ENABLE_CLEAR_DOWNLOADS}" "${XPUI_JS}"
    $PERL "${ENABLE_DISCOG_SHELF}" "${XPUI_JS}"
    $PERL "${ENABLE_ENHANCE_PLAYLIST}" "${XPUI_JS}"
    #$PERL "${ENABLE_ENHANCE_SONGS}" "${XPUI_JS}"
    #$PERL "${ENABLE_EQUALIZER}" "${XPUI_JS}"
    #$PERL "${ENABLE_IGNORE_REC}" "${XPUI_JS}"
    $PERL "${ENABLE_LIKED_SONGS}" "${XPUI_JS}"
    #$PERL "${ENABLE_LYRICS_CHECK}" "${XPUI_JS}"
    #$PERL "${ENABLE_LYRICS_MATCH}" "${XPUI_JS}"
    $PERL "${ENABLE_MADE_FOR_YOU}" "${XPUI_JS}"
    #$PERL "${ENABLE_NEW_SIDEBAR}" "${XPUI_JS}"
    $PERL "${ENABLE_PLAYLIST_CREATION_FLOW}" "${XPUI_JS}"
    $PERL "${ENABLE_PLAYLIST_PERMISSIONS_FLOWS}" "${XPUI_JS}"
    #$PERL "${ENABLE_SEARCH_BOX}" "${XPUI_JS}"
    #$PERL "${ENABLE_SIMILAR_PLAYLIST}" "${XPUI_JS}"
  fi; fi

# Remove logging
if [[ "${XPUI_SKIP}" == "false" ]]; then
  echo "Removing logging..."
  $PERL "${LOG_1}" "${XPUI_JS}"
  $PERL "${LOG_SENTRY}" "${VENDOR_XPUI_JS}"; fi

# Delete app cache
if [[ "${CACHE_FLAG}" == "true" ]]; then
  echo "Clearing app cache..."
  rm -rf "$CACHE_PATH"; fi
  
# Rebuild xpui.spa
if [[ "${XPUI_SKIP}" == "false" ]]; then
  echo "Rebuilding xpui..."
  echo -e "\n//# SpotX was here" >> "${XPUI_JS}"; fi

# Zip files inside xpui folder
if [[ "${XPUI_SKIP}" == "false" ]]; then
  (cd "${XPUI_DIR}"; zip -qq -r ../xpui.spa .)
  rm -rf "${XPUI_DIR}"; fi

yad \
	--borders=15 \
	--no-escape \
	--image=icons/icon64x64.png \
	--width=500 \
	--height=0 \
	--fixed \
	--button="Exit":0 \
	--title="SpotX Installer" \
	--text='<span font="16"><b>Installation finished!</b></span>\n\nSpotX patch has finished successfully. Try opening Spotify!'
