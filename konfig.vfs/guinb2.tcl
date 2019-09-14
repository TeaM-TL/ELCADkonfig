# this is a -*-Tcl-*- file
### ELCAD/AUCOPLAN Config
## (c) 2004-2013 Tomasz Luczak <tlu@temertech.com>
# $Id: guinb2.tcl 17 2013-01-26 18:45:35Z tlu $
####################################### 
# Color editor


# defaults colors-- only temporary
set colorsw "#000000" 
set colorws "#FFFFFF" 
set colorrt "#FF0000"   
set colorge "#FFFF00"   
set colorgn "#00FF00"   
set colorbl "#0000FF" 
set colorcy "#00FFFF" 
set colormg "#FF00FF" 
set colorp0 "#C0C0C0" 
set colorp1 "#000000"   
set colorp2 "#00F000"   
set colorp3 "#FF0000"   
set colorp4 "#0000FF" 
set colorp5 "#00FF00"   
set colorp6 "#0000F0" 
set colorp7 "#0000FF"

#######################     row 1

### Background
ttk::labelframe .f.pw2.f22.nb.color.fbk -text [mc "Select color palette"]
grid .f.pw2.f22.nb.color.fbk -row 1 -column 1 -padx 2m -pady 2m -sticky nswe -columnspan 2

ttk::radiobutton .f.pw2.f22.nb.color.fbk.stdw -text [mc "Standard colors"] -variable aucbk -value 0 -command {
    set aucbk 0
}
ttk::radiobutton .f.pw2.f22.nb.color.fbk.stdb -text [mc "Custom colors"] -variable aucbk -value 1 -command {
    set aucbk 1
}
ttk::radiobutton .f.pw2.f22.nb.color.fbk.co16 -text [mc "Version16"] -variable aucbk -value 2 -command {
    set aucbk 2
    set colorsw "#000000" 
    set colorws "#FFFFFF" 
    set colorrt "#FF0000"   
    set colorge "#FFFF00"   
    set colorgn "#00FF00"   
    set colorbl "#0000FF" 
    set colorcy "#00FFFF" 
    set colormg "#FF00FF" 
    set colorp0 "#C0C0C0" 
    set colorp1 "#000000"   
    set colorp2 "#00F000"   
    set colorp3 "#FF0000"   
    set colorp4 "#0000FF" 
    set colorp5 "#00FF00"   
    set colorp6 "#0000F0" 
    set colorp7 "#0000FF"
    source $fileguinb2change
}
ttk::radiobutton .f.pw2.f22.nb.color.fbk.co35 -text [mc "Version35"] -variable aucbk -value 3 -command {
    set aucbk 3
    set colorsw "#000000" 
    set colorws "#FFFFFF" 
    set colorrt "#FF0000"   
    set colorge "#FFFF00"   
    set colorgn "#00FF00"   
    set colorbl "#0000FF" 
    set colorcy "#00FFFF" 
    set colormg "#FF00FF" 
    set colorp0 "#C0C0C0" 
    set colorp1 "#FFFFFF"   
    set colorp2 "#FFFF00"   
    set colorp3 "#FF0000"   
    set colorp4 "#00FF00" 
    set colorp5 "#00F000"   
    set colorp6 "#00FFFF" 
    set colorp7 "#FFFF00"
    source $fileguinb2change
}
ttk::radiobutton .f.pw2.f22.nb.color.fbk.co50 -text [mc "Version50"] -variable aucbk -value 4 -command {
    set aucbk 4
    set colorsw "#000000" 
    set colorws "#FFFFFF" 
    set colorrt "#FF0000"   
    set colorge "#BEBE00"   
    set colorgn "#00FF00"   
    set colorbl "#0000FF" 
    set colorcy "#00C8C8" 
    set colormg "#FF00FF" 
    set colorp0 "#FFFFFF" 
    set colorp1 "#000000"   
    set colorp2 "#14963F"   
    set colorp3 "#FF0000"   
    set colorp4 "#0000FF" 
    set colorp5 "#00C800"   
    set colorp6 "#F0FFFF" 
    set colorp7 "#0000FF"
    source $fileguinb2change
}

pack .f.pw2.f22.nb.color.fbk.stdw .f.pw2.f22.nb.color.fbk.stdb .f.pw2.f22.nb.color.fbk.co16 .f.pw2.f22.nb.color.fbk.co35 .f.pw2.f22.nb.color.fbk.co50 -padx 2m -pady 2m -side left 
#######################     row 2
set colornsw [mc "Black"]
set colornws [mc "White"]
set colornrt [mc "Red"]
set colornge [mc "Yellow"]
set colorngn [mc "Green"]
set colornbl [mc "Blue"]
set colorncy [mc "Cyan"]
set colornmg [mc "Magenta"]
set colornp0 [mc "P0"]
set colornp1 [mc "P1"]
set colornp2 [mc "P2"]
set colornp3 [mc "P3"]
set colornp4 [mc "P4"]
set colornp5 [mc "P5"]
set colornp6 [mc "P6"]
set colornp7 [mc "P7"]

################ Standard colors
ttk::labelframe .f.pw2.f22.nb.color.fcol1 -text [mc "Standard colors"]
grid .f.pw2.f22.nb.color.fcol1 -row 2 -column 1 -padx 2m -pady 2m -sticky nswe

ttk::frame .f.pw2.f22.nb.color.fcol1.ws -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.sw -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.rt -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.gn -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.ge -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.bl -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.cy -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol1.mg -relief flat

pack .f.pw2.f22.nb.color.fcol1.ws .f.pw2.f22.nb.color.fcol1.sw \
    .f.pw2.f22.nb.color.fcol1.rt .f.pw2.f22.nb.color.fcol1.gn \
    .f.pw2.f22.nb.color.fcol1.ge .f.pw2.f22.nb.color.fcol1.bl \
    .f.pw2.f22.nb.color.fcol1.cy .f.pw2.f22.nb.color.fcol1.mg \
    -side top

ttk::button .f.pw2.f22.nb.color.fcol1.ws.b -text "$colornws" -command { 
    set colorws [chooseColor $colorws $colornws]
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.ws.f configure -background "$colorws"
}
ttk::button .f.pw2.f22.nb.color.fcol1.sw.b -text "$colornsw" -command { 
    set colorsw [chooseColor $colorsw $colornsw]
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.sw.f configure -background "$colorsw"
}
ttk::button .f.pw2.f22.nb.color.fcol1.rt.b -text "$colornrt" -command { 
    set colorrt [chooseColor $colorrt $colornrt] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.rt.f configure -background "$colorrt"
}
ttk::button .f.pw2.f22.nb.color.fcol1.ge.b -text "$colornge" -command { 
    set colorge [chooseColor $colorge $colornge] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.ge.f configure -background "$colorge"
}
ttk::button .f.pw2.f22.nb.color.fcol1.gn.b -text "$colorngn" -command { 
    set colorgn [chooseColor $colorgn $colorngn] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.gn.f configure -background "$colorgn"
}
ttk::button .f.pw2.f22.nb.color.fcol1.bl.b -text "$colornbl" -command { 
    set colorbl [chooseColor $colorbl $colornbl] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.bl.f configure -background "$colorbl"
}
ttk::button .f.pw2.f22.nb.color.fcol1.cy.b -text "$colorncy" -command { 
    set colorcy [chooseColor $colorcy $colorncy] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.cy.f configure -background "$colorcy"
}
ttk::button .f.pw2.f22.nb.color.fcol1.mg.b -text "$colornmg" -command {
    set colormg [chooseColor $colormg $colornmg] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol1.mg.f configure -background "$colormg"
}

frame .f.pw2.f22.nb.color.fcol1.sw.f -height 15 -width 30 -background $colorsw
frame .f.pw2.f22.nb.color.fcol1.ws.f -height 15 -width 30 -background $colorws
frame .f.pw2.f22.nb.color.fcol1.rt.f -height 15 -width 30 -background $colorrt
frame .f.pw2.f22.nb.color.fcol1.ge.f -height 15 -width 30 -background $colorge
frame .f.pw2.f22.nb.color.fcol1.gn.f -height 15 -width 30 -background $colorgn
frame .f.pw2.f22.nb.color.fcol1.bl.f -height 15 -width 30 -background $colorbl
frame .f.pw2.f22.nb.color.fcol1.cy.f -height 15 -width 30 -background $colorcy
frame .f.pw2.f22.nb.color.fcol1.mg.f -height 15 -width 30 -background $colormg

pack .f.pw2.f22.nb.color.fcol1.sw.b .f.pw2.f22.nb.color.fcol1.sw.f \
    .f.pw2.f22.nb.color.fcol1.ws.b .f.pw2.f22.nb.color.fcol1.ws.f \
    .f.pw2.f22.nb.color.fcol1.rt.b .f.pw2.f22.nb.color.fcol1.rt.f \
    .f.pw2.f22.nb.color.fcol1.ge.b .f.pw2.f22.nb.color.fcol1.ge.f \
    .f.pw2.f22.nb.color.fcol1.gn.b .f.pw2.f22.nb.color.fcol1.gn.f \
    .f.pw2.f22.nb.color.fcol1.bl.b .f.pw2.f22.nb.color.fcol1.bl.f \
    .f.pw2.f22.nb.color.fcol1.cy.b .f.pw2.f22.nb.color.fcol1.cy.f \
    .f.pw2.f22.nb.color.fcol1.mg.b .f.pw2.f22.nb.color.fcol1.mg.f \
    -side left -anchor c -padx 2m -pady 1m -fill x -expand yes

######### Additional colors
ttk::labelframe .f.pw2.f22.nb.color.fcol2 -text [mc "Additional colors"]
grid .f.pw2.f22.nb.color.fcol2 -row 2 -column 2 -padx 2m -pady 2m -sticky nwe

ttk::frame .f.pw2.f22.nb.color.fcol2.p0 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p1 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p2 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p3 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p4 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p5 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p6 -relief flat
ttk::frame .f.pw2.f22.nb.color.fcol2.p7 -relief flat

pack .f.pw2.f22.nb.color.fcol2.p0 .f.pw2.f22.nb.color.fcol2.p1 \
    .f.pw2.f22.nb.color.fcol2.p2 .f.pw2.f22.nb.color.fcol2.p3 \
    .f.pw2.f22.nb.color.fcol2.p4 .f.pw2.f22.nb.color.fcol2.p5 \
    .f.pw2.f22.nb.color.fcol2.p6 .f.pw2.f22.nb.color.fcol2.p7 \
    -side top

ttk::button .f.pw2.f22.nb.color.fcol2.p0.b -text "$colornp0" -command { 
    set colorp0 [chooseColor $colorp0 $colornp0] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p0.f configure -background "$colorp0"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p1.b -text "$colornp1" -command { 
    set colorp1 [chooseColor $colorp1 $colornp1] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p1.f configure -background "$colorp1"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p2.b -text "$colornp2" -command { 
    set colorp2 [chooseColor $colorp2 $colornp2] 
    set selcolor 1
    .nb.color.fcol2.p2.f configure -background "$colorp2"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p3.b -text "$colornp3" -command { 
    set colorp3 [chooseColor $colorp3 $colornp3] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p3.f configure -background "$colorp3"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p4.b -text "$colornp4" -command { 
    set colorp4 [chooseColor $colorp4 $colornp4] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p4.f configure -background "$colorp4"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p5.b -text "$colornp5" -command { 
    set colorp5 [chooseColor $colorp5 $colornp5] 
    set selcolor 1
    .nb.color.fcol2.p5.f configure -background "$colorp5"
}
ttk::button .f.pw2.f22.nb.color.fcol2.p6.b -text "$colornp6" -command { 
    set colorp6 [chooseColor $colorp6 $colornp6] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p6.f configure -background "$colorp6"
  }
ttk::button .f.pw2.f22.nb.color.fcol2.p7.b -text "$colornp7" -command { 
    set colorp7 [chooseColor $colorp7 $colornp7] 
    set selcolor 1
    .f.pw2.f22.nb.color.fcol2.p7.f configure -background "$colorp7"
}

frame .f.pw2.f22.nb.color.fcol2.p0.f -height 15 -width 30 -background $colorp0
frame .f.pw2.f22.nb.color.fcol2.p1.f -height 15 -width 30 -background $colorp1
frame .f.pw2.f22.nb.color.fcol2.p2.f -height 15 -width 30 -background $colorp2
frame .f.pw2.f22.nb.color.fcol2.p3.f -height 15 -width 30 -background $colorp3
frame .f.pw2.f22.nb.color.fcol2.p4.f -height 15 -width 30 -background $colorp4
frame .f.pw2.f22.nb.color.fcol2.p5.f -height 15 -width 30 -background $colorp5
frame .f.pw2.f22.nb.color.fcol2.p6.f -height 15 -width 30 -background $colorp6
frame .f.pw2.f22.nb.color.fcol2.p7.f -height 15 -width 30 -background $colorp7

  pack .f.pw2.f22.nb.color.fcol2.p0.b .f.pw2.f22.nb.color.fcol2.p0.f \
    .f.pw2.f22.nb.color.fcol2.p1.b .f.pw2.f22.nb.color.fcol2.p1.f \
    .f.pw2.f22.nb.color.fcol2.p2.b .f.pw2.f22.nb.color.fcol2.p2.f \
    .f.pw2.f22.nb.color.fcol2.p3.b .f.pw2.f22.nb.color.fcol2.p3.f \
    .f.pw2.f22.nb.color.fcol2.p4.b .f.pw2.f22.nb.color.fcol2.p4.f \
    .f.pw2.f22.nb.color.fcol2.p5.b .f.pw2.f22.nb.color.fcol2.p5.f \
    .f.pw2.f22.nb.color.fcol2.p6.b .f.pw2.f22.nb.color.fcol2.p6.f \
    .f.pw2.f22.nb.color.fcol2.p7.b .f.pw2.f22.nb.color.fcol2.p7.f \
    -side left -anchor c -padx 2m -pady 1m

# EOF
