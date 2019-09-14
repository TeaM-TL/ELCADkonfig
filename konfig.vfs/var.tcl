# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: var.tcl 18 2013-01-26 22:44:19Z tlu $
########################  READING AND SETTING VARIABLES 
if {$filehandle ne 0} {
    ## Background
    if [ ::ini::exists $filehandle WIN_Graphik] then {
	if [ ::ini::exists $filehandle WIN_Graphik] then {
	    set aucbk [::ini::value $filehandle WIN_Graphik ColorsEqualEditor35]
	} else {
	   set aucbk 0
#	    tk_messageBox -icon warning \
	       -title [mc "Entry not exists!"] \
	       -message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" ColorsEqualEditor35 [::ini::filename $filehandle]] \
	       -type ok
	}
    } else {
	set aucbk 0
#	tk_messageBox -icon warning \
	    -title [mc "Entry not exists!"] \
	    -message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" WIN_Graphik [::ini::filename $filehandle]] \
	    -type ok
    }
    ## Flying Licence
    set str Server
    if [ ::ini::exists $filehandle Licence] then {
	if [ ::ini::exists $filehandle Licence] then {
	    set aucfl [::ini::value $filehandle Licence Mode]
	    if {$aucfl eq $str} then { set aucfl 1 } else { set aucfl 0 }
	    ## Programs
	    set aucprg 0
	    for { set curr 1 } { $curr <= $NoP } { incr curr } {
		if [ ::ini::exists $filehandle Licence [ ini::value $tdinihandle Products Entry$curr ]] then {
		    set aucprgx [ ::ini::value $filehandle Licence [ ini::value $tdinihandle Products Entry$curr ] ]
		    if {$aucprgx eq 1} then {
			set aucprg $curr
		    }
		} else {
#		    tk_messageBox -icon warning \
			-title [mc "Entry not exists!"] \
			-message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" [ ini::value $tdinihandle Products Entry$curr ] [::ini::filename $filehandle]] \
			-type ok
		}
	    }
	    ## Interfaces
	    for { set curr 1 } { $curr <= $NoI } { incr curr } {
		if [::ini::exists $filehandle Licence [ ini::value $tdinihandle Interfaces Entry$curr ]] then { 
		    set aucint$curr [::ini::value $filehandle Licence [ ini::value $tdinihandle Interfaces Entry$curr ]]
		} else {
		    set aucint$curr 0
#		    tk_messageBox -icon warning \
			-title [mc "Entry not exists!"] \
			-message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" [ ini::value $tdinihandle Interfaces Entry$curr ] [::ini::filename $filehandle]] \
			-type ok
		}
	    }
	    # Other modules
	    for { set curr 1 } { $curr <= $NoO } { incr curr } {
		if [::ini::exists $filehandle Licence [ ini::value $tdinihandle Other Entry$curr ]] then { 
		    set aucoth$curr [::ini::value $filehandle Licence [ ini::value $tdinihandle Other Entry$curr ]]
		} else {
		    set aucoth$curr 0
#		    tk_messageBox -icon warning \
			-title [mc "Entry not exists!"] \
			-message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" [ ini::value $tdinihandle Other Entry$curr ] [::ini::filename $filehandle]] \
			-type ok
		}
	    }
	} else {
#	    tk_messageBox -icon warning \
		-title [mc "Entry not exists!"] \
		-message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" Mode [::ini::filename $filehandle]] \
		-type ok
	}
    } else {
#	tk_messageBox -icon warning \
	    -title [mc "Entry not exists!"] \
	    -message [mc "Entry %s not exists in file: %s\nDuring save will added into AUCOTEC.INI file" License [::ini::filename $filehandle]] \
	    -type ok
    }
    
    update
}
# EOF
