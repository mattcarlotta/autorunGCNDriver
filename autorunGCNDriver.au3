#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=.\autorunGCNDriver.ico
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <MsgBoxConstants.au3>

; sets mouse coordinates relative to active window
AutoItSetOption("MouseCoordMode", 0)
; sets pixel coordinates relative to active window
AutoItSetOption("PixelCoordMode", 0)
; allows window title partial matching
AutoItSetOption("WinTitleMatchMode", 2)

; left mouse click on a pixel
Func LeftMouseClick($y, $x)
	MouseClick("primary", $y, $x, 1, 0)
EndFunc

; wait for window to exist and focus on the window
Func FocusOnWindow($window = "Gamecube USB Adapter Driver", $text = "")
	WinWait($window, $text, 5)
	WinActivate($window)
EndFunc

; displays an error message box 
Func DisplayError($error)
	MsgBox($MB_ICONERROR, "Error!", $error)
EndFunc

; finds an active vJoy device
Func FindActiveDevice()
	; vJoy controller device number
	Local $devices[4] = [1, 2, 3, 4]
	; vJoy controller device pixel
	Local $devicePixel[4] = [135, 155, 175, 195]
	; active vJoy device
	Local $foundDevice = -1

	; iterate over devices
	For $i = 0 to UBound($devices) - 1
		; select device
		LeftMouseClick(60, $devicePixel[$i])
		; click on Properties button
		LeftMouseClick(315, 255)
		; wait for device property window
		FocusOnWindow("vJoy Device properties")
		; search for X Rotation coord to be red
		Local $color = PixelGetColor(130, 140)
		; if red, exit loop
		If $color == 14680095 Then
			; set device to local variable
			$foundDevice = $devices[$i]
			; exit loop
			ExitLoop
		Else
			; click Cancel button
			LeftMouseClick(280, 435)
		EndIf
	Next

	; close vJoy Device window
	WinClose("vJoy Device properties")
	; close Game Controllers window
	WinClose("Game Controllers")

	; check if found device
	If $foundDevice > -1 Then
		; display found device
		MsgBox($MB_SYSTEMMODAL, "GameCube Controller Information", "vJoy device " & $foundDevice & " appears to be active!" & @CRLF & @CRLF & "This window will automatically close in 5 seconds.", 5)
	Else
		; display error if no device was found
		DisplayError("Unable to find an active GameCube controller!")
	EndIf

	; close Gamecube USB Adapter Driver window
	WinClose("Gamecube USB Adapter Driver")
EndFunc

; runs the GCN Driver and checks for an active device
Func Main()
	; check to see if GCN Driver is installed
	Local Const $GCNDriverInstalled = FileExists("C:\Program Files (x86)\GCNadapter\GCNUSBFeeder.exe")
	If Not $GCNDriverInstalled Then
		; display error if no adapter was found
		DisplayError("Please install the Wii U USB GCN Adapter Driver before running this application!")
		Exit
	EndIf

	; run GCN Driver
	Run("C:\Program Files (x86)\GCNadapter\GCNUSBFeeder.exe")
	; focus on GCN window
	FocusOnWindow()
	; click on Start button
	LeftMouseClick(555, 100)
	; wait for GCN Driver to enter loop
	WinWait("Gamecube USB Adapter Driver", "Driver successfully started, entering input loop", 5)

	; check if GCN Driver has entered loop
	If WinExists("Gamecube USB Adapter Driver", "Driver successfully started, entering input loop") Then
		; focus on GCN window
		FocusOnWindow()
		; click Configuration button
		LeftMouseClick(565, 415)
		; wait for Game Controllers window to pop up
		WinWait("Game Controllers")
		; attempt to find an active device
		FindActiveDevice()
	Else
		; display error if no adapter was found
		DisplayError("Unable to find a connected GCN Adapter!")
	EndIf

	Exit
EndFunc


Main()
