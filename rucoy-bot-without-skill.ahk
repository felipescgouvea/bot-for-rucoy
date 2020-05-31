;
;
;	Integrated rucoy automator
;
;



#SingleInstance force

#include exausted.ahk
#include auto-heal.ahk
#include attack-module.ahk
#include random-walk.ahk
#include magic-fast-spell.ahk
#include coordinates.ahk

SetTimer, Loop, 500
SetTimer, Loop, Off
#InstallKeybdHook
return



Esc::ExitApp  ; Exit script with Escape key




F1::  
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%
	Tooltip The color at the current cursor position is %color%. %MouseX% %MouseY%
	;Click, MouseX, MouseY
	return


Insert::
	SetContextDefaults()
	TimerToggle()
	return



SetContextDefaults(){
	global
	lootPixelX = 2092
	lootPixelY = 322
	
	SetExaustedDefaults()
	setRandomWalkDefaults()
	SetAutoHealDefaults()
	
}
	
	
TimerToggle() {
    Thread, NoTimers
    static toggled := "Off"
    toggled := (toggled = "On" ? "Off" : "On")
	
    ;SetTimer, Loop, %toggled%
    SetTimer, GargoyleLoop, %toggled%
}	
	

GargoyleLoop:
	loot()
	lifeHeal()
	manaHeal()
	runAutoAttackWithoutSkill()
	unlock()
	return
	
	
Loop:
	loot()
	lifeHeal()
	manaHeal()
	runAutoAttack()
	checkExausted()
	unlock()
	return


	runAutoAttackWithoutSkill(){
		global
		exist := checkSurroundingGargoyle()
		;Msgbox exist : %exist%
		Tooltip surrounding monsters %numberOfSurroundingMonsters%
		if(numberOfSurroundingMonsters > 0){
			sleep, 1000

			
		}
		else{
			run2timesMaximumTopAndBack()
		}
		;Msgbox %numberOfSurroundingMonsters%
	}	
	
	runAutoAttack(){
		global
		Send {7}
		Sleep, 150
		decideWhereToAttack()
		Send {5}
		Sleep, 850
		;checkExausted()
		;Msgbox %numberOfSurroundingMonsters%
	}


	loot(){
		global
		PixelGetColor, lootColor, %lootPixelX%, %lootPixelY%
		;Msgbox loot color : %lootColor% , %lootPixelX%, %lootPixelY%
		if(lootColor = 0x3f99f8){
			Send, {Numpad4}
		}
	}
