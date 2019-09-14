# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: guinb1.tcl 17 2013-01-26 18:45:35Z tlu $
####################################### 
# Licence selector

#######################     row 1 
ttk::label .f.pw2.f22.nb.licence.l -text [mc "Select program and modules for flying licence"]

#######################     row 2
## Programs
ttk::labelframe .f.pw2.f22.nb.licence.fprg -text [mc "Programs"]

set NoP [ini::value $tdinihandle Products No]
for { set curr 1 } { $curr <= $NoP } { incr curr } {
    ttk::radiobutton .f.pw2.f22.nb.licence.fprg.rb$curr \
	-text [ ini::value $tdinihandle Products Name$curr ] \
	-variable aucprg \
	-value $curr \
	-command { set aucprg [string index [focus] end ] }
    pack .f.pw2.f22.nb.licence.fprg.rb$curr \
	-side top -anchor w -padx 2m -fill y -expand yes
}

## Modules interface
ttk::labelframe .f.pw2.f22.nb.licence.fint -text [mc "Interfaces modules"] 

set NoI [ini::value $tdinihandle Interfaces No]
for { set curr 1 } { $curr <= $NoI } { incr curr } {
    ttk::checkbutton .f.pw2.f22.nb.licence.fint.cbi$curr \
	-text [ ini::value $tdinihandle Interfaces Name$curr ] \
	-variable aucint$curr 
    pack .f.pw2.f22.nb.licence.fint.cbi$curr \
	-side top -anchor w -padx 2m -fill y -expand yes
}

## Modules other
ttk::labelframe .f.pw2.f22.nb.licence.foth -text [mc "Other modules"]

set NoO [ini::value $tdinihandle Other No]
for { set curr 1 } { $curr <= $NoO } { incr curr } {
    ttk::checkbutton .f.pw2.f22.nb.licence.foth.cbo$curr \
	-text [ ini::value $tdinihandle Other Name$curr ] \
	-variable aucoth$curr 
    pack .f.pw2.f22.nb.licence.foth.cbo$curr \
	-side top -anchor w -padx 2m -fill y -expand yes
}

############################### row 3

### Felics
ttk::labelframe .f.pw2.f22.nb.licence.ffl -text [mc "Kind of licencing"]

  ttk::radiobutton .f.pw2.f22.nb.licence.ffl.on  -text [mc "Hardlock"] -variable aucfl -value 0 \
    -command { set aucfl 0 ; source $filechange }
ttk::radiobutton .f.pw2.f22.nb.licence.ffl.off -text [mc "Flying licence"] -variable aucfl -value 1 \
    -command { set aucfl 1 ; source $filechange }

pack .f.pw2.f22.nb.licence.ffl.on .f.pw2.f22.nb.licence.ffl.off -side left -padx 2m -pady 2m

##### pack frames

grid .f.pw2.f22.nb.licence.l      -row 1 -column 1 -padx 2m -pady 2m -sticky nswe -columnspan 3
grid .f.pw2.f22.nb.licence.fprg -row 2 -column 1 -padx 2m -pady 2m -sticky nswe
grid .f.pw2.f22.nb.licence.fint  -row 2 -column 2 -padx 2m -pady 2m -sticky nswe
grid .f.pw2.f22.nb.licence.foth -row 2 -column 3 -padx 2m -pady 2m -sticky nswe -rowspan 2
grid .f.pw2.f22.nb.licence.ffl    -row 3 -column 1 -padx 2m -pady 2m -sticky nswe -columnspan 2

# EOF
