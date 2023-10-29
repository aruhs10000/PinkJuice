#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

toggle = 0



; Define the RGB color value of red gem
global StaticColor := "0xF61FF9" ;  RGB format (0xRRGGBB)
   
PJColor :="0xF61FF9" ; CancelBox colore
 
F4::Reload


 
tempVar:=0
F3::
{
 
	toggle := !toggle
	While toggle
	{ 
	 	 PJColor:= GetColor(1001,372)
			 
			; MsgBox % "Pink juice color: " ColorCancel
			 if (isPJ(1001,372)  )  
			{
			  
				Click(1186,376) ; LeftBorb 
				 sleep,5
				Click(1284,370) ; RightBorb
				 sleep,5 
				Click(1398,381) ; start 
				 sleep,5
			 }
			 
			 
		CompletTrades()
		CompletTrades()
		RefreshTrades()
		 sleep,11
	
	}
      
}

 CompletTrades()
 {
		Click(1406,371) ;Complet trade
		Click(1406,505) ;Complet trade
		Click(1406,636) ;Complet trade
		Click(1406,786) ;Complet trade
	 
	 
 
 }
Click(x,y)
{
		 	Click, %x%, %y% down ; accept
			 sleep,4
			Click, %x%, %y% up
		
	 
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
isPJ(x,y){

		  PJColor :=GetColor(x,y)
		if (PJColor = StaticColor)
		{
			  
			return true
		}
		 

	return false
}