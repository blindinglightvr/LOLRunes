Gui, Add, ListBox, vMyListBox gMyListBox, Test1|Test2

Gui, Show

return



MyListBox:

if A_GuiControlEvent <> DoubleClick

	return

; Otherwise, the user double-clicked a list item.

GuiControlGet, MyListBox  ; Retrieve the ListBox's current selection.

MsgBox You double-clicked the item "%MyListBox%".

return



GuiClose:

ExitApp