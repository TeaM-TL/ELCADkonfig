# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: proc.tcl 17 2013-01-26 18:45:35Z tlu $
########################  PROCEDURES
# display help
proc help {} {
    global filehelpdir

    help::destroy
    help::init [file nativename [file join $filehelpdir [mc "helpen"].html]]
}
## Choose color
proc chooseColor { initialColor nameColor} {
#    if $initialColor le 0; then {
#       set initialColor "#000000"
#    }
#    return [tk_chooseColor -initialcolor $initialColor -title [mc "Choose a color $nameColor"]]
    return [tk_chooseColor -title [mc "Choose a color $nameColor"]]
}
## Conwert color from hex to dec
proc convColor { nameColor color } {
    set Rcolor [scan [string range $color 1 2] %x]
    set Gcolor [scan [string range $color 3 4] %x]
    set Bcolor [scan [string range $color 5 6] %x]
    return "$nameColor $Rcolor $Gcolor $Bcolor"
}

# display status
proc infowait i {
    global l31info
    if {$i eq 1} {
	.f.pw3.l31 configure -foreground red
	set l31info [mc "Please wait. Searching files"]
	. configure -cursor wait
    } else {
	.f.pw3.l31 configure -foreground black
	set l31info [mc "Ready. Select file for edit"]
	. configure -cursor arrow
    }
}
### return filename form listbox and read file
proc listcurrent {x y} {
    global filename
    if { [.f.pw2.f21.lb size] ne 0} {
	set filename [.f.pw2.f21.lb get @$x,$y]
       readfile $filename
       .f.pw1.f13.b1 configure -state normal
    } else {
	.f.pw1.f13.b1 configure -state disabled
    }
    update
    set selcolor 0
}

### read directory and reloads the directory listbox
proc loaddirectory {} {
    global dirname filename filevar filechange filehandle
    .f.pw2.f21.lb delete 0 end
    foreach i [lsort [glob -nocomplain -directory $dirname aucotec.ini */aucotec.ini */*/aucotec.ini */*/*/aucotec.ini */*/*/*/aucotec.ini */*/*/*/*/aucotec.ini */*/*/*/*/*/aucotec.ini */*/*/*/*/*/*/aucotec.ini */*/*/*/*/*/*/*/aucotec.ini]] {
	.f.pw2.f21.lb insert end $i
    }
}

# This procedure pops up a dialog to ask for a directory to load into
# the listobox and (if the user presses OK) reloads the directory
# listbox from the directory named in entry.
proc selectAndLoadDir {} {
    global dirname
    set dir [tk_chooseDirectory -initialdir $dirname -parent . -mustexist 1]
    if {[string length $dir] != 0} {
	set dirname $dir
	loaddirectory
    }
}

########### open selected file
proc readfile { filename } {
    global filehandle
    global filenamelic
    
    # read INI file
    if { $filehandle ne 0 } {
	::ini::close $filehandle
    }
    if { [catch {::ini::open $filename } filehandle ] } {
	tk_messageBox -title [mc "Read file failed!"] \
	    -message [mc "Read file %s failed!\nCheck file permissions and whether it exist." $filename] \
	    -type ok \
	    -icon error
	set filehandle "0"
    } 
    
    set filenamelic [file join [file dirname $filename] elcad_id]
    if { [catch {open $filenamelic RDONLY} filehandlelic ] } {
	set fileliccontents ""
	
    } else {
	set fileliccontents [read -nonewline $filehandlelic]
	close $filehandlelic
    }
    # update texteditor
    .f.pw2.f22.nb.edit.lf.text delete 0.0 end
    .f.pw2.f22.nb.edit.lf.text insert 0.0 $fileliccontents
}

########### configure widget's state: disable or active
proc changestatus { var state count} {
    incr count
    for { set curr 1 } { $curr < $count } { incr curr } {
	$var$curr configure -state $state
    }
}

# EOF
