#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

toggle = 0



; Define the RGB color value of red gem
global StaticColor := "0x4400FF" ;  RGB format (0xRRGGBB)
  ColorValue :=["0x4400FF",""] ; Captured color of gem
ColorCancel :="0x000000" ; CancelBox colore
ColorCancelStatic :="0xD2F1FF" ; CancelBox colore
; Define the coordinates (X, Y) of the gem  
global MouseX := [948,941] ; Replace with the X-coordinate of your point
global MouseY := [325,318] ; Replace with the Y-coordinate of your point

; Set the tolerance level for color matching (adjust as needed)
;Tolerance := 10 ; Adjust the tolerance level (0-255) as needed   
FailSafeCount:= 0 ;
NumberToRepeat:=9
successCounter:=0

F4::Reload
 
 
tempVar:=0
F3::
{
	;test
	toggle := !toggle
	While toggle
	{ 
		Loop, %NumberToRepeat% {
			 ColorCancel:= GetColor(1411,MouseY[1])
			 
			 ;MsgBox % "Color " ColorValue[1]  " Color2 : " ColorValue[2] " StaticColor "  StaticColor  
			;MsgBox %  " Mouse location : x " MouseX[1] " x2 " MouseX[2]  " y: " MouseY[1] " y2: "  MouseY[2]  
		 	if (isGem(MouseX[1],MouseY[1],MouseX[2],MouseY[2]) && ColorCancel != ColorCancelStatic)  
			{
			   tempVar:= MouseY[1] - 325  
			   
				Click(1509,334 + tempVar) ; start 
				successCounter++
				Click(1175,849) ;boost all
			} 
			 MouseY[1] := MouseY[1] + 56
			 MouseY[2] := MouseY[2] + 56
	 }
			
		
		RefreshTrades()
		
		FailSafeCount ++ ; +1
		MouseY[1] := 325
		MouseY[2] := 318
		if(successCounter >= 4 )
		{
			NumberToRepeat := 8 - successCounter ; Sometimes program doesnt catch gem so we need higher amount than 13(max gem trades) 
			if(NumberToRepeat <=0)
			{
				ColorCancel:= GetColor(1411,MouseY[1])
				if (!isGem(MouseX[1],MouseY[1],MouseX[2],MouseY[2]) or !isGem(MouseX[1],MouseY[1]+56,MouseX[2],MouseY[2]+56))  
				{
					NumberToRepeat :=1
				}
			 
			}
		}
			MouseY[1] := 325
		MouseY[2] := 318
			if(NumberToRepeat = 0 )
			{
				
				Click(1175,849) ;boost all
				Sleep,2000
				Click(1563,861) ;Collect Trades
					
				NumberToRepeat := 9 ;
			}
		
		if(FailSafeCount= 40)
		{
			Click(1175,849) ;boost all
			Click(1563,861) ;Collect Trades
 			FailSafeCount := 0 ;
		 
		}
		sleep,2
	
	}
     
 
     

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
isGem(x,y,x2,y2){

		  ColorValue :=[" ",""]
		ColorValue[1]:= GetColor(x,y) ;948,325
		ColorValue[2]:= GetColor(x2,y2) ;941,318
		; msgBox %   "ColorValue1 " ColorValue[1] " ColorValue2 "  ColorValue[2] " StaticColor1 " StaticColor " x: " x " x2: " x2 " y: " y " y2: " y2
		if (ColorValue[1] = StaticColor && ColorValue[2] = StaticColor)
		{
			  
			return true
		}
		 

	return false
}