# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: change.tcl 17 2013-01-26 18:45:35Z tlu $
######################## GUI   
if { $aucfl eq 0 } {
  	changestatus .f.pw2.f22.nb.licence.fprg.rb disable  $NoP
	changestatus .f.pw2.f22.nb.licence.fint.cbi disable $NoI
	changestatus .f.pw2.f22.nb.licence.foth.cbo disable $NoO
} else {
	changestatus .f.pw2.f22.nb.licence.fprg.rb normal  $NoP
	changestatus .f.pw2.f22.nb.licence.fint.cbi normal $NoI
	changestatus .f.pw2.f22.nb.licence.foth.cbo normal $NoO
}

# EOF
