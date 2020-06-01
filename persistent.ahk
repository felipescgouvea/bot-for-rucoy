;
;
; Persistent functions
;
;

F12::  
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%
	Tooltip The color at the current cursor position is %color%. %MouseX% %MouseY%
	;Click, MouseX, MouseY
	return