# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: gui.tcl 17 2013-01-26 18:45:35Z tlu $
####################################### GUI
wm title . [mc "Config tool for ELCAD/AUCOPLAN %s, ver. %s" $ELCAD $RELEASE]
#wm resizable . 0 0
wm iconbitmap . -default $sourcedir/konfig.ico

#ttk::frame .f
ttk::frame .f 
pack .f -fill both -expand 1 -ipadx 10
######################   row 1 ---------------------------------------------------
ttk::panedwindow .f.pw1 -orient horizontal

### Select directory
ttk::labelframe .f.pw1.f11 -text [mc "Path for users folders"]

ttk::label  .f.pw1.f11.l -width 50 -textvariable dirname -relief sunken -anchor w
ttk::button .f.pw1.f11.b -text [mc "Select"] -command "infowait 1; selectAndLoadDir; source \"$fileload\"; infowait 0" 
pack .f.pw1.f11.l -side left -padx 2m -pady 2m -fill both -expand 1
pack .f.pw1.f11.b -side left -padx 2m -pady 2m

### Help, Save and Exit
ttk::labelframe .f.pw1.f13 
#
ttk::button .f.pw1.f13.bh -text [mc "Help"] -command {help}
#
ttk::button .f.pw1.f13.b1 -text [mc "Save"] -command { source $filewrite }
#  
ttk::button .f.pw1.f13.b2 -text [mc "Exit"] -command {
    if { $filehandle ne 0 } {
	::ini::close $filehandle
    }
    exit
}
pack .f.pw1.f13.b2 .f.pw1.f13.b1 .f.pw1.f13.bh -side right -pady 2m -padx 2m

####
pack .f.pw1.f11 .f.pw1.f13 -padx 2m -pady 2m -fill x -expand 1

########################   row 2 --------------------------------------------------
#frame listbox  + scrollbars
ttk::panedwindow .f.pw2 -orient horizontal

ttk::labelframe .f.pw2.f21 -text [mc "Select config file"]

listbox .f.pw2.f21.lb \
	-width 50 \
	-yscrollcommand ".f.pw2.f21.scry set"  \
	-xscrollcommand ".f.pw2.f21.scrx set"
ttk::scrollbar .f.pw2.f21.scrx -command ".f.pw2.f21.lb xview" -orient horizontal 
ttk::scrollbar .f.pw2.f21.scry -command ".f.pw2.f21.lb yview" -orient vertical
pack .f.pw2.f21.scrx -side bottom -fill x
pack .f.pw2.f21.scry -side right -fill y
pack .f.pw2.f21.lb -expand 1 -fill both
loaddirectory
bind .f.pw2.f21.lb <Button-1> "listcurrent %x %y; source \"$filevar\"; source \"$filechange\"; update"

# autohide scroll
::autoscroll::autoscroll .f.pw2.f21.scrx
::autoscroll::autoscroll .f.pw2.f21.scry

# Notebook
ttk::labelframe .f.pw2.f22

#set nb [tnotebook .nb -padding 6]
#ttk::notebook::enableTraversal $nb

ttk::notebook .f.pw2.f22.nb 
pack .f.pw2.f22.nb  -expand 1 -fill both -padx 1m -pady 1m

set nblicence  [frame .f.pw2.f22.nb.licence]
.f.pw2.f22.nb add .f.pw2.f22.nb.licence -text [mc "Licences"]
.f.pw2.f22.nb select $nblicence
.f.pw2.f22.nb add [frame .f.pw2.f22.nb.color] -text [mc "Colors"]
.f.pw2.f22.nb add [frame .f.pw2.f22.nb.edit] -text [mc "Licence editor"]


# notebook Licence
source $filegui1

# notebook Colors
source $filegui2
# notebook ELCAD_ID
source $filegui3

###


grid .f.pw2.f21 .f.pw2.f22 -pady 2m -padx 2m -sticky nswe

############################# row 3 ------------------------------------------------
ttk::frame .f.pw3

# status
ttk::label .f.pw3.l31 -textvariable l31info
pack  .f.pw3.l31

############################# status bar -------------------------------------------
ttk::frame .f.pw4

ttk::label .f.pw4.licence -foreground blue -relief ridge -borderwidth 2 \
	-text " (c) 2004-2013 Tomasz Luczak http://www.temertech.com"
pack .f.pw4.licence -fill both -expand 1

#############################  frames

pack .f.pw1 .f.pw2 .f.pw3 .f.pw4 -padx 1m -pady 1m -expand 1 -fill both -side top

############################# paned frame
.f.pw1 add .f.pw1.f11
.f.pw1 add .f.pw1.f13

.f.pw2 add .f.pw2.f21
.f.pw2 add .f.pw2.f22

############################ END of PANTING GUI ------------------------------------

# after open tdtool disable button "Save", because no selected file for edit
.f.pw1.f13.b1 configure -state disabled

# automaticaly load first file if list is not empty
source  $fileload

# Open help after F1 keypresed
bind . <F1> {help}

# for debug only, display path
# bind . <F9> {source $filedebug}
# debug console
#bind . <F4> {console show}

# EOF
