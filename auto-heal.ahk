;
;
;	Auto Heal Module
;   Press Home key to start/stop auto heal
;

;Esc::ExitApp  ; Exit script with Escape key

Home::
	SetAutoHealDefaults()
	AutoHealToggle()
	return
	
	
AutoHealToggle() {
    Thread, NoTimers
    static toggled := "Off"
    toggled := (toggled = "On" ? "Off" : "On")
	
    SetTimer, AutoHealLoop, %toggled%
}	


AutoHealLoop:
	lifeHeal()
	manaHeal()
	Sleep, 1000
	return

SetAutoHealDefaults(){
	global
	grayManaColor = 0x696969
	manaColorX = 667
	manaColorY = 99
	
	grayLifeColor = 0x696969
	lifeColorY = 70
	lifeColorX = 795

}

lifeHeal(){
	global
	PixelGetColor, color, %lifeColorX%, %lifeColorY%
	;Msgbox %color%, %lifeColorX%, %lifeColorY%
	if(color = grayLifeColor){
		;Msgbox Usar pot!
		Send, {3}
	}
}	
	
manaHeal(){
	global
	PixelGetColor, color, %manaColorX%, %manaColorY%
	;Msgbox %color%, %manaColorX%, %manaColorY%
	if(color = grayManaColor){
		;Msgbox Usar pot!
		Send, {2}
	}
}