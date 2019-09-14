# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: load.tcl 17 2013-01-26 18:45:35Z tlu $

if {[.f.pw2.f21.lb size] >0} then {
    .f.pw2.f21.lb activate 0
    focus .f.pw2.f21.lb
    set filename [.f.pw2.f21.lb get 0]
    readfile $filename
    source $filevar
    update
    .f.pw1.f13.b1 configure -state normal
} else {
    .f.pw1.f13.b1 configure -state disabled
}
source $filechange
# EOF