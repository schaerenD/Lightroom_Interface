local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'
local LrDevelopController = import 'LrDevelopController'
local LrApplicationView   = import 'LrApplicationView'
local LrUndo = import 'LrUndo'


----------------- Global Variabel  ----------------
WertString    	= "NIL"
BefehlString  	= "NIL"
WertChar 		= 0 
----------------- Global Variabel  ----------------
---------------- ChangeLum Function ---------------

function ChangeLum()

	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("LuminanceAdjustmentRed")				-- Pop Up Menü

end
	

---------------- ChangeLum Function ---------------
---------------- ChangeSat Function ---------------

function ChangeSat()

	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("SaturationAdjustmentRed")				-- Pop Up Menü
	
end
	

---------------- ChangeSat Function ---------------
---------------- ChangeHue Function ---------------

function ChangeHue()
	
	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("HueAdjustmentRed")				-- Pop Up Menü
end
	
---------------- ChangeHue Function ---------------
------------------ Copy Function ------------------

function Copy()
	
	LrDialogs.message( "Nothing", "Nothing", "info" )
	
	--
	
end
	
------------------ Copy Function ------------------
------------------ Paste Function -----------------

function Paste()
	
	LrDialogs.message( "Nothing", "Nothing", "info" )
	
end
	
------------------ Paste Function ------------------
------------------ Pick Function ------------------

function Pick()
	
	--local isPicked = 0
	
	--isPicked = LrSelection.getFlag() 
	
	--if isPicked == false then LrSelection.flagAsPick() 
	--else LrSelection.removeFlag()
	--end
	
end
	
------------------ Pick Function ------------------
----------- switchToFullscreen Function -----------

function switchToFullscreen()
	
	local IsDisplayOn

	IsDisplayOn = LrApplicationView.isSecondaryDisplayOn()

	--if	IsDisplayOn == false then LrApplicationView.toggleSecondaryDisplay()					
	--end							

	LrApplicationView.toggleSecondaryDisplayFullscreen()
	
	
end
	
----------- switchToFullscreen Function -----------


-------------- ChangeExposure Function ------------
function ChangeExposure(Groesse,Richtung)
	
		local valueDevelopt = 0
	
		LrApplicationView.switchToModule('develop')		-- Change Module
		LrDevelopController.revealPanel(Groesse)		-- Pop Up Menü
	
		valueDevelopt = LrDevelopController.getValue(Groesse);
		valueDevelopt = 100*valueDevelopt;
		if     	Richtung == "positiv" then valueDevelopt = valueDevelopt + WertChar;                             
		elseif 	Richtung == "negativ" then valueDevelopt = valueDevelopt - WertChar;
		elseif	Richtung == "zero"	  then valueDevelopt = 0;
		else	LrDialogs.message( "Das hat nicht geklappt", "ChangeAdjustPanel", "info" )
		end
		valueDevelopt = valueDevelopt/100;	   
		LrDevelopController.setValue(Groesse,valueDevelopt);
	
	end
	

-------------- ChangeExposure Function ------------

----------- ChangeAdjustPanel Function  -----------

function ChangeAdjustPanel(Groesse,Richtung)

	local valueDevelopt = 0

	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel(Groesse)		-- Pop Up Menü

	valueDevelopt = LrDevelopController.getValue(Groesse); 
	if     	Richtung == "positiv" then valueDevelopt = valueDevelopt + WertChar;                             
	elseif 	Richtung == "negativ" then valueDevelopt = valueDevelopt - WertChar;
	elseif	Richtung == "zero"	  then valueDevelopt = 0;
	else	LrDialogs.message( "Das hat nicht geklappt", "ChangeAdjustPanel", "info" )
	end	   
	LrDevelopController.setValue(Groesse,valueDevelopt);

end

----------- ChangeAdjustPanel Function  -----------
----------------- Execute Function  ---------------

function ExecuteFunction()

	local valueDevelopt
	
    -- Fakultaet(message)
	if     BefehlString == "Contrast+" 			then ChangeAdjustPanel("Contrast","positiv")                            
	elseif BefehlString == "Shadows+" 			then ChangeAdjustPanel("Shadows","positiv")        
	elseif BefehlString == "Whites+" 			then ChangeAdjustPanel("Whites","positiv")        
	elseif BefehlString == "Blacks+" 			then ChangeAdjustPanel("Blacks","positiv")        
	elseif BefehlString == "Highligths+" 		then ChangeAdjustPanel("Highlights","positiv")        
	elseif BefehlString == "Exposure+" 			then ChangeExposure("Exposure","positiv")        
	elseif BefehlString == "Clarity+" 			then ChangeAdjustPanel("Clarity","positiv")        
	elseif BefehlString == "Vibrance+" 			then ChangeAdjustPanel("Vibrance","positiv")        
	elseif BefehlString == "Saturation+" 		then ChangeAdjustPanel("Saturation","positiv")        			
	elseif BefehlString == "HueRed+" 			then ChangeAdjustPanel("HueAdjustmentRed","positiv")        
	elseif BefehlString == "SatRed+" 			then ChangeAdjustPanel("SaturationAdjustmentRed","positiv")        
	elseif BefehlString == "LumRed+" 			then ChangeAdjustPanel("LuminanceAdjustmentRed","positiv")        
	elseif BefehlString == "HueOrange+" 		then ChangeAdjustPanel("HueAdjustmentOrange","positiv")        
	elseif BefehlString == "SatOrange+" 		then ChangeAdjustPanel("SaturationAdjustmentOrange","positiv")        
	elseif BefehlString == "LumOrange+" 		then ChangeAdjustPanel("LuminanceAdjustmentOrange","positiv")        
	elseif BefehlString == "HueYellow+" 		then ChangeAdjustPanel("HueAdjustmentYellow","positiv")        
	elseif BefehlString == "SatYellow+" 		then ChangeAdjustPanel("SaturationAdjustmentYellow","positiv")
	elseif BefehlString == "LumYellow+" 		then ChangeAdjustPanel("LuminanceAdjustmentYellow","positiv")
	elseif BefehlString == "HueGreen+" 			then ChangeAdjustPanel("HueAdjustmentGreen","positiv")
	elseif BefehlString == "SatGreen+" 			then ChangeAdjustPanel("SaturationAdjustmentGreen","positiv")
	elseif BefehlString == "LumGreen+" 			then ChangeAdjustPanel("LuminanceAdjustmentGreen","positiv")
	elseif BefehlString == "HueAqua+" 			then ChangeAdjustPanel("HueAdjustmentAqua","positiv")
	elseif BefehlString == "SatAqua+"			then ChangeAdjustPanel("SaturationAdjustmentAqua","positiv")
	elseif BefehlString == "LumAqua+" 			then ChangeAdjustPanel("LuminanceAdjustmentAqua","positiv")
	elseif BefehlString == "HueBlue+" 			then ChangeAdjustPanel("HueAdjustmentBlue","positiv")
	elseif BefehlString == "SatBlue+"			then ChangeAdjustPanel("SaturationAdjustmentBlue","positiv")
	elseif BefehlString == "LumBlue+" 			then ChangeAdjustPanel("LuminanceAdjustmentBlue","positiv")
	elseif BefehlString == "HuePurple+" 		then ChangeAdjustPanel("HueAdjustmentPurple","positiv")
	elseif BefehlString == "SatPurple+" 		then ChangeAdjustPanel("SaturationAdjustmentPurple","positiv")        
	elseif BefehlString == "LumPurple+" 		then ChangeAdjustPanel("LuminanceAdjustmentPurple","positiv")
	elseif BefehlString == "HueMagenta+" 		then ChangeAdjustPanel("HueAdjustmentMagenta","positiv")
	elseif BefehlString == "SatMagenta+" 		then ChangeAdjustPanel("SaturationAdjustmentMagenta","positiv")
	elseif BefehlString == "LumMagenta+" 		then ChangeAdjustPanel("LuminanceAdjustmentMagenta","positiv")
	
	elseif BefehlString == "Contrast-" 			then ChangeAdjustPanel("Contrast","negativ")        
	elseif BefehlString == "Shadows-" 			then ChangeAdjustPanel("Shadows","negativ")        
	elseif BefehlString == "Blacks-" 			then ChangeAdjustPanel("Blacks","negativ")        
	elseif BefehlString == "Whites-" 			then ChangeAdjustPanel("Whites","negativ")        
	elseif BefehlString == "Highligths-" 		then ChangeAdjustPanel("Highlights","negativ")        
	elseif BefehlString == "Exposure-" 			then ChangeExposure("Exposure","negativ")        
	elseif BefehlString == "Clarity-" 			then ChangeAdjustPanel("Clarity","negativ")        
	elseif BefehlString == "Vibrance-" 			then ChangeAdjustPanel("Vibrance","negativ")        
	elseif BefehlString == "Saturation-" 		then ChangeAdjustPanel("Saturation","negativ")        
	elseif BefehlString == "HueRed-" 			then ChangeAdjustPanel("HueAdjustmentRed","negativ")        
	elseif BefehlString == "SatRed-" 			then ChangeAdjustPanel("SaturationAdjustmentRed","negativ")        
	elseif BefehlString == "LumRed-" 			then ChangeAdjustPanel("LuminanceAdjustmentRed","negativ")        
	elseif BefehlString == "HueOrange-" 		then ChangeAdjustPanel("HueAdjustmentOrange","negativ")        
	elseif BefehlString == "SatOrange-" 		then ChangeAdjustPanel("SaturationAdjustmentOrange","negativ")        
	elseif BefehlString == "LumOrange-" 		then ChangeAdjustPanel("LuminanceAdjustmentOrange","negativ")        
	elseif BefehlString == "HueYellow-" 		then ChangeAdjustPanel("HueAdjustmentYellow","negativ")        
	elseif BefehlString == "SatYellow-" 		then ChangeAdjustPanel("SaturationAdjustmentYellow","negativ")
	elseif BefehlString == "LumYellow-" 		then ChangeAdjustPanel("LuminanceAdjustmentYellow","negativ")
	elseif BefehlString == "HueGreen-" 			then ChangeAdjustPanel("HueAdjustmentGreen","negativ")
	elseif BefehlString == "SatGreen-" 			then ChangeAdjustPanel("SaturationAdjustmentGreen","negativ")
	elseif BefehlString == "LumGreen-" 			then ChangeAdjustPanel("LuminanceAdjustmentGreen","negativ")
	elseif BefehlString == "HueAqua-" 			then ChangeAdjustPanel("HueAdjustmentAqua","negativ")
	elseif BefehlString == "SatAqua-"		 	then ChangeAdjustPanel("SaturationAdjustmentAqua","negativ")
	elseif BefehlString == "LumAqua-" 			then ChangeAdjustPanel("LuminanceAdjustmentAqua","negativ")
	elseif BefehlString == "HueBlue-" 			then ChangeAdjustPanel("HueAdjustmentBlue","negativ")
	elseif BefehlString == "SatBlue-" 			then ChangeAdjustPanel("SaturationAdjustmentBlue","negativ")
	elseif BefehlString == "LumBlue-" 			then ChangeAdjustPanel("LuminanceAdjustmentBlue","negativ")
	elseif BefehlString == "HuePurple-"			then ChangeAdjustPanel("HueAdjustmentPurple","negativ")
	elseif BefehlString == "SatPurple-" 		then ChangeAdjustPanel("SaturationAdjustmentPurple","negativ")        
	elseif BefehlString == "LumPurple-" 		then ChangeAdjustPanel("LuminanceAdjustmentPurple","negativ")
	elseif BefehlString == "HueMagenta-" 		then ChangeAdjustPanel("HueAdjustmentMagenta","negativ")
	elseif BefehlString == "SatMagenta-" 		then ChangeAdjustPanel("SaturationAdjustmentMagenta","negativ")
	elseif BefehlString == "LumMagenta-" 		then ChangeAdjustPanel("LuminanceAdjustmentMagenta","negativ")
	
	elseif BefehlString == "Contrast0" 			then ChangeAdjustPanel("Contrast","zero")        
	elseif BefehlString == "Shadows0" 			then ChangeAdjustPanel("Shadows","zero")        
	elseif BefehlString == "Blacks0" 			then ChangeAdjustPanel("Blacks","zero")        
	elseif BefehlString == "Whites0" 			then ChangeAdjustPanel("Whites","zero")        
	elseif BefehlString == "Highligths0" 		then ChangeAdjustPanel("Highlights","zero")        
	elseif BefehlString == "Exposure0" 			then ChangeExposure("Exposure","zero")        
	elseif BefehlString == "Clarity0" 			then ChangeAdjustPanel("Clarity","zero")        
	elseif BefehlString == "Vibrance0" 			then ChangeAdjustPanel("Vibrance","zero")        
	elseif BefehlString == "Saturation0" 		then ChangeAdjustPanel("Saturation","zero")        
	elseif BefehlString == "HueRed0" 			then ChangeAdjustPanel("HueAdjustmentRed","zero")        
	elseif BefehlString == "SatRed0" 			then ChangeAdjustPanel("SaturationAdjustmentRed","zero")        
	elseif BefehlString == "LumRed0" 			then ChangeAdjustPanel("LuminanceAdjustmentRed","zero")        
	elseif BefehlString == "HueOrange0" 		then ChangeAdjustPanel("HueAdjustmentOrange","zero")        
	elseif BefehlString == "SatOrange0" 		then ChangeAdjustPanel("SaturationAdjustmentOrange","zero")        
	elseif BefehlString == "LumOrange0" 		then ChangeAdjustPanel("LumOrangeLuminanceAdjustmentOrange","zero")        
	elseif BefehlString == "HueYellow0" 		then ChangeAdjustPanel("HueAdjustmentYellow","zero")        
	elseif BefehlString == "SatYellow0" 		then ChangeAdjustPanel("SaturationAdjustmentYellow","zero")
	elseif BefehlString == "LumYellow0" 		then ChangeAdjustPanel("LuminanceAdjustmentYellow","zero")
	elseif BefehlString == "HueGreen0" 			then ChangeAdjustPanel("HueAdjustmentGreen","zero")
	elseif BefehlString == "SatGreen0"			then ChangeAdjustPanel("SaturationAdjustmentGreen","zero")
	elseif BefehlString == "LumGreen0" 			then ChangeAdjustPanel("LuminanceAdjustmentGreen","zero")
	elseif BefehlString == "HueAqua0" 			then ChangeAdjustPanel("HueAdjustmentAqua","zero")
	elseif BefehlString == "SatAqua0" 			then ChangeAdjustPanel("SaturationAdjustmentAqua","zero")
	elseif BefehlString == "LumAqua0" 			then ChangeAdjustPanel("LuminanceAdjustmentAqua","zero")
	elseif BefehlString == "HueBlue0"			then ChangeAdjustPanel("HueAdjustmentBlue","zero")
	elseif BefehlString == "SatBlue0" 			then ChangeAdjustPanel("SaturationAdjustmentBlue","zero")
	elseif BefehlString == "LumBlue0" 			then ChangeAdjustPanel("LuminanceAdjustmentBlue","zero")
	elseif BefehlString == "HuePurple0"			then ChangeAdjustPanel("HueAdjustmentPurple","zero")
	elseif BefehlString == "SatPurple0" 		then ChangeAdjustPanel("SaturationAdjustmentPurple","zero")        
	elseif BefehlString == "LumPurple0" 		then ChangeAdjustPanel("LuminanceAdjustmentPurple",	"zero")
	elseif BefehlString == "HueMagenta0" 		then ChangeAdjustPanel("HueAdjustmentMagenta","zero")
	elseif BefehlString == "SatMagenta0" 		then ChangeAdjustPanel("SaturationAdjustmentMagenta","zero")
	elseif BefehlString == "LumMagenta0" 		then ChangeAdjustPanel("LuminanceAdjustmentMagenta","zero")  

	elseif BefehlString == "Hue" 		then ChangeLum()  
	elseif BefehlString == "Sat" 		then ChangeSat()  
	elseif BefehlString == "Lum" 		then ChangeLum()	

	elseif BefehlString == "Rate0" 		then LrSelection.setRating(0)  
	elseif BefehlString == "Rate1" 		then LrSelection.setRating(1)  
	elseif BefehlString == "Rate2" 		then LrSelection.setRating(2)  
	elseif BefehlString == "Rate3" 		then LrSelection.setRating(3) 
	elseif BefehlString == "Rate4" 		then LrSelection.setRating(4)
	elseif BefehlString == "Rate5" 		then LrSelection.setRating(5)
		
	elseif BefehlString == "Undo" 		then LrUndo.undo()    
	elseif BefehlString == "Redo" 		then LrUndo.redo()
		
	elseif BefehlString == "Right"		then LrSelection.nextPhoto()
	elseif BefehlString == "Left"		then LrSelection.previousPhoto()
	elseif BefehlString == "Up"			then LrSelection.selectFirstPhoto()
	elseif BefehlString == "Down"		then LrSelection.selectLastPhoto()

	elseif BefehlString == "Pick"		then LrSelection.nextPhoto()
	elseif BefehlString == "Zoom"		then LrApplicationView.toggleZoom()
	elseif BefehlString == "Full"		then switchToFullscreen()
	elseif BefehlString == "Bevor"		then LrApplicationView.showView("develop_before")
	elseif BefehlString == "Devel"		then LrApplicationView.switchToModule('develop')
		
	else    LrDialogs.message( "Das hat nicht geklappt", TestString, "info" )
	end

	

	----LrDialogs.showBezel( WertChar, 2 )

end

----------------- Execute Function  --------------- 
----------------- Match Function  -----------------

function MatchString(myString)
    
  
 local i = 0
 local BefehlsWert = {}

 
    for word in string.gmatch(myString, '([^:]+)') do
       BefehlsWert[i] = word
       i = i + 1
    end
	
	
    BefehlString = BefehlsWert[0]
    WertString = BefehlsWert[1]
	----LrDialogs.message( BefehlString, myString, "info" )
	----LrDialogs.message( WertString, myString, "info" )
	
    return "Done"
    
end

----------------- Match Function  -----------------
----------------- Test Function  ------------------

function TestFunction(TestString)

	LrDialogs.message( TestString, "Das hat geklappt", "info" )
	--if message =="Test+" then LrDevelopController.increment ( "Exposure" ) end

end
----------------- Test Function  ------------------
-------------- ASCIItoChar Function  --------------

function ASCIItoChar(WertASCII)
	
	local i = 1
	local q = 1
	local post = 0
	local value = {}
	local ASCIINumber = {}
	local CharNumber = {}
	
	  WertChar = 0;

	  for zaehler = 1,string.len(WertASCII),1 do
		value[i] = string.match(WertASCII, '%d', i)
		ASCIINumber[i] = string.byte(value[i]) - 48
		i = i + 1
	  end
	  
	  for zaehler = 1,(i-1),1 do
		if       ASCIINumber[q] == 0 then post = 0*10^(i-q-1)
		elseif   ASCIINumber[q] == 1 then post = 1*10^(i-q-1)
		elseif   ASCIINumber[q] == 2 then post = 2*10^(i-q-1)
		elseif   ASCIINumber[q] == 3 then post = 3*10^(i-q-1)
		elseif   ASCIINumber[q] == 4 then post = 4*10^(i-q-1)
		elseif   ASCIINumber[q] == 5 then post = 5*10^(i-q-1)
		elseif   ASCIINumber[q] == 6 then post = 6*10^(i-q-1)
		elseif   ASCIINumber[q] == 7 then post = 7*10^(i-q-1)
		elseif   ASCIINumber[q] == 8 then post = 8*10^(i-q-1)
		else     post = 9*10^(i-q-1)
		end
		CharNumber[q] = post
		WertChar = WertChar + CharNumber[q]
		q = q + 1
	  end

end
	
-------------- ASCIItoChar Function  --------------
-- Receiver Socket Task
--
LrTasks.startAsyncTask( 
	function() LrFunctionContext.callWithContext( 'socket_remote', 
		function( context )
		
		local running = true
		
			local receiver = LrSocket.bind 
			{
				functionContext = context,
				port = 4242,
				plugin = _PLUGIN,
				mode = "receive",
				
				--Funktion OnConnecting()
				onConnecting = function( socket, port )
				-- TODO
				end,
				
				--Funktion OnConnect()
				onConnected = function( socket, port ) 
					LrDialogs.message( "Connection established Vers.:44", "4242", "info" )
				end,
				
				--Funktion OnMessage()
				onMessage = function( socket, message )
					
					MatchString(message)
					ASCIItoChar(WertString)
					---TestFunction("Bis ASCIItoChar")
					---TestFunction(BefehlString)
					---TestFunction(WertString)
					---TestFunction("Bis Switch Modul")
					ExecuteFunction()
					---TestFunction("Bis Execute Function")
					LrDialogs.showBezel( BefehlString, 2 )
					---TestFunction("Bis Bezel")


					--LrDialogs.message( "Text", "4242", "info" )
					--if message =="+" then LrDevelopController.increment ( "Exposure" ) end
					--if message =="-" then LrDevelopController.decrement ( "Exposure" ) end	
				end,
				
				--Funktion OnClosed()
				onClosed = function( socket )
					--running = false
					socket:reconnect()
				end,
				
				--Funktion OnError()
				onError = function( socket, err )
					if err == "timeout" then
						socket:reconnect()
					end
				end,
			}

		while running do
			LrTasks.sleep( 1/3 ) -- seconds0
		end
		LrDialogs.message( "Endlosschlaufe beendet (Socket Task)", "", "info" )
		receiver:close()
	end 
	)
end 
)







--Sender Socket Task
--
--LrTasks.startAsyncTask( 
--	function() LrFunctionContext.callWithContext( 'socket_remote', 
--		function( context )
--		
--		local running = true
--		local connected = false
--		
--			local sender = LrSocket.bind 
--			{
--				functionContext = context,
--				port = 4243,
--				plugin = _PLUGIN,
--				mode = "send",
--				
--				--Funktion OnConnecting()
--				onConnecting = function( socket, port )
--				-- TODO
--				end,
--				
--				--Funktion OnConnect()
--				onConnected = function( socket, port ) 
--					LrDialogs.message( "Connection established", "4243", "info" )
--					connected = true;
--				end,
--				
--				--Funktion OnMessage()
--				onMessage = function( socket, message )
--					
--					--LrDialogs.message( "Text", "4242", "info" )
--					--if message =="+" then LrDevelopController.increment ( "Exposure" ) end
--					--if message =="-" then LrDevelopController.decrement ( "Exposure" ) end	
--				end,
--				
--				--Funktion OnClosed()
--				onClosed = function( socket )
--					--running = false
--					socket:reconnect()
--				end,
--				
--				--Funktion OnError()
--				onError = function( socket, err )
--					if err == "timeout" then
--						socket:reconnect()
--					end
--				end,
--			}
--
--		while running do
--			LrTasks.sleep( 1 ) -- seconds
--			if connected == true then sender.send("gugus") end
--		end
--		LrDialogs.message( "Endlosschlaufe beendet (Socket Task)", "", "info" )
--		sender:close()
--	end 
--	)
--end 
--)