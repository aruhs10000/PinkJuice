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
GreenColor :="0x15EA6B" ;  
 
F4::Reload


count:=0
F3::
{
 SetDefaultMouseSpeed, 2

	toggle := !toggle
	While toggle
	{ 
	 	   
			; if ((isPJ(1001,372) and ( GetColor(1002,373) =  PJColor2  )) or GetColor(1001,367) = GreenColor  )  
			 if ((isPJ(1001,372) and ( GetColor(1002,373) =  PJColor2  )) )  
			{
				
				
			
				while(GetColor(1181,364)!= OrangeColor)
				{
					Click(1186,376) ; LeftBorb 
					sleep,5
					Click(1406,786) ;Complet trade
					 
				}
			 
				while(GetColor(1264,364)!=OrangeColor)
				{
					Click(1284,370) ; RightBorb
					sleep,5
					Click(1406,786) ;Complet trade
				}
				while(GetColor(1376,374)!=FinalColor)
				{
					Click(1398,381) ; start
					sleep,5
					Click(1406,786) ;Complet trade
				}
				 
				 count++
			 }
			 RefreshTrades()
			 if(count = 4){
				count:=0
				sleep,30000
				
				CompletTrades()  
			 }
 
		
		 sleep,22
	
	}
      
}

 CompletTrades()
 {
		;while( GetColor(1380,635) != FinalColor )
		;{
		;	Click(1395,635) ;Complet trade
		;	 
		;}
      tempI:=0
	  while(tempI<15)
	  {
		Click(1395,635) ;Complet trade
		 tempI++
	  }
	  
 
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
isPJ(x,y){

		PJColor :=GetColor(x,y)
		if (PJColor = StaticColor)
		{
			  
			return true
		}
		 

	return false
}
F5::
{
  PJColor:= GetColor(1001,367)
   MsgBox % "Pink juice color: " PJColor " " OrangeColor
		 	
}
 