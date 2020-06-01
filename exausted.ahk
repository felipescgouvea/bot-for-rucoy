;
;
;	Exaustion bypass module
;
;


#include attack-module.ahk
SetExaustedDefaults()


F4::
	SetExaustedDefaults()
	checkExausted()
	return






SetExaustedDefaults(){
	global
	exaustedX := 1407
	exaustedY := 753	
	exaustedColor := 0x3D3DFF
	exaustedTime := -1
	
	knightWeaponChangeX := 2072
	knightWeaponChangeY := 740
	knightWeaponChangeX2:= 1950
	knightWeaponChangeY2 := 740	
	
	
	mageWeaponChangeX := 2072
	mageWeaponChangeY := 988
	mageWeaponChangeX2:= 1950
	mageWeaponChangeY2 := 988	
	
}

checkExausted(){
	global
	exausted := isTheCharacterExaustedWithTrainingWeapon()
	 ;Msgbox %exausted%
	if(isTheCharacterExaustedWithTrainingWeapon()){
		Tooltip exausted
		Send {7}
		changeWeapon()
		Sleep, 1000
		;MageSpellHimself(1260,540)
		Sleep, 1000
		changeWeapon()
		Send {5}
	}
}


isTheCharacterExaustedWithTrainingWeapon(){
	global
	PixelGetColor, groundColor, %exaustedX%, %exaustedY%
	;Msgbox %exaustedX%, %exaustedY%, %exaustedColor%, %groundColor%
	if(groundColor = exaustedColor){
			return 1
	}
	else{
			return 0
	}
}

changeWeapon(){
	global
	MouseClick, left,  mageWeaponChangeX,  mageWeaponChangeY
	sleep, 250
	MouseClick, left,  mageWeaponChangeX2,  mageWeaponChangeY2

}