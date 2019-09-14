# this is a -*-Tcl-*- file
## ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: main.tcl 17 2013-01-26 18:45:35Z tlu $
############################
# Tcl/Tk 8.6.0
# Dodaæ do tclkit.exe encoding 1250 aby help dzia³a³!
############################## SETTINGS

############### version
set ELCAD "7.x"
set VERSION "3.1"
set SUBVERSION "0"
set TCLREV [info patchlevel]

set RELEASE "$VERSION.$SUBVERSION "

#########
package require starkit
starkit::startup
set sourcedir $starkit::topdir
package require cmdline
# main window
set TILEREV [package require tile]
append RELEASE "  \[$TCLREV, $TILEREV\]"
# splash
package require Splash
wm withdraw .
Splash::start -image $sourcedir/temertech.gif -delay 10000
#Splash::wait

#########
# Required parser INI file
package require inifile

# highlight syntax in text widget
package require ctext
# autohide scroll
package require autoscroll
# new dialogs windows
#package require fsdialog
# help
package require help
##### Setting translations
namespace import ::msgcat::mc*
#load language file, stored in msgs subdirectory
mcload [file join [pwd] msgs]

##### Setting auxiliary files
# Html helpBrowser
set displayhelp $sourcedir/displayhelp.tcl
set htmlhelpbrowser $sourcedir/lib/helpbrowser-tile/htmlbrowser.tcl
set filehelpdir [file join [file dirname $sourcedir] help]
# procedures
set fileproc "$sourcedir/proc.tcl"
# setting variables
set filevar  "$sourcedir/var.tcl"
# gui
set filegui  "$sourcedir/gui.tcl"
set filegui1 "$sourcedir/guinb1.tcl"
set filegui2 "$sourcedir/guinb2.tcl"
set filegui3 "$sourcedir/guinb3.tcl"

# change status: active/pasive
set filechange "$sourcedir/change.tcl"
# change colors within frames
set fileguinb2change "$sourcedir/guinb2change.tcl"
# write changes to file
set filewrite "$sourcedir/write.tcl"
# load file automaticaly
set fileload "$sourcedir/load.tcl"

# fro debug only
set filedebug "$sourcedir/debug.tcl"

############################## MAIN
#read ini file contain names of keys in AUCOTEC.INI
set tdtoolini [file join [pwd] konfig.ini]
if {[catch {ini::open $tdtoolini r} tdinihandle] eq 1} then {
    Splash::delete
    tk_messageBox -icon error \
	-title [mc "Read file failed!"] \
	-message [mc "Read file %s failed!\nCheck file permissions and whether it exist." $tdtoolini] \
	-type ok
    exit
}

## reading procedures
source $fileproc
# working directory
if [::ini::exists $tdinihandle Config InitialPath] then {
	set dirname [file normalize [::ini::value $tdinihandle Config InitialPath]]
} else {
	set dirname [file normalize ..\\..\\usr]
}
set filehandle "0"
set filenamelic ""
set aucfl 0
set selcolor 0

# painting GUI
source $filegui

# display status
infowait 0

#wm state . normal
Splash::delete 100000

## EOF
