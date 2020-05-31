;Inspired by thread:http://www.autohotkey.com/board/topic/103338-best-way-for-debug/?hl=%2Bconsole+%2Blog#entry638264
;Based on script by user Hachi.
;Edit by Jared Beach.
;
; #include this script in a script you want to debug. 
; If you run it from the console using the syntax:
; AutoHotkey myscript.ahk |more
; then you will see the debug messages after the script is stopped. 
; Changed it to where if you pass in the flag "debug" as well then 
; you can exit the script by pressing Win + x.
; Updated syntax:
; AutoHotkey myscript.ahk debug |more
;//////////////////////////////////////////////////////////////////




; Determine if this is a debug session
Gosub, SubCheckDebugArgs


; Works regardless if debug argument is passed in.
debug(string) {
string .= "`n" 
    FileAppend %string%,* ;* goes to stdout
}


; win + x ends script so you can see output in command-line
#x::
{
if (isDebug = true) {
Gosub, SubExit
}
Return
}


SubExit:
{
ExitApp ;Terminate for debug
}
SubCheckDebugArgs:
{
isDebug := false
    i := 0
Loop %0% { ; for all commandline arguments
 param = %A_Index%
 if (%param% = "debug") {
  isDebug := true
 }
} 
Return
}