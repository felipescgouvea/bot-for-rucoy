;
;
;	Random Walk Module
;
;


setRandomWalkDefaults(){
	global
	greenWayColor := 0x4ABA1E
	
	bluePositionSize := 17
}

walkAround(){
	global
	greenpath := context.GreenPath
	mapIcon := context.MapIcon
	returnIcon := context.ReturnIcon

	MouseClick, left,  mapIcon.x,  mapIcon.y
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
		PixelGetColor, leftPath, greenpath.left.x, greenpath.left.y
		PixelGetColor, rightPath, greenpath.right.x, greenpath.right.y
		PixelGetColor, upPath, greenpath.up.x, greenpath.up.y
		PixelGetColor, downPath, greenpath.down.x, greenpath.down.y
		counter++
		;Msgbox %leftPath%, %rightPath%, %upPath%, %downPath%
	}
	Sleep, 250
	MouseClick, left,  returnIcon.x,  returnIcon.y
	Sleep, 5000

}

calculateRandomCoordinatesAroundBlueSquareX(){
	global
	blueCoordinatesX := context.BlueSquareOnMap.x
	Random, rand, 5, 13
	randomX := rand * bluePositionSize
	if(Mod(rand, 2) > 0){
		finalClickPosition :=  blueCoordinatesX + randomX
	}
	else{
		finalClickPosition :=  blueCoordinatesX - randomX
	}

	return finalClickPosition
}

calculateRandomCoordinatesAroundBlueSquareY(){
	global
	blueCoordinatesY := context.BlueSquareOnMap.y
	Random, rand, 5, 13
	randomY := rand * bluePositionSize

	if(Mod(rand, 2) > 0){
		finalClickPosition :=  blueCoordinatesY + randomY
	}
	else{
		finalClickPosition :=  blueCoordinatesY - randomY
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