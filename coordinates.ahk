;
;
; Coordinates file
;
;

;F2::
;	result := getRelatedCoordinatesX("DOWN")
;	Msgbox %result%


	
getRelatedCoordinatesX(direction){
			resultX := 1240
			;if(direction = "LEFTUP" || direction = "LEFTDOWN"){
			;	resultX := 1130
			;}
			;if(direction = "RIGHTUP" || direction = "RIGHTDOWN"){
			;	resultX := 1365
			;}
			if(direction = "LEFT"){
				resultX := 1125
			}
			if(direction = "RIGHT"){
				resultX := 1350
			}
			return resultX
}

getRelatedCoordinatesY(direction){
			resultY := 525
			;if(direction = "LEFTUP" || direction = "RIGHTUP"){
			;	resultY := 425
			;}
			;if(direction = "LEFTDOWN" || direction = "RIGHTDOWN"){
			;	resultY := 645
			;}
			if(direction = "UP"){
				resultY := 415
			}
			if(direction = "DOWN"){
				resultY := 640
			}
			return resultY
}