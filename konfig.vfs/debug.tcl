# -*-Tcl-*-
## 2004-2010 Tomasz Luczak <tlu@temertech.com>
# $Id: debug.tcl 16 2013-01-26 15:30:54Z tlu $
# Window for debugging
if [winfo exists .debug] then {destroy .debug}

toplevel .debug
wm title .debug "Debug info"

label .debug.li1 -text "pwd"
label .debug.l1 -text [pwd]

label .debug.li2 -text aucprg
label .debug.l2 -textvariable aucprg

label .debug.li3 -text curr
label .debug.l3 -textvariable curr

label .debug.li4 -text No
label .debug.l4 -textvariable No

label .debug.li5 -text -aucint-curr
label .debug.l5 -textvariable aucint$curr

label .debug.li6 -text texfile
label .debug.l6 -textvariable texfile

label .debug.li7 -text dirtexmfcnf
label .debug.l7 -textvariable dirtexmfcnf 

label .debug.li8 -text dircd
label .debug.l8 -textvariable dircd

label .debug.li9 -text starkit
label .debug.l9 -textvariable starkit

label .debug.li10 -text starkit::topdir
label .debug.l10 -textvariable starkit::topdir

## display labels and variables
grid .debug.li1 .debug.l1
grid .debug.li2 .debug.l2
grid .debug.li3 .debug.l3
grid .debug.li4 .debug.l4
grid .debug.li5 .debug.l5
grid .debug.li6 .debug.l6
grid .debug.li7 .debug.l7
grid .debug.li8 .debug.l8
grid .debug.li9 .debug.l9
grid .debug.li10 .debug.l10


## EOF