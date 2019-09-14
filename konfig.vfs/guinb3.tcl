# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: guinb3.tcl 18 2013-01-26 22:44:19Z tlu $
####################################### 
# Licence editor

ttk::labelframe .f.pw2.f22.nb.edit.lf -text [mc "Edit licence file"]
pack .f.pw2.f22.nb.edit.lf -padx 2m -pady 2m -expand 1 -fill both
  
ctext .f.pw2.f22.nb.edit.lf.text -relief sunken -wrap word -font {Courier 10}\
	-width 1 -height 20 \
	-yscrollcommand ".f.pw2.f22.nb.edit.lf.scroll set" \
	-bd 2 -setgrid 1  -undo 1 -autosep 1
ttk::scrollbar .f.pw2.f22.nb.edit.lf.scroll -command ".f.pw2.f22.nb.edit.lf.text yview"
pack .f.pw2.f22.nb.edit.lf.scroll -side right -fill y
pack .f.pw2.f22.nb.edit.lf.text -expand 1 -fill both
.f.pw2.f22.nb.edit.lf.text insert 0.0 [mc "Select config file in first tabs"]
# autohide scroll
::autoscroll::autoscroll .f.pw2.f22.nb.edit.lf.scroll
# syntax highlight
ctext::addHighlightClassForRegexp .f.pw2.f22.nb.edit.lf.text comments blue {#.*$}

# EOF
