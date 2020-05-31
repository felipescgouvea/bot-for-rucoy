;
;
; @author: felipescgouvea 31/05/2020
;
;

unlock(){
	PixelGetColor, color, 2140, 92
	if(color = 0x696969){
		;Msgbox locked
		MouseClick, left,  2120,  90
		MouseMove, 1260,  550
	}
}