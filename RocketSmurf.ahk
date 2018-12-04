SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen

ScrollLock::loop()

MainMenu:
	Critical
	isQueuing = 1
	sleep 5000
	Send {Esc}
	Sleep 500
	Send {Esc}
	Sleep 500
	Click, 955, 616
	Sleep 850
	Click, 256, 568
	Sleep 950
	Click, 206, 480
	Sleep 900
	Click, 1337, 789
	isQueuing = 0
return

loop()
{
	;SetTimer, ErrorCheckLoop, 600000
	SetTimer, ForfeitLoop, 40000
	SetTimer, ReQueueLoop, 15000
	SetTimer, KeySpamLoop, 8500

	;ErrorCheckLoop:
	;	isChecking = 1
	;	Send {Esc}
	;	Sleep 500
	;	Send {Esc}
	;	Sleep 250
	;	Send {Esc}
	;	Sleep 500
	;	Send {Esc}
	;	Sleep 250
	;	Click, 955, 616
	;	Sleep 850
	;	Click, 256, 568
	;	Sleep 950
	;	Click, 206, 436
	;	Sleep 900
	;	Click, 1337, 789
	;	isChecking = 0
	;return

	ReQueueLoop:
		Critical
		Sleep 1000

		ImageSearch, outX, outY, 630, 400, 1265, 680, *150 mute_button.png
		if (ErrorLevel = 0) {
			Send {Esc}
			Sleep 200
			Send {Esc}
		return
		}

		ImageSearch, outX, outY, 17, 498, 222, 546, *150 rocket_pass.png
		if (ErrorLevel = 0) {
			Gosub MainMenu
		return
		}
		
		ImageSearch, outX, outY, 749, 337, 1171, 739, *150 options_button.png
		if (ErrorLevel = 0) {
			Gosub ForfeitLoop
		return
		}
		
		ImageSearch, outX, outY, 27, 585, 364, 671, *255 save_replay.png
		if (isChecking !=1) && (ErrorLevel = 0) {
			isQueuing = 1
			Click 174, 608
			Sleep 900
			Click, 1337, 789
			Sleep 100
			isQueuing = 0
		}
	return


	ForfeitLoop:
		Critical
		isChecking = 1
		Send {Esc}
		Sleep 500

		ImageSearch, outX, outY, 749, 381, 1167, 690, *150 abandon_match.png
		if (ErrorLevel = 0) {
			Sleep 500
			Send {Esc}
			Sleep 200
			Click 960, 476
			isChecking = 0
			return
		}

		ImageSearch, outX, outY, 749, 381, 1167, 690, *150 leave_match.png
		if (ErrorLevel = 0) {
			Click 945, 654
			Sleep 500
			Click 865, 620
			isChecking = 0
			Sleep 5000
			Gosub MainMenu
			return
		}

		ImageSearch, outX, outY, 749, 381, 1167, 690, *150 forfeit_match.png
		if (ErrorLevel = 0) {
			Click 945, 654
			Sleep 250
			Click 945, 654
			isChecking = 0
			return
		}
		
		isChecking = 0
	return


	KeySpamLoop:
		if (isQueuing != 1) && (isChecking != 1)
			Send {W down}
			else return
		Sleep 1700
		if (isQueuing != 1) && (isChecking != 1)
			Click, down, left
			else return
		Sleep 440
		if (isQueuing != 1) && (isChecking != 1)
			Click, down, right
			else return
		Sleep 100
		Click, up, right
		Click, up, left
		Sleep, 60
		if (isQueuing != 1) && (isChecking != 1)
			Click, down, right
			else return
		Click, up, right
		Sleep 1500
		if (isQueuing != 1) && (isChecking != 1) {
			Send {W down}
			Send {A down}
			}
			else return
		Sleep 1600
		if (isQueuing != 1) && (isChecking != 1) {
			Send {W down}
			Send {D down}
			}
			else return
		Sleep 200
		Send {A up}
		Sleep 900
		Send {D up}
		Sleep 2000
		Send {W up}
		isSpamming = 0
	return

return
}

Numpad0::ExitApp
return