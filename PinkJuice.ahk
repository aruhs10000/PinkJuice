 #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

toggle = 0



; Define the RGB color value of red gem
global StaticColor := "0xF61FF9" ;  RGB format (0xRRGGBB)
   
PJColor :="0xF61FF9" ; PinkJuiceBox colore
PJColor2 :="0xF825F9" ; PinkJuiceBox colore
OrangeColor :="0x1560E1" ; BorbSelectBox colore
FinalColor :="0x4A7197" ; After Claiming All Trades Its Color That Remains colore
GreenColor :="0x15EA6B" ;   green for elixirs or spores?
CancelColor :="0x1E1ADD" ;   Color of cancel in middle
global ActiveFinishColor :="0x8AD2FD"
global NotActiveFinishColor :="0xD2F1FF"
global prevX := 0
global prevY := 0

F4::
{
Reload  
return
}
count:=0
F3::
{
	#Persistent
	SetTimer, CompletTrades, 30000 
	SetDefaultMouseSpeed, 1 
	toggle := !toggle
	While toggle
	{ 
	 	  
			;if ((isPJ(1001,372) and ( GetColor(1002,373) =  PJColor2  )) or GetColor(1001,367) = GreenColor  )  
			
			if ((  !isPJ(1560,636,CancelColor)) and (isPJ(1001,372,StaticColor) and ( isPJ(1002,373,PJColor2) ) )  )  
			{
				
			 
			
				while(GetColor(1181,364)!= OrangeColor)
				{
					Click(1186,376) ; LeftBorb 
					 sleep,15
					Click(1186,425) ;Complet trade
					
				}
			 
				while(GetColor(1264,364)!=OrangeColor)
				{
					Click(1284,370) ; RightBorb
				sleep,15
					Click(1284,425) ;Complet trade
						
				}
				while(GetColor(1376,374)!=FinalColor)
				{
					Click(1398,381) ; start
					sleep,15
					Click(1406,425) ;Complet trade
					
				}
				 count ++ 
			 }
			  RefreshTrades()
			 if(count = 4)
			 {
				count := 0
				sleep,31000
				CompletTrades()
			 }
			
			 
		
		 sleep,33 ; If too fast can cause random trade acceptance
	
	}
      return 
}

 CompletTrades()
 {
		 
		    MouseGetPos, prevX, prevY

		WinActivate, Leaf Blower Revolution
		Click(1395,635)
		
		 while( GetColor(1454,630) = ActiveFinishColor  ) ;ActiveFinishColor "0x8AD2FD" NotActiveFinishColor :="0xD2F1FF"
		 {
		 	Click(1395,635) ;Complet trade
		 	 ;Click(1395,610 ) ;Complet trade
			sleep, 20
		 }
		MouseMove, prevX*-1, prevY, 10
 
 }
Click(x,y)
{
			SendEvent {Click %x%, %y%}
		 ;	Click, %x%, %y% down ; accept
			; sleep,4
		;	Click, %x%, %y% up
		 
	 
}
GetColor(x,y)
{
	Color:=0
 	
	PixelGetColor, Color, %x%, %y% ; Capture the color at the mouse cursor position
  
	return Color 
}
RefreshTrades()
{
	 
			 
			send {r}
}
isPJ(x,y,color){

		PJColor :=GetColor(x,y)
		if (PJColor = color)
		{
			  
			return true
		}
		 

	return false
}
F5::
{
   
     PJColor:=  GetColor(1560,636)
     MsgBox % "Pink juice color: " PJColor " " NotActiveFinishColor
	 
	
}
#If WinActive("ahk_exe game.exe")
{
	WheelUp::  return
	WheelDown:: return 
}

#If !WinActive("ahk_exe game.exe")
{
	 WheelUp::
	 {
		Send, {WheelUp} 
		return
	 }
	 WheelDown::
	 {
		Send, {WheelDown} 
		return
	 }
}

 