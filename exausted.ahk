;
;
;	Exaustion bypass module
;
;


#include attack-module.ahk





checkExausted(){
	global
	exausted := isTheCharacterExaustedWithTrainingWeapon()
	 ;Msgbox %exausted%
	if(isTheCharacterExaustedWithTrainingWeapon()){
		Tooltip exausted
		changeWeapon(context.changeToKnightWeaponCommand)
		Sleep, 1000
		fastDistanceSpell(false)
		Sleep, 1000
		changeWeapon(context.changeToArcherWeaponCommand)
	}
}


isTheCharacterExaustedWithTrainingWeapon(){
	global
	exaustedCoordinates := context.ExaustedCoordinates
	PixelGetColor, groundColor, % exaustedCoordinates.x , % exaustedCoordinates.y 
	;Msgbox %exaustedX%, %exaustedY%, %exaustedColor%, %groundColor%
	if(groundColor = exaustedCoordinates.color){
			return 1
	}
	else{
			return 0
	}
}

changeWeapon(command){
	global
	ControlSend,, {%command%}, Nox
}