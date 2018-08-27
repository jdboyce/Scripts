#SingleInstance force


; 9 = 540, 8 = 480, 7 = 420, 6 = 360, 5 = 300, 4 = 240, 3 = 180, 2 = 120





;  /////////// VARIABLES /////////// 

TotalSec := 540

DurCount := 0

isPaused := false

;  ///////////////////////////////





;  /////////// GUI CONTROL /////////// 

Gui, Add, Text, x60 y35 w150 h15, Presentation Countdown:
Gui, Add, Text, x186 y35 w150 h15 vUserVar,
Gui, Add, Text, x78 y75 w150 h15, Meeting Duration:
Gui, Add, Text, x168 y75 w150 h15 vDurVar,
Gui Add, Button, x30 y120 w200 h30  gStart, START
Gui Add, Button, x30 y160 w200 h30 vcd_Button gPause, PAUSE
Gui Add, Button, x30 y200 w200 h30 gNext, NEXT
Gui Show, h250 w260, Moderator

durNum := FormTime(DurCount)
GuiControl, Text, DurVar, %durNum%

metNum := FormTime(TotalSec)
GuiControl, Text, UserVar, %metNum%

return

;  /////////////////////////////////





;  /////////// BUTTON ACTIONS /////////// 

Start:
TotalSec := 540
SetTimer Pres_Countdown, 1000
SetTimer Meeting_Duration, 1000
Return	

Pause:
Gosub, TogglePause
Return

Next:
TotalSec := 540
Return

;  /////////////////////////////////





;  /////////// TIMERS ///////////// 
	
Meeting_Duration:
Num := FormTime(DurCount)
GuiControl, Text, DurVar, %Num%
DurCount := DurCount+1
Return
	

Pres_Countdown:

if (isPaused = false)

{
	p_Count := FormTime(TotalSec)

	GuiControl, Text, UserVar, %p_Count%

	if (TotalSec = 539)
	{
		TimerStart()
	}
	
	else if (TotalSec = 534)   ;180
	{
		3MinWarning()
	}
		
	else if (TotalSec = 529)   ;60
	{
		1MinWarning()
	}
	
	else if (TotalSec = 524)   ;10
	{
		10SecWarning()
	}
		
	else if (TotalSec = 519)   ;0
	{
		TimeUpWarning()
	}


	TotalSec := TotalSec -1
}	
Return

;  /////////////////////////////////





;  /////////// FUNCTIONS ///////////// 

TogglePause:
if (isPaused = false)
{
	isPaused := true
	GuiControl,, cd_Button, CONTINUE
}
else
{
	isPaused := false
	GuiControl,, cd_Button, PAUSE

}
Return

	
FormTime(d_PassedSec)
{
	
	xSec := Mod(d_PassedSec, 60)
	if (xSec < 10)
		{
			xSec := "0" + xSec
		}
	xMin := d_PassedSec / 60
	yMin := Floor(xMin)
	xTime = %yMin%:%xSec%

	
	Return xTime
}

;  /////////////////////////////////



	
/*
d_FormTime(d_PassedSec)
{
	
	xSec := Mod(d_PassedSec, 60)
	if (xSec < 10)
		{
			xSec := "0" + xSec
		}
	xMin := d_PassedSec / 60
	yMin := Floor(xMin)
	xTime = %yMin%:%xSec%

	GuiControl, Text, DurVar, %xTime%
	
	Return xTime
}

*/
		
	
	
	
	
;  /////////// EXTERNAL SCRIPTS ///////////// 


TimerStart()
	{
		Run, C:\Users\josh.boyce\Documents\Macro Scripts\Threads\TimerStart.ahk 
	}

3MinWarning()
	{
		Run, C:\Users\josh.boyce\Documents\Macro Scripts\Threads\3MinWarning.ahk 
	}		
	
1MinWarning()
	{
		Run, C:\Users\josh.boyce\Documents\Macro Scripts\Threads\1MinWarning.ahk 
	}
	
10SecWarning()
	{
		Run, C:\Users\josh.boyce\Documents\Macro Scripts\Threads\10SecWarning.ahk 
	}		
	
TimeUpWarning()
	{
		Run, C:\Users\josh.boyce\Documents\Macro Scripts\Threads\TimeUpWarning.ahk 
	}

return

;  /////////////////////////////////

































	
	/*
StartMeeting(PassedSec, PassedCounter)
{
	TimeCount := PassedSec
	
	Loop, %PassedCounter%
	{
		
		FormatTime(TimeCount)
		
		if (TimeCount = 540)
		{
			TimerStart()
		}
		
		else if (TimeCount = 60)
		{
			1MinWarning()
		}
		
		else if (TimeCount = 0)
		{
			TimeUpWarning()
		}
		TimeCount := TimeCount-1
		sleep 1000
	}
}
	
	*/
	
	













/*
GuiControl,, UserVar, % "4"
sleep 1000
GuiControl,, UserVar, % "3"
sleep 1000
GuiControl,, UserVar, % "2"
sleep 1000
GuiControl,, UserVar, % "1"
sleep 1000
GuiControl,, UserVar, % "0"
return
*/
/*InputBox, OutputVar, Question 1, What is your first name?
if (OutputVar = "Bill")
MsgBox, That's an awesome name`,, %OutputVar%.
InputBox, OutputVar2, Question 2, Do you like AutoHotkey?
if (OutputVar2 = "yes")
MsgBox, Thank you for answering %OutputVar2%`, %OutputVar%! We will become great friends.
else
MsgBox, %OutputVar%`, That makes me sad.
*/