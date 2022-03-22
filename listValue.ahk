Gui, Add, Button, x126 y17 w50 h20 , OK

Gui, Add, DropDownList, x6 y357 w70 h70 vcard1, 2|3|4|5|6|7|8|9|10
Gui, Add, DropDownList, x96 y357 w70 h70 vcard2, 2|3|4|5|6|7|8|9|10
Gui, Show, x131 y91 h437 w479, New GUI Window
Return

buttonok:
Gui, Submit, NoHide
GuiControlGet, vcard1
msgbox, %vcard1%
return