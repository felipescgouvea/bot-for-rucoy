existeSkeletonAoRedor(){
	posicaoMonstroEsquerdaX := 1130
	posicaoMonstroEsquerdaY := 524
	
	posicaoMonstroDireitaX := 1356
	posicaoMonstroDireitaY := 519
	
	posicaoMonstroBaixoX := 1247
	posicaoMonstroBaixoY := 634
	
	posicaoMonstroCimaX := 1248
	posicaoMonstroCimaY := 403




	if(existeMonstroNaPosicao(posicaoMonstroEsquerdaX, posicaoMonstroEsquerdaY, corSkeleton)){
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
	PixelGetColor, corEncontrada, %X%, %Y%
	;;;MsgBox %corEncontrada% , %X%, %Y%
	if(corEncontrada = corDoMonstro){
		return 1
	}
	else{
		return 0
	}	
}