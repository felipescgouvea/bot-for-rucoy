;
;
;	Attack Module
;
;
#include screen-config.ahk
setAttackModuleDefaults()

setAttackModuleDefaults(){
	global
	yellowMonsterNameColor := 0x00FFEA
	numberOfSurroundingMonsters := 0
}
	

isIdenticalColor(X,  Y,  inputColor) {
	PixelGetColor, colorFound, %X%, %Y%
	;Msgbox %colorFound% %inputColor% %X% %Y%
	if(colorFound = inputColor){
		return 1
	}
	else{
		return 0
	}	
}

isAttackingAnyMonster(){ 
	global
		isAttackingLeft := isIdenticalColor(context.AttackingMonsterConfig.left.x, context.AttackingMonsterConfig.left.y, context.AttackingMonsterConfig.color)
		isAttackingRight := isIdenticalColor(context.AttackingMonsterConfig.right.x, context.AttackingMonsterConfig.right.y, context.AttackingMonsterConfig.color)
		isAttackingUp := isIdenticalColor(context.AttackingMonsterConfig.up.x, context.AttackingMonsterConfig.up.y, context.AttackingMonsterConfig.color)
		isAttackingDown := isIdenticalColor(context.AttackingMonsterConfig.down.x, context.AttackingMonsterConfig.down.y, context.AttackingMonsterConfig.color)

		result := (isAttacking || isAttackingRight || isAttackingUp || isAttackingDown)

		
		return result
}


checkSurroundingMonster(monsterConfig){
	result := {}
	numberOfSurroundingMonsters := 0
	numberOfSurroundingMonsters := numberOfSurroundingMonsters + isIdenticalColor(monsterConfig.left.x, monsterConfig.left.y, monsterConfig.color)
	numberOfSurroundingMonsters := numberOfSurroundingMonsters + isIdenticalColor(monsterConfig.right.x, monsterConfig.right.y, monsterConfig.color)
	numberOfSurroundingMonsters := numberOfSurroundingMonsters + isIdenticalColor(monsterConfig.up.x, monsterConfig.up.y, monsterConfig.color)
	numberOfSurroundingMonsters := numberOfSurroundingMonsters + isIdenticalColor(monsterConfig.down.x, monsterConfig.down.y, monsterConfig.color)
	result.monsterQuantity := numberOfSurroundingMonsters
	return numberOfSurroundingMonsters
}

checkSurroundingDjinn(){
	global
	return checkSurroundingMonster(context.Djinn)
}

checkSurroundingGargoyle(){
	global
	return checkSurroundingMonster(context.Gargoyle)
}

checkSurroundingDrowFighter(){
	return checkSurroundingMonster(context.DrowFighter)
}	

checkSurroundingDrowAssassin(){
	global
	return checkSurroundingMonster(context.DrowAssassin)
}	

checkSurroundingVamp(){
	global
	return checkSurroundingMonster(context.Vampire)
}	

checkSurroundingSkeleton(){
	global
	return checkSurroundingMonster(context.Skeleton)
}	

	
decideWhereToAttackDistance(){
	result := checkSurroundingVamp()
	if(direction = "NONE"){
		;walkAround()
	}
	else{
		Tooltip %numberOfSurroundingMonsters%
		if(numberOfSurroundingMonsters > 1){
			;fastDistanceSpell(false)
		}
	}
}

decideWhereToAttackMagic(){
	global
	direction := checkSurroundingVamp()
	Tooltip %numberOfSurroundingMonsters%
	if(direction = "NONE" || numberOfSurroundingMonsters < 2){
			;walkAround()
	}
	else{
			;Msgbox %direction%
			;XCoordinateToSpell := getRelatedCoordinatesX(direction)
			;YCoordinateToSpell := getRelatedCoordinatesY(direction)
			;Msgbox %XCoordinateToSpell%, %YCoordinateToSpell%
			;MageSpellHimself(XCoordinateToSpell, YCoordinateToSpell)
	}
}
