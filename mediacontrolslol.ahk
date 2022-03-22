#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Process, Exist, LeagueClientUx.exe; check to see if is running
If (ErrorLevel = 0) ; If it is not running
	{
	Run *runas "C:\Riot Games\League of Legends\LeagueClient.exe"
	}

F8::	
WinGet, List, List
Loop % List
  WinMaximize % "ahk_id " List%A_Index%
	
;next song
#IfWinActive League of Legends
F12::	;the + means shift
Send {Media_Next}
return 

;previous song
#IfWinActive League of Legends
F10::
Send {Media_Prev}
return

;play/pause
#IfWinActive League of Legends
F11::
Send {Media_Play_Pause}
return

;stop
#IfWinActive League of Legends
F9::
Send {Media_Stop}
return

; #IfWinActive League of Legends
; F1::
; clipboard = No ganks until 6 unless wide open. I am focusing dragons/rift/objectives. Don't blame me when you get ganked under their tower. GL!
; send ^v{enter}
; return

;mid
#IfWinActive League of Legends
F1::
clipboard = mid
send ^v{enter}
return

;top
#IfWinActive League of Legends
F2::
clipboard = top
send ^v{enter}
return

;jungle
#IfWinActive League of Legends
F3::
clipboard = jungle
send ^v{enter}
return

;adc
#IfWinActive League of Legends
F4::
clipboard = adc
send ^v{enter}
return

;support
#IfWinActive League of Legends
F5::
clipboard = Support
send ^v{enter}
return

; lol pw
#IfWinActive League of Legends
F8::
;send xlhpu{shift down}P{shift up}o{shift down}6Z{shift up}4ql3m{shift down}UG8{shift up}n{shift down}Z{shift up}9{shift down}1X{shift up}67{enter}
clipboard = UYf2ISBrS&nCA5TlaJvI2Y#
Send ^v{enter}
return

; F11 key by default, Fn+F11 does nothing
!#F22::
SendInput {F11}
return
