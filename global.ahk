test = true
f(){
	global
	msgbox %test%
	if (%test% = true)
		msgbox worked
		
}

f()