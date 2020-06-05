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
	attempts := 0
	while(leftPath <> greenWayColor && rightPath <> greenWayColor && upPath <> greenWayColor && downPath <> greenWayColor && attempts <> 5){
		randomX := calculateRandomCoordinatesAroundBlueSquareX()
		randomY := calculateRandomCoordinatesAroundBlueSquareY()
		MouseClick, left,  randomX,  randomY
		Sleep, 200
		PixelGetColor, leftPath, greenpath.left.x, greenpath.left.y
		PixelGetColor, rightPath, greenpath.right.x, greenpath.right.y
		PixelGetColor, upPath, greenpath.up.x, greenpath.up.y
		PixelGetColor, downPath, greenpath.down.x, greenpath.down.y
		attempts++
		;Msgbox %leftPath%, %rightPath%, %upPath%, %downPath%
	}
	Sleep, 250
	MouseClick, left,  returnIcon.x,  returnIcon.y
	if(attempts < 5){
		Sleep, 7500
	}

}

calculateRandomCoordinatesAroundBlueSquareX(){
	global
	blueCoordinatesX := context.BlueSquareOnMap.x
	Random, rand, 3, 10
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
	Random, rand, 3, 10
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
	global
	fourSquaresBeyond := context.FourSquaresBeyond
	gargoyleGroundColor := context.GargoyleGroundColor
	gargoyleWallColor := context.GargoyleWallColor
	oneSquaresBeyond := context.OneSquaresBeyond

	MouseClick, left, fourSquaresBeyond.up.x, fourSquaresBeyond.up.y
	Sleep, 1500
	MouseClick, left, fourSquaresBeyond.up.x, fourSquaresBeyond.up.y
	Sleep, 1500
	MouseClick, left, fourSquaresBeyond.down.x, fourSquaresBeyond.down.y
	Sleep, 2500
	MouseClick, left, fourSquaresBeyond.down.x, fourSquaresBeyond.down.y
	Sleep, 2500
	while (southColor != gargoyleGround.color){
		MouseClick, left, oneSquaresBeyond.x, oneSquaresBeyond.y
		PixelGetColor, southColor, oneSquaresBeyond.x, oneSquaresBeyond.y
		;Tooltip %southColor%
	}
	PixelGetColor, leftColor, oneSquaresBeyond.left.x, oneSquaresBeyond.left.y
	PixelGetColor, downColor, oneSquaresBeyond.down.x, oneSquaresBeyond.down.y
	while(downColor = gargoyleGroundColor.color){
		PixelGetColor, downColor, oneSquaresBeyond.down.x, oneSquaresBeyond.down.y
		MouseClick, left, oneSquaresBeyond.down.x, oneSquaresBeyond.down.y
		sleep, 100
	}
	if(leftColor <> gargoyleWallColor.color){
		MouseClick, left, oneSquaresBeyond.leftDown.x, oneSquaresBeyond.leftDown.y
	}
}