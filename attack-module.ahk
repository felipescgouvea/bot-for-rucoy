;
;
;	Attack Module
;
;

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

isAttackingAnyMonster(attackingMonsterConfig){ 
		isAttackingLeft := isIdenticalColor(attackingMonsterConfig.left.x, attackingMonsterConfig.left.y, attackingMonsterConfig.color)
		isAttackingRight := isIdenticalColor(attackingMonsterConfig.right.x, attackingMonsterConfig.right.y, attackingMonsterConfig.color)
		isAttackingUp := isIdenticalColor(attackingMonsterConfig.up.x, attackingMonsterConfig.up.y, attackingMonsterConfig.color)
		isAttackingDown := isIdenticalColor(attackingMonsterConfig.down.x, attackingMonsterConfig.down.y, attackingMonsterConfig.color)

		isAttacking := (isAttackingLeft || isAttackingRight || isAttackingUp || isAttackingDown)
		return isAttacking
}


checkSurroundingMonster(monsterConfig){
	result := {}
	numberOfSurroundingMonsters := 0
	leftMonster :=  isIdenticalColor(monsterConfig.left.x, monsterConfig.left.y, monsterConfig.color)
	if(leftMonster){
		result.coordinates := monsterConfig.left
		numberOfSurroundingMonsters++
	}
	rightMonster :=  isIdenticalColor(monsterConfig.right.x, monsterConfig.right.y, monsterConfig.color)
	if(rightMonster){
		result.coordinates := monsterConfig.right
		numberOfSurroundingMonsters++
	}
	upMonster :=  isIdenticalColor(monsterConfig.up.x, monsterConfig.up.y, monsterConfig.color)
	if(upMonster){
		result.coordinates := monsterConfig.up
		numberOfSurroundingMonsters++
	}
	downMonster :=  isIdenticalColor(monsterConfig.down.x, monsterConfig.down.y, monsterConfig.color)
	if(downMonster){
		result.coordinates := monsterConfig.down
		numberOfSurroundingMonsters++
	}
	result.monsterQuantity := numberOfSurroundingMonsters
	return result
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
	global
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
	
decideWhereToAttackDistance(configuration){
	global
	if(configuration.Monster = "Vampire"){
		VampireSkllingAttack(configuration)
	}
	if(configuration.Monster = "Gargoyle"){
			if(configuration.WalkType = "Stand"){
				gargoyleStandAttack(configuration.AttackType)
			}

		}
}


VampireSkllingAttack(configuration){
	global
	surroundingMonsterResult := checkSurroundingVamp()
	centerCoordinates := context.AbsoluteCenter
	if(surroundingMonsterResult.monsterQuantity > 1){
		isAttacking := isAttackingAnyMonster(context.AttackingMonsterConfig)
		if(!isAttacking){
			;Msgbox % surroundingSkeletonResult.coordinates.x "," surroundingSkeletonResult.coordinates.y
			MouseClick, left, surroundingMonsterResult.coordinates.x, surroundingMonsterResult.coordinates.y
			MouseMove, centerCoordinates.x, centerCoordinates.y
		}	
		if(configuration.AttackType = "Skilling"){
			fastDistanceSpell(false)
		}
		
	}
	else{
		if(configuration.WalkType = "Stand"){
			;run2timesMaximumTopAndBack()
		}
		if(configuration.WalkType = "RandomWalk"){
			walkAround()
		}
	}
}

gargoyleStandAttack(configuration){
	global
	surroundingMonsterResult := checkSurroundingGargoyle()
		if(surroundingMonsterResult.monsterQuantity > 0){
		isAttacking := isAttackingAnyMonster(context.AttackingMonsterConfig)
		if(!isAttacking){
			;Msgbox % surroundingSkeletonResult.coordinates.x "," surroundingSkeletonResult.coordinates.y
			MouseClick, left, surroundingMonsterResult.coordinates.x, surroundingMonsterResult.coordinates.y
			MouseMove, centerCoordinates.x, centerCoordinates.y
		}	
		if(configuration.AttackType = "Skilling"){
			fastDistanceSpell(false)
		}
	}
	else{
		if(configuration.WalkType = "Stand"){
			run2timesMaximumTopAndBack()
		}
		if(configuration.WalkType = "RandomWalk"){
			walkAround()
		}
		
	}
}