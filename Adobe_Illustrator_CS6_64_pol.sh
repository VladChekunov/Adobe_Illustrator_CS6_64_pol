#!/bin/bash
# Date : (2018-08-30)
# Distribution used to test : Ubuntu 16.04.4 LTS 64-bit
# Author : RoninDusette
# Licence : GPLv3
# PlayOnLinux : 4.2.2
# Comment : Slightly modified code from RoninDusette`s Adobe Illustrator CS6 32bit script
 
 
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
       
PREFIX="IllustratorCS6"
WINEVERSION="3.14"
TITLE="Adobe Illustrator CS6"
EDITOR="Adobe Systems Inc."
GAME_URL="http://www.adobe.com"
AUTHOR="RoninDusette"
POL_System_SetArch "amd64"
export WINEARCH='win64'



#Initialization
POL_GetSetupImages "http://files.playonlinux.com/resources/setups/$PREFIX/top.jpg" "http://files.playonlinux.com/resources/setups/$PREFIX/left.jpg" "$TITLE"
POL_SetupWindow_Init
POL_SetupWindow_SetID 2316
 
POL_Debug_Init
 
# Presentation
POL_SetupWindow_presentation "$TITLE" "$EDITOR" "$GAME_URL" "$AUTHOR" "$PREFIX"
 
# Create Prefix
POL_SetupWindow_browse "$(eval_gettext 'Please select $TITLE install file.')" "$TITLE"
INSTALLER="$APP_ANSWER"
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WINEVERSION"
 
# Configuration
Set_OS "winxp"
 
#Dependencies
POL_Call POL_Install_AdobeAir
POL_Call POL_Install_atmlib
POL_Call POL_Install_gdiplus
POL_Call POL_Install_msxml3
POL_Call POL_Install_msxml6
POL_Call POL_Install_vcrun2005
POL_Call POL_Install_vcrun2008
POL_Call POL_Install_vcrun2010
POL_Call POL_Install_corefonts
POL_Call POL_Install_tahoma2
POL_Call POL_Install_FontsSmoothRGB
 
POL_SetupWindow_message "$(eval_gettext 'NOTICE: If you get an error saying that the installation failed, wait at least 5 minutes before closing it. PlayOnLinux will finish the install, even though it crashed.')" "$TITLE"
 
 
# Installation
Set_OS "win7"
POL_Wine_WaitBefore "$TITLE"
POL_Wine "$INSTALLER"
POL_Wine_WaitExit "$TITLE"
 
# Create Shortcuts
POL_Shortcut "illustrator.exe" "$TITLE"
 
POL_SetupWindow_message "$(eval_gettext 'NOTICE: Online updates and any 3D services do not work. If you want to update your install, you will need to download the update manually and install it in this virtual drive.')" "$TITLE"
 
POL_SetupWindow_Close
exit 0
