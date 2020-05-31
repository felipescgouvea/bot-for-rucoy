
global exaustedCor := 0x393CFF
global attacandoCor := 0x3130CE
global esquerdaX := 1090
global esquerdaY := 533
global direitaX := 1412
global direitaY := 533
global cimaX := 1250
global cimaY := 380
global baixoX := 1250
global baixoY := 702
global exaustedX := 1387
global exaustedY := 757	
global  tipoDaArma := "low"

LoopAutoAttack:
	runBot()
	return

runBot(){
	if(estaAtacandoAlgumMonstro()){
		;MsgBox Esta atacando
		if(estaExhausted()){
				;MsgBox Troca de arma : esta exausted
				trocarDeArmaKnight()
		}
		sleep, 1000
	}
	else{
		;MsgBox Iniciar checagem de monstros ao redor
		existeNaDirecao := existeSkeletonAoRedor()
		MsgBox existe monstro na direcao %existeNaDirecao%
		if(existeNaDirecao = "ESQUERDA"){
			MsgBox %esquerdaX%, %esquerdaY%
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
			walkAround()
			sleep 1000
		}
	}
	return
}

	
		
estaAtacandoAlgumMonstro(){ 
		PixelGetColor, corEsquerda, %esquerdaX%, %esquerdaY%
		PixelGetColor, corDireita, %direitaX%, %direitaY%
		PixelGetColor, corCima, %cimaX%, %cimaY%
		PixelGetColor, corBaixo, %baixoX%, %baixoY%
		
		;MsgBox Esta atacando  %corEsquerda%, %corDireita%, %corCima%, %corBaixo%
		
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
	
estaExhausted(){
	PixelGetColor, corDoChao, %exaustedX%, %exaustedY%
	if(corDoChao = exaustedCor){
			return 1
	}
	else{
			return 0
	}
}
	
trocarDeArmaKnight(){

	MouseClick, left,  2072,  740
	MouseClick, left,  1950,  740
	if(tipoDaArma = "low"){
			tipoDaArma = "high"
	}
	else{
			tipoDaArma = "low"
	}
}
