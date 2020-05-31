#SingleInstance force


	
F2::
	SetTimer, LoopAutoAttack, 3000
	

	
	

SetDefaults()
{
    global  ; This word may be omitted if the first line of this function will be something like "local MyVar".
    bluePositionSize := 17  ; Assigns 33 to a global variable, first creating the variable if necessary.
	attacandoCor := 0x3130CE
	


	tipoDaArma := "low"
	
	bluePositionOnMapX := 1250
	bluePositionOnMapY := 540
	
	mapIconX := 1740
	mapIconY := 105
	
	returnIconX := 2070
	returnIconY := 100
	
	greenWayColor := 0x4ABA18
	
	corSkeleton = 0xF7F3F7
	
	posicaoMonstroEsquerdaX = 1139
	posicaoMonstroEsquerdaY = 511
	corSkeletonEsquerda := 0xF3F3F3
	

	
	posicaoMonstroDireitaX = 1356
	posicaoMonstroDireitaY = 519
	
	posicaoMonstroBaixoX = 1257
	posicaoMonstroBaixoY = 630
	corSkeletonBaixo := 0xF3F3F3
	
	posicaoMonstroCimaX = 1248
	posicaoMonstroCimaY = 403
	exaustedTime := 5
	

}

LoopAutoAttack:
	SetDefaults()
	runBot()
	return

runBot(){
	global
	if(estaAtacandoAlgumMonstro()){
		;MsgBox Esta atacando

		if(estaExhausted()){
				;MsgBox Troca de arma : esta exausted
				trocarDeArmaKnight()
		}
		else{
			
		}
		sleep, 1000
	}
	else{
		procurarMonstroParaAtacar()
		verificaSeJaAcabouTempoExausted()
	}
	
	exaustedTime++
	return
}

procurarMonstroParaAtacar(){
		global
		;MsgBox Iniciar checagem de monstros ao redor
		existeNaDirecao := existeSkeletonAoRedor()
		MsgBox %existeNaDirecao%
		if(existeNaDirecao = "ESQUERDA"){
			MouseClick, left,  esquerdaX,  esquerdaY

		}
		if(existeNaDirecao = "DIREITA"){
			MouseClick, left,  direitaX,  direitaY

		}
		if(existeNaDirecao = "CIMA"){
			MouseClick, left,  cimaX,  cimaY

		}
		if(existeNaDirecao = "BAIXO"){
			MouseClick, left,  baixoX,  baixoY

		}
		if(existeNaDirecao = "NENHUMA"){
			MsgBox Nao existe monstro ao redor
			;walkAround()
		}
}
		

		
estaAtacandoAlgumMonstro(){ 
	global
		PixelGetColor, corEsquerda, %esquerdaX%, %esquerdaY%
		PixelGetColor, corDireita, %direitaX%, %direitaY%
		PixelGetColor, corCima, %cimaX%, %cimaY%
		PixelGetColor, corBaixo, %baixoX%, %baixoY%
		
		
		estaAtacando = 0
		if(corEsquerda = attacandoCor){
			estaAtacando = 1
		}
		if(corDireita = attacandoCor){
			estaAtacando = 1
		}
		if(corCima = attacandoCor){
			estaAtacando = 1
		}
		if(corBaixo = attacandoCor){
			estaAtacando = 1
		}
		
		;MsgBox Esta atacando  %estaAtacando%
		
		return estaAtacando
	}
	

	
trocarDeArmaKnight(){
	global
	
	MouseClick, left,  2072,  740
	MouseClick, left,  1950,  740
	if(tipoDaArma = "low"){
			tipoDaArma = "high"
	}
	else{
			tipoDaArma = "low"
	}
}

existeSkeletonAoRedor(){
	global
	;Msgbox %posicaoMonstroEsquerdaX%, %posicaoMonstroEsquerdaY%, %corSkeleton%, %corSkeletonEsquerda%
	if(existeMonstroNaPosicao(posicaoMonstroEsquerdaX, posicaoMonstroEsquerdaY, corSkeletonEsquerda)){
		return "ESQUERDA"
	}
	else if(existeMonstroNaPosicao(posicaoMonstroDireitaX, posicaoMonstroDireitaY, corSkeleton)){
		return "DIREITA"
	}
	else if(existeMonstroNaPosicao(posicaoMonstroCimaX, posicaoMonstroCimaY, corSkeleton)){
		return "CIMA"
	}
	else if(existeMonstroNaPosicao(posicaoMonstroBaixoX, posicaoMonstroBaixoY, corSkeleton)){
		return "BAIXO"
	}
	else{
		return "NENHUMA"
	}
}	

existeMonstroNaPosicao(X,  Y,  corDoMonstro) {
	global
	PixelGetColor, corEncontrada, %X%, %Y%
	MsgBox %corEncontrada%, %corDoMonstro% , %X%, %Y%
	if(corEncontrada = corDoMonstro){
		return 1
	}
	else{
		return 0
	}	
}

walkAround(){
	global
	nextX := calculateRandomCoordinatesAroundBlueSquareX()
	nextY := calculateRandomCoordinatesAroundBlueSquareY()
	;Msgbox walk by %nextX% %nextY%
	Sleep, 250
	MouseClick, left,  mapIconX,  mapIconY
	Sleep, 250
	MouseClick, left,  nextX,  nextY
	Sleep, 250
	MouseClick, left,  returnIconX,  returnIconY
	Sleep, 5000
}


calculateRandomCoordinatesAroundBlueSquareX(){
	global
	Random, rand, 1, 10
	randomX := rand * bluePositionSize

	if(Mod(rand, 2) > 0){
		finalClickPosition :=  bluePositionOnMapX + randomX
	}
	else{
		finalClickPosition :=  bluePositionOnMapX - randomX
	}

	return finalClickPosition
}

calculateRandomCoordinatesAroundBlueSquareY(){
	global
	Random, rand, 1, 10
	randomY := rand * bluePositionSize

	if(Mod(rand, 2) > 0){
		finalClickPosition :=  bluePositionOnMapY + randomY
	}
	else{
		finalClickPosition :=  bluePositionOnMapY - randomY
	}

	return finalClickPosition
}




