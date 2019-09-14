# this is a -*-Tcl-*- file
## ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: write.tcl 17 2013-01-26 18:45:35Z tlu $
# Background
#::ini::set $filehandle WIN_Graphik ColorsEqualEditor35	$aucbk
set dirname [file dirname $filename]
set filergb [file join $dirname rgb_def]
switch $aucbk {
    0 { catch { file delete $filergb } 
	::ini::set $filehandle WIN_Graphik ColorsEqualEditor35 0
    }
    1 { ::ini::set $filehandle WIN_Graphik ColorsEqualEditor35 1
	catch { file delete $filergb }
    }
    2 { file copy -force [file join $dirname rgb_def.16] $filergb 
	::ini::set $filehandle WIN_Graphik ColorsEqualEditor35 0
    }
    3 { file copy -force [file join $dirname rgb_def.35] $filergb 
	::ini::set $filehandle WIN_Graphik ColorsEqualEditor35 0
    }
    4 { file copy -force [file join $dirname rgb_def.50] $filergb 
	::ini::set $filehandle WIN_Graphik ColorsEqualEditor35 0
    }
}
# if any color selected then modify rgb_def file
if { ($selcolor == 1) && ($aucbk > 2) } then {
	set filergbcontents "VER=2\n[convColor sw $colorsw]\n[convColor ws $colorws]\n[convColor rt $colorrt]\n[convColor ge $colorge]\n[convColor gn $colorgn]\n[convColor bl $colorbl]\n[convColor cy $colorcy]\n[convColor mg $colormg]\n[convColor p0 $colorp0]\n[convColor p1 $colorp1]\n[convColor p2 $colorp2]\n[convColor p3 $colorp3]\n[convColor p4 $colorp4]\n[convColor p5 $colorp5]\n[convColor p6 $colorp6]\n[convColor p7 $colorp7]"
	catch {open $filergb w } filehandlergb
	fconfigure $filehandlergb -translation {crlf lf}
	puts -nonewline $filehandlergb $filergbcontents
	close $filehandlergb
}

# Licence
switch $aucfl {
    1 {
	::ini::set $filehandle Licence Mode Server
	# Programs
	for { set curr 1 } { $curr <= $NoP } { incr curr } {
	    if {$aucprg eq $curr} then {
		set aucprgvalue 1
	    } else {
		set aucprgvalue 0
	    }
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Products Entry$curr ] $aucprgvalue
	}
	# Interfaces
	for { set curr 1 } { $curr <= $NoI } { incr curr } {
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Interfaces Entry$curr ]  [eval {set aucint$curr}]
	}
	# Other modules
	for { set curr 1 } { $curr <= $NoO } { incr curr } {
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Other Entry$curr ] [eval {set aucoth$curr}]
	}
    }
    0 {
	::ini::set $filehandle Licence Mode		   Local
	# Programs
	for { set curr 1 } { $curr <= $NoP } { incr curr } {
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Products Entry$curr ] 0
	}
	# Interfaces
	for { set curr 1 } { $curr <= $NoI } { incr curr } {
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Interfaces Entry$curr ] 0
	}
	# Other modules
	for { set curr 1 } { $curr <= $NoO } { incr curr } {
	    ::ini::set $filehandle Licence [ ini::value $tdinihandle Other Entry$curr ] 0 
	}
    }
}
# Write to INI file
if { [catch {::ini::commit $filehandle}] } {
    tk_messageBox -title [mc "Write file failed!"] \
	-message [mc "Write file %s failed!\nCheck file permissions and whether it exist.\nMay be ELCAD/AUCOPLAN is running\nand bloked this file.\nClose ELCAD/AUCOPLAN i try again." $filename ] \
	-type ok \
	-icon error
}

# Write do ELCAD_ID file
set fileliccontents [.f.pw2.f22.nb.edit.lf.text get 0.0 end]
if { [string length $fileliccontents] ne "0" } {
    catch {open $filenamelic w } filehandlelic
    fconfigure $filehandlelic -translation {lf crlf}
    puts -nonewline $filehandlelic $fileliccontents
    close $filehandlelic
} else {
    catch { file delete $filenamelic }	
}


# EOF
