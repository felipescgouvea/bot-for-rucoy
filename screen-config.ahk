;
;
; Screen coordinates config
;
;
setDefaultConfig(A_ScreenWidth, A_ScreenHeight)


setDefaultConfig(screenX, screenY){
	global
	context := {}
	if(screenX = 2560 && screenY = 1080){
		setCoordinatesForDeepWideScreen()
		Msgbox high resolution screen
	}
	if(screenX = 1366 && screenY = 768){
		setCoordinatesForDefaultNotebookScreen()
		MsgBox low resolution screen
	}
}

addConfig(name, leftCoordinates, rightCoordinates, upCoordinates, downCoordinates, chosenColor){
		global
		;MsgBox, % name
		context[name] := {left: leftCoordinates, right: rightCoordinates, up: upCoordinates, down: downCoordinates, color: chosenColor}
}

addCoordinates(name, value){
		global
		;MsgBox, % name
		context[name] := value 
}

addAroundCoordinates(name, leftCoordinates, rightCoordinates, upCoordinates, downCoordinates, leftDownCoordinates, leftUpCoordinates, rightDownCoordinates, rightUpCoordinates){
		global
		;MsgBox, % name
		context[name] := {left: leftCoordinates, right: rightCoordinates, up: upCoordinates, down: downCoordinates, leftdown: leftDownCoordinates, leftUp: leftUpCoordinates, rightDown: rightDownCoordinates, rightUp: rightUpCoordinates}
}

; For resolution 1366x768 - Game fullscreen
setCoordinatesForDefaultNotebookScreen(){
	addConfig("Skeleton", {x:1139,y:515}, {x:1373,y:515}, {x:1258,y:394}, {x:1258,y:624}, "0xF3F3F3")
	addConfig("Vampire", {x:586,y:360}, {x:728,y:364}, {x:644,y:282}, {x:645,y:438}, "0xD1D16F") ; Right
	addConfig("DrowAssassin", {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, "0xB30E9C")
	addConfig("DrowFighter", {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, "0xA4947C")	
	addConfig("Djinn", {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, "0xE2C681")
	addConfig("Gargoyle", {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, "0x635542")
	addConfig("AttackingMonsterConfig", {x:1097,y:512}, {x:1422,y:525}, {x:1261,y:372}, {x:1256,y:699}, "0x3232CF")

	addConfig("GreenPath", {x:651,y:378}, {x:672,y:378}, {x:660,y:367}, {x:662, y:390}, "0xF3F3F3")

	addCoordinates("BlueSquareOnMap", {x:662, y:377})
	addCoordinates("MapIcon", {x:995, y:70})
	addCoordinates("ReturnIcon", {x:1235, y:75})
	addCoordinates("ManaCoordinates", {x:224,	y:76, color: "0x696969"})
	addCoordinates("LifeCoordinates", {x:325,	y:55, color: "0x696969"})

}
; For resolution 2560x1080 - Game fullscreen
setCoordinatesForDeepWideScreen(){
	addAroundCoordinates("FourSquaresBeyond", {x:1140,y:515}, {x:1375,y:515}, {x:1240,y:95}, {x:1240,y:980}, {x:1140,y:980}, {x:1140,y:95}, {x:1375,y:980}, {x:1375,y:95}) ; updated
	addAroundCoordinates("OneSquaresBeyond", {x:1140,y:550}, {x:1350,y:550}, {x:1250,y:440}, {x:1250,y:620}, {x:1140,y:620}, {x:1140,y:440}, {x:1350,y:620}, {x:1350,y:440}) ; updated

	addConfig("Skeleton", {x:1139,y:515}, {x:1373,y:515}, {x:1258,y:394}, {x:1258,y:624}, "0xF3F3F3") ; updated
	addConfig("Vampire", {x:1159,y:522}, {x:1357,y:522}, {x:1256,y:411}, {x:1223,y:621}, "0xD1D16F") ; updated
	addConfig("DrowAssassin", {x:1130,y:510}, {x:1405,y:521}, {x:1252,y:387}, {x:1250,y:696}, "0xB30E9C")

	addConfig("DrowFighter", {x:1122,y:522}, {x:1402,y:523}, {x:1233,y:410}, {x:1285,y:641}, "0xA4947C") ;updated

	addConfig("Djinn", {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, {x:1,y:2}, "0xE2C681")

	addConfig("Gargoyle", {x:1,y:2}, {x:1,y:2}, {x:1200,y:441}, {x:1,y:2}, "0x635542")

	addConfig("AttackingMonsterConfig", {x:1097,y:584}, {x:1420,y:490}, {x:1286,y:373}, {x:1295,y:701}, "0x3232CF") ; updated

	addConfig("GreenPath", {x:1240,y:534}, {x:1276,y:534}, {x:1255,y:516}, {x:1255, y:558}, "0xF3F3F3") ;updated

	addCoordinates("BlueSquareOnMap", {x:1250, y:540}) ; updated
	addCoordinates("MapIcon", {x:1740, y:105}) ; updated
	addCoordinates("ReturnIcon", {x:2070, y:100}) ; updated

	addCoordinates("ManaCoordinates", {x:667,	y:99, color: "0x696969"}) ;updated
	addCoordinates("LifeCoordinates", {x:795,	y:70, color: "0x696969"}) ;updated

	addCoordinates("LootCoordinates", {x:2092,	y:322, color: "0x3F99F8"}) ; updated

	addCoordinates("AbsoluteCenter", {x:1256, y:530})

	addCoordinates("GargoyleGroundColor", {color: "0x3D3D3D"})
	addCoordinates("GargoyleWallColor", {color: "0x4D4D4D"})

	addCoordinates("ExaustedCoordinates", {x:1495,	y:742, color: "0x3D3DFF"}) 
	addCoordinates("changeToKnightWeaponCommand" , "F1")
	addCoordinates("changeToArcherWeaponCommand", "F2")
	addCoordinates("changeToMageWeaponCommand",  "F3")
	
}

;
