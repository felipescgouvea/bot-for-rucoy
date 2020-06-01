

loot(){
	global
	PixelGetColor, lootColor, %lootPixelX%, %lootPixelY%
	;Msgbox loot color : %lootColor% , %lootPixelX%, %lootPixelY%
	if(lootColor = 0x3f99f8){
		Send, {Numpad4}
	}
}