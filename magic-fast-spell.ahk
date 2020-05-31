;
;
;	Mage fast spell
;	Press Right mouse button to activate mage spell
;

; Esc::ExitApp  ; Exit script with Escape key


RButton::
	fastDistanceSpell(true)
	return

	
fastMagicSpell(){
	PixelGetColor, color, 410, 100
	if( color = 0x696969){
		Send, {2}
	}
	Send {F3}
	Send, {1}
	Sleep, 90
	MouseClick, left, 
	Send {F1}
	return
}

fastDistanceSpell(withChange){
	PixelGetColor, color, 410, 100
	if( color = 0x696969){
		Send, {2}
	}
	if(withChange){
		Send {F2}
	}
	Send, {1}
	Sleep, 90
	if(withChange){
		Send {F1}
	}
	return
}
