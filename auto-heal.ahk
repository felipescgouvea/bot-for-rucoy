;
;
;	Auto Heal Module
;   Press Home key to start/stop auto heal
;

;Esc::ExitApp  ; Exit script with Escape key

SetTitleMatchMode, 2

	F1::
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
	heal(lifeCoordinates.x, lifeCoordinates.y, lifeCoordinates.color, 3 )
	heal(manaCoordinates.x, manaCoordinates.y, manaCoordinates.color, 2 )	
	Sleep, 100
	return

SetAutoHealDefaults(){
	global
	manaCoordinates := {x:667,	y:99,	color:"0x696969"}
	lifeCoordinates := {x:795,	y:70,	color:"0x696969"}
}

heal(xCoordinate, yCoordinate, colorToCheck, command){
	PixelGetColor, color, % xCoordinate , % yCoordinate 
	Msgbox %xCoordinate%, %yCoordinate%, %colorToCheck%, %command%
	if(color <> colorToCheck){
		;Msgbox Usar pot!
		ControlSend,, {%command%}, Nox

	}
}

