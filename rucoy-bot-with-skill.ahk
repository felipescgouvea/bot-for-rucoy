;
;
;	Integrated rucoy automator
;
;



#SingleInstance force
#include screen-config.ahk
#include exausted.ahk
#include auto-heal.ahk
#include attack-module.ahk
#include random-walk.ahk
#include spell-cast.ahk
#include coordinates.ahk
#include unlock-screen.ahk
#include looting.ahk

SetTimer, Loop, 500
SetTimer, Loop, Off
#InstallKeybdHook
return

Esc::ExitApp  ; Exit script with Escape key

Insert::
	SetContextDefaults()
	TimerToggle()
	return

SetContextDefaults(){
	global
	setRandomWalkDefaults()
	SetAutoHealDefaults()
	
}
		
TimerToggle() {
    Thread, NoTimers
    static toggled := "Off"
    toggled := (toggled = "On" ? "Off" : "On")
	
	;SetTimer, AutoHealLoop, %toggled%
    SetTimer, Loop, %toggled%

}	
		
Loop:
	heal(lifeCoordinates.x, lifeCoordinates.y, lifeCoordinates.color, 3 )
	heal(manaCoordinates.x, manaCoordinates.y, manaCoordinates.color, 2 )	
	runAutoAttack()
	loot()
	checkExausted()
	;unlock()
	return

runAutoAttack(){
	global
	;decideWhereToAttackDistance({Monster : "Gargoyle", AttackType : "Skilling", Walktype: "Stand"})
	decideWhereToAttackDistance({Monster : "Vampire", AttackType : "Skilling", Walktype: "RandomWalk"})
	Sleep, 1000
}



