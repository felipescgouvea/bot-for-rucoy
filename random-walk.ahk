;
;
;	Random Walk Module
;
;
#include magic-fast-spell.ahk


setRandomWalkDefaults(){
	global
	bluePositionOnMapX := 1250
	bluePositionOnMapY := 540
	
	mapIconX := 1740
	mapIconY := 105
	
	returnIconX := 2070
	returnIconY := 100
	
	greenWayColor := 0x4ABA1E
	
	bluePositionSize := 17
}

walkAround(){
	global
	;Msgbox RANDOM X E Y %randomX%, %randomY%, %mapIconX%, %returnIconX%
	Sleep, 500
	MouseClick, left,  mapIconX,  mapIconY
	Sleep, 250
	leftPath := 0xFFFFFF
	rightPath := 0xFFFFFF
	upPath := 0xFFFFFF
	downPath := 0xFFFFFF
	counter := 0
	while(leftPath <> greenWayColor && rightPath <> greenWayColor && upPath <> greenWayColor && downPath <> greenWayColor && counter <> 5){
		randomX := calculateRandomCoordinatesAroundBlueSquareX()
		randomY := calculateRandomCoordinatesAroundBlueSquareY()
		MouseClick, left,  randomX,  randomY
		Sleep, 100
		PixelGetColor, leftPath, 1240, 534
		PixelGetColor, rightPath, 1276, 534
		PixelGetColor, upPath, 1255, 516
		PixelGetColor, downPath, 1255, 558
		counter++
		;Msgbox %leftPath%, %rightPath%, %upPath%, %downPath%
	}
	Sleep, 250
	MouseClick, left,  returnIconX,  returnIconY
	Sleep, 5000

}

calculateRandomCoordinatesAroundBlueSquareX(){
	global
	Random, rand, 5, 13
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
	Random, rand, 5, 13
	randomY := rand * bluePositionSize

	if(Mod(rand, 2) > 0){
		finalClickPosition :=  bluePositionOnMapY + randomY
	}
	else{
		finalClickPosition :=  bluePositionOnMapY - randomY
	}
	;Msgbox %bluePositionSize%, %bluePositionOnMapY%
	return finalClickPosition
}


run2timesMaximumTopAndBack(){
	MouseClick, left, 1266, 101
	Sleep, 1500
	;MouseMove, 1488, 90
	Sleep, 150
	;fastMagicSpell()
	Sleep, 500
	MouseClick, left, 1252, 995
	Sleep, 3500
	while (southColor != 0x4D4D4D){
		MouseClick, left, 1265, 635
		PixelGetColor, southColor, 1265, 635
		;Tooltip %southColor%
	}
	PixelGetColor, southColor, 1261, 635
	if(southColor = 0x919191){
		MouseClick, left, 1142, 655
	}
	return
}