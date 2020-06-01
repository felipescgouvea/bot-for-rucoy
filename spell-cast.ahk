;
;
;	Mage fast spell
;	Press Right mouse button to activate mage spell
;

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
	if(withChange){
		ControlSend,, {F2}, Nox
	}
	ControlSend,, {1}, Nox
	Sleep, 90
	if(withChange){
		ControlSend,, {F1}, Nox
	}
	return
}
