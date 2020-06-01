;
;
; Screen coordinates config
;
;
context := {}

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