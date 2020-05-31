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




End::  
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
	
    SetTimer, Loop, %toggled%

}	
	


	
Loop:
	loot()
	lifeHeal()
	manaHeal()
	runAutoAttack()
	checkExausted()
	unlock()
	return



	
	runAutoAttack(){
		global
		decideWhereToAttackDistance()
		Sleep, 1100
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
