#InstallKeybdHook
#UseHook
#SingleInstance, Force
#NoEnv
;Menu, Tray, NoIcon ; I personally like to have the ability to show/hide tray icon.
SavedDataFile := "TryndLaugh.dat"

xE = 0
yE = 0

IfExist, %SavedDataFile%
    FileReadLine, pixCol, %SavedDataFile%, 1
return

#IfWinActive ahk_exe League of Legends.exe
numpad0::
    WinGetActiveStats, Title, w, h, x, y
    xE := ((48/100)*w)
    yE := ((935/1000)*h)
    PixelGetColor, pixCol, %xE%, %yE%
    FileDelete, %SavedDataFile%
    FileAppend, %pixCol%, %SavedDataFile%
    msgbox, Your Tryndamere Macro is now ready! If it does not work, make sure you are in borderless
return

~e::
    PixelGetColor, currentCol, %xE%, %yE%
    if ErrorLevel != 0
        Return
    else if (currentCol == pixCol)
    {
        sleep 40
        send ^{4 down}
        sleep 10
        send ^{4 up}
    }
return

; I personally like to have the ability to show/hide tray icon.
/*
#IfWinActive
#enter::
    hidStatus = %A_IconHidden%
    if (hidStatus = 0)
        Menu, Tray, NoIcon
    else if (hidStatus = 1)
        Menu, Tray, Icon
return
*/