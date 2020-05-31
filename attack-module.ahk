;
;
;	Attack Module
;
;
setAttackModuleDefaults()


;F3::  
;	setAttackModuleDefaults()
;	decideWhereToAttack()
;	;isAttackingAnyMonster()
;	return


	setAttackModuleDefaults(){
		global
		skeletonColor := 0xF3F3F3
		vampColor := 0xD1D16F
		drowAssassinColor := 0xB30E9C
		drowFighterColor := 0xA4947C
		gargoyleColor := 0x635542
		djinnColor := 0xE2C681
		yellowMonsterNameColor := 0x00FFEA
		
		
		posicaoMonstroEsquerdaX := 1139
		posicaoMonstroEsquerdaY := 515
		
		posicaoMonstroDireitaX := 1373
		posicaoMonstroDireitaY := 515
		
		posicaoMonstroBaixoX := 1258
		posicaoMonstroBaixoY := 624
		
		posicaoMonstroCimaX := 1258
		posicaoMonstroCimaY := 394


		attackingColorLeftX := 1097
		attackingColorLeftY := 512
		
		attackingColorRightX := 1422
		attackingColorRightY := 525
		
		attackingColorUpX := 1261
		attackingColorUpY := 372
		
		attackingColorDownX := 1256
		attackingColorDownY := 699
		
		redAttackColor := 0x3232CF

		numberOfSurroundingMonsters := 0
		
	}
	
	
MageSpellHimself(x, y){
	global
	PixelGetColor, color, 410, 100
	if( color <> grayManaColor){
		Send, {1}
		sleep, 50
		if(x = 0 || y = 0){
			MouseClick, left,
		}
		else{
			MouseClick, left,  x,  y
		}


	}
}

unlock(){
	PixelGetColor, color, 2140, 92
	if(color = 0x696969){
		;Msgbox locked
		MouseClick, left,  2120,  90
		MouseMove, 1260,  550
	}
}

checkSurroundingDjinn(){
	global
	;MsgBox cor do monstro para atacar %djinnColor%
	;numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()

	if(checkMonsterOnCoordinates(1133, 507, djinnColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1133, 507
		}
		nextAttackDirection := "ESQUERDA"
	}
	if(checkMonsterOnCoordinates(1378, 509, djinnColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1378, 509
		}
		nextAttackDirection := "DIREITA"
	}
	if(checkMonsterOnCoordinates(1248, 398, djinnColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1261, 399
		}
		nextAttackDirection := "CIMA"
	}
	if(checkMonsterOnCoordinates(1255, 623, djinnColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1255, 623
		}
		nextAttackDirection := "BAIXO"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NENHUMA"
	}
	;Msgbox %numberOfSurroundingMonsters%
	return numberOfSurroundingMonsters
}

skipYellowNamed(){
	global
	if(checkMonsterOnCoordinates(1164, 345, yellowMonsterNameColor)){
		changeWeapon()
		sleep, 350
		MouseMove, 1266, 538
		fastMagicSpell()
		Sleep, 5000
		changeWeapon()
	}
}

checkSurroundingGargoyle(){
	global
	;MsgBox cor do monstro para atacar %gargoyleColor%
	numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()
	
	if(checkMonsterOnCoordinates(1133, 507, gargoyleColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1133, 507
		}
		nextAttackDirection := "ESQUERDA"
	}
	if(checkMonsterOnCoordinates(1378, 509, gargoyleColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1378, 509
		}
		nextAttackDirection := "DIREITA"
	}
	if(checkMonsterOnCoordinates(1214, 438, gargoyleColor)){
		Tooltip passou
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1261, 399
		}
		nextAttackDirection := "CIMA"
	}
	if(checkMonsterOnCoordinates(1255, 623, gargoyleColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1255, 623
		}
		nextAttackDirection := "BAIXO"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NENHUMA"
	}
	skipYellowNamed()
	;Msgbox %numberOfSurroundingMonsters%
	return nextAttackDirection
}

checkSurroundingDrowFighter(){
	global
	;MsgBox cor do monstro para atacar %drowFighterColor%
	numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()

	if(checkMonsterOnCoordinates(1144, 534, drowFighterColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1133, 507
		}
		nextAttackDirection :=  nextAttackDirection  "LEFT"
	}
	if(checkMonsterOnCoordinates(1380, 534, drowFighterColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1378, 509
		}
		nextAttackDirection := nextAttackDirection  "RIGHT"
	}
	if(checkMonsterOnCoordinates(1248, 406, drowFighterColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1259, 397
		}
		nextAttackDirection := nextAttackDirection  "UP"
	}
	if(checkMonsterOnCoordinates(1253, 654, drowFighterColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1255, 623
		}
		nextAttackDirection := nextAttackDirection  "DOWN"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NONE"
	}
	;Msgbox %numberOfSurroundingMonsters%
	return nextAttackDirection
}	

checkSurroundingDrowAssassin(){
	global
	;MsgBox cor do monstro para atacar %drowAssassinColor%
	numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()

	if(checkMonsterOnCoordinates(1133, 507, drowAssassinColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1133, 507
		}
		nextAttackDirection := "ESQUERDA"
	}
	if(checkMonsterOnCoordinates(1378, 509, drowAssassinColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1378, 509
		}
		nextAttackDirection := "DIREITA"
	}
	if(checkMonsterOnCoordinates(1259, 397, drowAssassinColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1259, 397
		}
		nextAttackDirection := "CIMA"
	}
	if(checkMonsterOnCoordinates(1255, 623, drowAssassinColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1255, 623
		}
		nextAttackDirection := "BAIXO"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NENHUMA"
	}
	;Msgbox %numberOfSurroundingMonsters%
	return nextAttackDirection
}	

checkSurroundingVamp(){
	global
	;MsgBox cor do monstro para atacar %vampColor%
	numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()

	if(checkMonsterOnCoordinates(1159, 522, vampColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1159,  522
		}
		nextAttackDirection :=  nextAttackDirection  "LEFT"
	}
	if(checkMonsterOnCoordinates(1357, 518, vampColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1357,  522
		}
		nextAttackDirection :=  nextAttackDirection  "RIGHT"
	}
	if(checkMonsterOnCoordinates(1256, 411, vampColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1256,  411
		}
		nextAttackDirection :=  nextAttackDirection  "UP"
	}
	if(checkMonsterOnCoordinates(1286, 621, vampColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  1286,  621
		}
		nextAttackDirection :=  nextAttackDirection  "DOWN"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NONE"
	}
	;Msgbox %numberOfSurroundingMonsters%
	return nextAttackDirection
}	

checkSurroundingSkeleton(){
	global
	;MsgBox cor do monstro para atacar %skeletonColor%
	numberOfSurroundingMonsters := 0
	nextAttackDirection := ""
	isAttacking := isAttackingAnyMonster()

	if(checkMonsterOnCoordinates(posicaoMonstroEsquerdaX, posicaoMonstroEsquerdaY, skeletonColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  posicaoMonstroEsquerdaX,  posicaoMonstroEsquerdaY
		}
		nextAttackDirection := "ESQUERDA"
	}
	if(checkMonsterOnCoordinates(posicaoMonstroDireitaX, posicaoMonstroDireitaY, skeletonColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  posicaoMonstroDireitaX,  posicaoMonstroDireitaY
		}
		nextAttackDirection := "DIREITA"
	}
	if(checkMonsterOnCoordinates(posicaoMonstroCimaX, posicaoMonstroCimaY, skeletonColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  posicaoMonstroCimaX,  posicaoMonstroCimaY
		}
		nextAttackDirection := "CIMA"
	}
	if(checkMonsterOnCoordinates(posicaoMonstroBaixoX, posicaoMonstroBaixoY, skeletonColor)){
		numberOfSurroundingMonsters++
		if(isAttacking = "false"){
			MouseClick, left,  posicaoMonstroBaixoX,  posicaoMonstroBaixoY
		}
		nextAttackDirection := "BAIXO"
	}
	if(nextAttackDirection = ""){
		nextAttackDirection := "NENHUMA"
	}
	
	return nextAttackDirection
}	

checkMonsterOnCoordinates(X,  Y,  corDoMonstro) {
	PixelGetColor, corEncontrada, %X%, %Y%
	;Tooltip %corEncontrada% , %X%, %Y%
	;Sleep, 5000
	if(corEncontrada = corDoMonstro){
		return 1
	}
	else{
		return 0
	}	
}

isAttackingAnyMonster(){ 
	global
		PixelGetColor, leftColor, %attackingColorLeftX%, %attackingColorLeftY%
		PixelGetColor, rightColor, %attackingColorRightX%, %attackingColorRightY%
		PixelGetColor, upColor, %attackingColorUpX%, %attackingColorUpY%
		PixelGetColor, downColor, %attackingColorDownX%, %attackingColorDownY%
		
		
		estaAtacando = false
		if(leftColor = redAttackColor){
			estaAtacando = true
		}
		if(rightColor = redAttackColor){
			estaAtacando = true
		}
		if(upColor = redAttackColor){
			estaAtacando = true
		}
		if(downColor = redAttackColor){
			estaAtacando = true
		}
		
		;MsgBox Esta atacando  %estaAtacando%
		
		return estaAtacando
	}
	
decideWhereToAttackDistance(){
	direction := checkSurroundingVamp()
	if(direction = "NONE"){
			walkAround()
	}
	else{
		Tooltip %numberOfSurroundingMonsters%
		if(numberOfSurroundingMonsters > 1){
			fastDistanceSpell(false)
		}
	}
}

decideWhereToAttackMagic(){
	global
	direction := checkSurroundingVamp()
	Tooltip %numberOfSurroundingMonsters%
	if(direction = "NONE" || numberOfSurroundingMonsters < 2){
			walkAround()
	}
	else{
			;Msgbox %direction%
			XCoordinateToSpell := getRelatedCoordinatesX(direction)
			YCoordinateToSpell := getRelatedCoordinatesY(direction)
			;Msgbox %XCoordinateToSpell%, %YCoordinateToSpell%
			MageSpellHimself(XCoordinateToSpell, YCoordinateToSpell)
	}
}
