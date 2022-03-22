firstRun = false;
listViewMode = 0

scroll(direction, count){
	if (direction = "up"){
		msgbox up
		Loop, count {
			Send {WheelUp 1}
		}
	}

	if (direction = "down"){
		Loop, %count% {
			Send {WheelDown 1}
		}
	}
	return 
}

setRune(type, rune, col, row){
	global
	LV_GetText(champ, A_EventInfo, 2)  ; Get the text from the row's first field.	
	GuiControlGet, role
	if (%firstRun% = true){
		ClickWait(1016,1233) ;Select Rune Champ fromelect drop down list
		MouseMove, 991, 1080 ;move mouse of rune list for scrolling		
		scroll("down", 50)    ;Scroll to bottom of the list
		ClickWait(958,856)   ;select first customizable rune set 
		ClickWait(800,1230)  ;pull up runes from champ select screen
		ClickWait(285, 228)  ;Edit the rune set name
		sleep, 50	
		send ^a
		send {Delete}
		clipboard = %champ%: %role%
		Send ^v{enter}
		sleep, 50	
		ClickWait(335,1208)  ;select grid view
	}
	precision = false
	if (type = 1 && rune = 1){
		ClickWait(427,380)		
		precision = true 
	}
	if (type = 1 && rune = 2)
		ClickWait(505,380)	
	if (type = 1 && rune = 3)
		ClickWait(580,380)	
	if (type = 1 && rune = 4)
		ClickWait(650,380)			
	if (type = 1 && rune = 5)
		ClickWait(730,380)	
		
	if (type = 2 && rune = 1)
		ClickWait(1030,380)		
	if (type = 2 && rune = 2)
		ClickWait(1120,380)	
	if (type = 2 && rune = 3)
		ClickWait(1200,380)	
	if (type = 2 && rune = 4)
		ClickWait(1300,380)			
	
	;PRIMARY RUNES
	if (type = 1 && row = 1 && col = 1 && %precision% = false)
		ClickWait(460,590)
	if (type = 1 && row = 1 && col = 2 && %precision% = false)
		ClickWait(580,590)
	if (type = 1 && row = 1 && col = 3 && %precision% = false)
		ClickWait(690,590)
	
	if (type = 1 && row = 1 && col = 1 && %precision% = true)
		ClickWait(440,600)
	if (type = 1 && row = 1 && col = 2 && %precision% = true)
		ClickWait(535,600)
	if (type = 1 && row = 1 && col = 3 && %precision% = true)
		ClickWait(625,600)
	if (type = 1 && row = 1 && col = 4 && %precision% = true)
		ClickWait(710,600)
		
	if (type = 1 && row = 2 && col = 1)
		ClickWait(460,740)
	if (type = 1 && row = 2 && col = 2)
		ClickWait(580,740)
	if (type = 1 && row = 2 && col = 3)
		ClickWait(690,740)	

	if (type = 1 && row = 3 && col = 1)
		ClickWait(460,920)
	if (type = 1 && row = 3 && col = 2)
		ClickWait(580,920)
	if (type = 1 && row = 3 && col = 3)
		ClickWait(690,920)		
		
	if (type = 1 && row = 4 && col = 1)
		ClickWait(460,1080)
	if (type = 1 && row = 4 && col = 2)
		ClickWait(580,1080)
	if (type = 1 && row = 4 && col = 3)
		ClickWait(690,1080)		

	;SECONDARY RUNES 
	if (type = 2 && row = 1 && col = 1)
		ClickWait(1050,540)
	if (type = 2 && row = 1 && col = 2)
		ClickWait(1170,540)
	if (type = 2 && row = 1 && col = 3)
		ClickWait(1280,540)		
	
	if (type = 2 && row = 2 && col = 1)
		ClickWait(1050,680)
	if (type = 2 && row = 2 && col = 2)
		ClickWait(1170,680)
	if (type = 2 && row = 2 && col = 3)
		ClickWait(1280,680)	

	if (type = 2 && row = 3 && col = 1)
		ClickWait(1050,820)
	if (type = 2 && row = 3 && col = 2)
		ClickWait(1170,820)
	if (type = 2 && row = 3 && col = 3)
		ClickWait(1280,820)		

	return 		
}


ClickWait(x, y){
	Click, %x%, %y%
	Sleep, 25
	return
}

CenterWindow(WinTitle)
{
	WinActivate League of Legends
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)	
	return
}

; Create the ListView with two columns, Name and Size:
;Gui, Add, ListView, r20 w300 gMyListView, Champion|Role
;https://autohotkey.com/docs/commands/ListView.htm#IL
Gui, Font, s12
; 0x2000 = no scroll
; c Color 
; r rows
; w width
; list types: Tile Icon Report 
Gui, 1: Add, ListView, Tile -Hdr 0x2000 c0000FF r7 w160 x10 vMyListView gMyListView, Icon|Champion
Gui, Font
;Gui, 1: Add, ListView, Grid -Hdr c0000FF r19 w160 vMyListView gMyListView, Icon|Champion
ImageListID1 := IL_Create(7, 7)  
ImageListID2 := IL_Create(7, 7, true)  
LV_SetImageList(ImageListID1)  
LV_SetImageList(ImageListID2)

champArray := {Caitlyn: "caitlyn.png", Diana: "diana.png", Graves: "graves.png", Kayn: "kayn.png", "Miss Fortune": "missfortune.png", Rammus: "rammus.png", Thresh: "thresh.png", Udyr: "udyr.png", Yasuo: "yasuo.png"}

For key, value in champArray {
	IL_Add(ImageListID1, value, 0xFFFFFF, 1) 
}

For key, value in champArray {
	IL_Add(ImageListID2, value, 0xFFFFFF, 1) 
}

For key, value in champArray {
	LV_Add("Icon" . A_Index, key, key)
}


LV_ModifyCol(1, 20)  ; Auto-size each column to fit its contents.
LV_ModifyCol(2, 119)  ; Auto-size each column to fit its contents.
;LV_ModifyCol()  ; Auto-size each column to fit its contents.

Gui, 1: Add, Picture, x0 y0 w400 +0x4000000, background3grey.png
Gui, 1: Font, cFFFFFF
Gui, 1: Add, Text, x180 y10 +BackgroundTrans, Role
Gui, 1: Add, ListBox, x180 y24 h70 w110 c0000FF vrole , Mid||Top|Jungle|ADC|Support
;Gui, 1: Add, DropDownList, x160 y24 w70 h70 vrole , Mid||Top|Jungle|ADC|Support
Gui, 1: Add, Text, x180 y95 BackgroundTrans, Type
Gui, 1: Add, DropDownList, x180 y110 w70 h70 vtype, Default||AP|vs AD|vs Burst
Gui, 1: Add, Button, x10 y306 w160, Switch View
Gui, 1: Add, Text, x10 y330 BackgroundTrans, Double click the champion you want to set runes for while 
Gui, 1: Add, Text, x10 y340 BackgroundTrans, in the champion select screen 


; Display the window and return. The script will be notified whenever the user double clicks a row.
Gui, 1: Show, x3087 y432 w300 h360, LoL Rune Selector
CenterWindow("League of Legends")

;### Icon Handling
IconFile = C:\Users\mikey\OneDrive\Documents\AHK Scripts\lol.ico
WinSpec = LoL Rune Selector
hWnd  := WinExist(WinSpec)
hIcon := DllCall("LoadImage", uint, 0, str, IconFile, uint, 1, int, 0, int, 0, uint, LR_LOADFROMFILE:=0x10)
SendMessage, WM_SETICON:=0x80, ICON_SMALL2:=0, hIcon,, ahk_id %hWnd%  ; Set the window's small icon
SendMessage, WM_SETICON:=0x80, ICON_BIG:=1   , hIcon,, ahk_id %hWnd%  ; Set the window's big icon to the same one.

Menu Tray, Icon, lol.ico,   ; Folder icon
;Menu Tray, Icon, shell32.dll, 5  ; Folder icon
return

ButtonSwitchView:
if (listViewMode = 0){
	GuiControl, +Icon, MyListView    ; Switch to icon view.
	Gui, Font
	Gui, Font, c0000FF
	GuiControl Font, MyListView
	listViewMode = 1 
	return
}
if (listViewMode = 1){
	Gui, Font
	Gui, Font, c0000FF
	GuiControl Font, MyListView
	GuiControl, +Report, MyListView    ; Switch to icon view.
	listViewMode = 2 
	return
}

if (listViewMode = 2){
	Gui, Font, s12
	GuiControl Font, MyListView
	GuiControl, +Tile, MyListView    ; Switch to icon view.
	listViewMode = 0
	return
}
return

MyListView:
if A_GuiEvent = DoubleClick
{
	LV_GetText(champ, A_EventInfo, 2)  ; Get the text from the row's second field.	
    ;ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"	
	%champ%()	
}
return

showMessage(){
global
CenterWindow("League of Legends")
LV_GetText(champ, A_EventInfo, 2)  ; Get the text from the row's first field.	
GuiControlGet, role
CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui 2: +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, 2: Color, %CustomColor%
Gui, 2: Font, s32  ; Set a large font size (32-point).
Gui, 2: Add, Text, vMyText cLime,  Loading %champ%'s runes for %role% ;XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
Gui, 2: Show, x0 y0 NoActivate  ; NoActivate avoids deactivating the currently active window.
return


}

Caitlyn(){ 
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "ADC"){
		showMessage()		
		firstRun = true
		;Type/Rune/Col/Row
		setRune(1, 2, 1, 1)
		firstRun = false
		setRune(1, 2, 3, 2)
		setRune(1, 2, 3, 3)
		setRune(1, 2, 1, 4)
		setRune(2, 1, 2, 2)
		setRune(2, 1, 2, 3)
		Gui, 2:Destroy
	}
	return 
}

Kayn(){
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "Jungle"){
		showMessage()		
		firstRun = true
		;Type/Rune/Col/Row
		setRune(1, 2, 1, 1)
		firstRun = false
		setRune(1, 2, 3, 2)
		setRune(1, 2, 3, 3)
		setRune(1, 2, 1, 4)
		setRune(2, 1, 2, 1)
		setRune(2, 1, 1, 3)
		Gui, 2:Destroy
	}
	return 
}

MissFortune(){
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "ADC"){
		showMessage()		
		firstRun = true
		setRune(1, 3, 2, 1)
		firstRun = false
		setRune(1, 3, 2, 2)
		setRune(1, 3, 2, 3)
		setRune(1, 3, 1, 4)
		setRune(2, 1, 2, 1)
		setRune(2, 1, 1, 3)
		Gui, 2:Destroy
	}
	return
}

Rammus(){	
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "Jungle"){
		showMessage()		
		firstRun = true
		setRune(1, 1, 1, 1)
		firstRun = false
		setRune(1, 1, 2, 2)
		setRune(1, 1, 2, 3)
		setRune(1, 1, 1, 4)
		setRune(2, 3, 3, 1)
		setRune(2, 3, 3, 3)
		Gui, 2:Destroy
	}
	return
}

Thresh(){	
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "Support"){
		showMessage()		
		firstRun = true
		setRune(1, 4, 2, 1)
		firstRun = false
		setRune(1, 4, 3, 2)
		setRune(1, 4, 3, 3)
		setRune(1, 4, 3, 4)
		setRune(2, 4, 3, 2)
		setRune(2, 4, 2, 3)
		Gui, 2:Destroy
	}
	return
}

Udyr(){	
	global
	GuiControlGet, role
	WinActivate League of Legends
	if(role = "Jungle"){
		showMessage()		
		firstRun = true
		setRune(1, 1, 1, 1)
		firstRun = false
		setRune(1, 1, 2, 2)
		setRune(1, 1, 1, 3)
		setRune(1, 1, 1, 4)
		setRune(2, 1, 1, 1)
		setRune(2, 1, 3, 3)
		Gui, 2:Destroy
	}
	return
}


GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp