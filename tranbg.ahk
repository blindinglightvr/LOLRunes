CenterWindow(WinTitle)
{
	WinActivate League of Legends
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)	
	return
}
CenterWindow("League of Legends")
; Example: On-screen display (OSD) via transparent window:

CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui, 2: Add, Edit, R20 vMyEdit

Gui 1: +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, 1: Color, %CustomColor%
Gui, 1: Font, s32  ; Set a large font size (32-point).
Gui, 1: Add, Text, vMyText cLime, XXXXX YYYYY  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 200
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.
Gui, 1: Show, x0 y400 NoActivate ; NoActivate avoids deactivating the currently active window.
Gui, 2: Show, h300 w300, Cords
return

#IfWinActive League of Legends
~LButton Up::

theText = %theText%ClickWait(%MouseX%, %MouseY%)`n
GuiControl, 2:, MyEdit, %theText%
;GuiControlGet, 2: MyEdit
;ControlSetText vCords, "test"
return

UpdateOSD:
MouseGetPos, MouseX, MouseY
GuiControl,, MyText, X%MouseX%, Y%MouseY%
return