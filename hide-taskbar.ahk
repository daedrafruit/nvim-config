SetTimer, checkState, 250
checkState:
	if (WinActive("PowerShell") or WinActive("Administrator: PowerShell") or WinActive("Fedora")) {
		enableAutoTaskbar()
	} else {
		disableAutoTaskbar()
	}
return

; Alt + Win + C to run Windows Terminal, minimize all windows, and toggle taskbar state
#c::
	if (WinExist("PowerShell") or WinExist("Administrator: PowerShell") or WinExist("Fedora")) {
		WinMinimizeAll
		WinActivate, Windows Terminal
		WinActivate, PowerShell
		WinActivate, Administrator: PowerShell
		WinActivate, Ubuntu
	} else {
		Run, wt
		WinMinimizeAll
	}
return

^LWin:: ;Ctrl + left Win key
	toggleAutoTaskbar()
return

toggleAutoTaskbar() {
	if (autoTaskbarEnabled()) {
		disableAutoTaskbar()
	} else {
		enableAutoTaskbar()
	}
}

enableAutoTaskbar() {
	VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)
	NumPut(1, APPBARDATA, A_PtrSize=4 ? 32:40) ; 1 - ABS_AUTOHIDE
	DllCall("Shell32\SHAppBarMessage", "UInt", 10, "Ptr", &APPBARDATA)
	KeyWait, % A_ThisHotkey
}

disableAutoTaskbar() {
	VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)
	NumPut(2, APPBARDATA, A_PtrSize=4 ? 32:40) ; 2 - ABS_ALWAYSONTOP
	DllCall("Shell32\SHAppBarMessage", "UInt", 10, "Ptr", &APPBARDATA)
	KeyWait, % A_ThisHotkey
}

autoTaskbarEnabled() {
	VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)
	state := DllCall("Shell32\SHAppBarMessage", "UInt", 4, "Ptr", &APPBARDATA, "Int")
	return (state = 1)
}

; Alt + Win + H to toggle taskbar visibility
!#h::
	toggleHideTaskbar()
return

toggleHideTaskbar() {
	if (isTaskbarHidden()) {
		showTaskbar()
	} else {
		hideTaskbar()
	}
}

hideTaskbar() {
	WinHide ahk_class Shell_TrayWnd
	return
}

showTaskbar() {
	WinShow ahk_class Shell_TrayWnd
	return
}

isTaskbarHidden() {
	WinGet, MinMax, MinMax, ahk_class Shell_TrayWnd
	return (MinMax = -1) ; -1 indicates the window is hidden
}

