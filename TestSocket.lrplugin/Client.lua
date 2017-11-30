local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'
local LrDevelopController = import 'LrDevelopController'
local LrApplicationView   = import 'LrApplicationView'

----------------- Global Variabel  ----------------
WertString    	= "NIL"
BefehlString  	= "NIL"
WertChar 		= 0 
----------------- Global Variabel  ----------------
----------- ChangeAdjustPanel Function  -----------

function ChangeAdjustPanel(Groesse,Richtung)

	local valueDevelopt = 0

	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel(Groesse)		-- Pop Up Menü

	valueDevelopt = LrDevelopController.getValue(Groesse); 
	if     	Richtung == "positiv" then valueDevelopt = valueDevelopt + WertChar;                             
	elseif 	Richtung == "negativ" then valueDevelopt = valueDevelopt - WertChar;
	elseif	Richtung == "zero"	 then valueDevelopt = 0;
	else	LrDialogs.message( "Das hat nicht geklappt", "ChangeAdjustPanel", "info" )
	end	   
	LrDevelopController.setValue(Groesse,valueDevelopt);
	
	
	LrDialogs.message( "Das hat geklappt", "ChangeAdjustPanel", "info" )

end

----------- ChangeAdjustPanel Function  -----------
----------------- Execute Function  ---------------

function ExecuteFunction()

	local valueDevelopt
	
    -- Fakultaet(message)
	if     BefehlString == "Contrast+" 			then ChangeAdjustPanel("Contrast","positiv")                            
	elseif BefehlString == "Shadows+" 			then ChangeAdjustPanel("Shadows",WertChar)        
	elseif BefehlString == "Whites+" 			then ChangeAdjustPanel("Whites",WertChar)        
	elseif BefehlString == "Blacks+" 			then ChangeAdjustPanel("Blacks",WertChar)        
	elseif BefehlString == "Highligths+" 		then ChangeAdjustPanel("Highlights",WertChar)        
	elseif BefehlString == "Exposure+" 			then ChangeAdjustPanel("Exposure",WertChar)        
	elseif BefehlString == "Clarity+" 			then ChangeAdjustPanel("Clarity",WertChar)        
	elseif BefehlString == "Vibrance+" 			then ChangeAdjustPanel("Vibrance",WertChar)        
	elseif BefehlString == "Saturation+" 		then ChangeAdjustPanel("Saturation",WertChar)        			
	elseif BefehlString == "HueRed+" 			then ChangeAdjustPanel("HueRed",WertChar)        
	elseif BefehlString == "SatRed+" 			then ChangeAdjustPanel("SatRed",WertChar)        
	elseif BefehlString == "LumRed+" 			then ChangeAdjustPanel("LumRed",WertChar)        
	elseif BefehlString == "HueOrange+" 		then ChangeAdjustPanel("HueOrange",WertChar)        
	elseif BefehlString == "SatOrange+" 		then ChangeAdjustPanel("SatOrange",WertChar)        
	elseif BefehlString == "LumOrange+" 		then ChangeAdjustPanel("LumOrange",WertChar)        
	elseif BefehlString == "HueYellow+" 		then ChangeAdjustPanel("HueYellow",WertChar)        
	elseif BefehlString == "SatYellow+" 		then ChangeAdjustPanel("SatYellow",WertChar)
	elseif BefehlString == "LumYellow+" 		then ChangeAdjustPanel("LumYellow",WertChar)
	elseif BefehlString == "HueGreen+" 			then ChangeAdjustPanel("HueGreen",WertChar)
	elseif BefehlString == "SatGreen+" 			then ChangeAdjustPanel("SatGreen",WertChar)
	elseif BefehlString == "LumGreen+" 			then ChangeAdjustPanel("LumGreen",WertChar)
	elseif BefehlString == "HueAqua+" 			then ChangeAdjustPanel("HueAqua",WertChar)
	elseif BefehlString == "SatAqua+"			then ChangeAdjustPanel("SatAqua",WertChar)
	elseif BefehlString == "LumAqua+" 			then ChangeAdjustPanel("LumAqua",WertChar)
	elseif BefehlString == "HueBlue+" 			then ChangeAdjustPanel("HueBlue",WertChar)
	elseif BefehlString == "SatBlue+"			then ChangeAdjustPanel("SatBlue",WertChar)
	elseif BefehlString == "LumBlue+" 			then ChangeAdjustPanel("LumBlue",WertChar)
	elseif BefehlString == "HuePurple+" 		then ChangeAdjustPanel("HuePurple",WertChar)
	elseif BefehlString == "SatPurple+" 		then ChangeAdjustPanel("SatPurple",WertChar)        
	elseif BefehlString == "LumPurple+" 		then ChangeAdjustPanel("LumPurple",WertChar)
	elseif BefehlString == "HueMagenta+" 		then ChangeAdjustPanel("HueMagenta",WertChar)
	elseif BefehlString == "SatMagenta+" 		then ChangeAdjustPanel("SatMagenta",WertChar)
	elseif BefehlString == "LumMagenta+" 		then ChangeAdjustPanel("LumMagenta",WertChar)
	
	elseif BefehlString == "Contrast-" 			then ChangeAdjustPanel("Contrast",WertChar)        
	elseif BefehlString == "Shadows-" 			then ChangeAdjustPanel("Shadows",WertChar)        
	elseif BefehlString == "Blacks-" 			then ChangeAdjustPanel("Blacks",WertChar)        
	elseif BefehlString == "Whites-" 			then ChangeAdjustPanel("Whites",WertChar)        
	elseif BefehlString == "Highligths-" 		then ChangeAdjustPanel("Highlights",WertChar)        
	elseif BefehlString == "Exposure-" 			then ChangeAdjustPanel("Exposure",WertChar)        
	elseif BefehlString == "Clarity-" 			then ChangeAdjustPanel("Clarity",WertChar)        
	elseif BefehlString == "Vibrance-" 			then ChangeAdjustPanel("Vibrance",WertChar)        
	elseif BefehlString == "Saturation-" 		then ChangeAdjustPanel("Saturation",WertChar)        
	elseif BefehlString == "HueRed-" 			then ChangeAdjustPanel("HueRed",WertChar)        
	elseif BefehlString == "SatRed-" 			then ChangeAdjustPanel("SatRed",WertChar)        
	elseif BefehlString == "LumRed-" 			then ChangeAdjustPanel("LumRed",WertChar)        
	elseif BefehlString == "HueOrange-" 		then ChangeAdjustPanel("HueOrange",WertChar)        
	elseif BefehlString == "SatOrange-" 		then ChangeAdjustPanel("SatOrange",WertChar)        
	elseif BefehlString == "LumOrange-" 		then ChangeAdjustPanel("LumOrange",WertChar)        
	elseif BefehlString == "HueYellow-" 		then ChangeAdjustPanel("HueYellow",WertChar)        
	elseif BefehlString == "SatYellow-" 		then ChangeAdjustPanel("SatYellow",WertChar)
	elseif BefehlString == "LumYellow-" 		then ChangeAdjustPanel("LumYellow",WertChar)
	elseif BefehlString == "HueGreen-" 			then ChangeAdjustPanel("HueGreen",WertChar)
	elseif BefehlString == "SatGreen-" 			then ChangeAdjustPanel("SatGreen",WertChar)
	elseif BefehlString == "LumGreen-" 			then ChangeAdjustPanel("LumGreen",WertChar)
	elseif BefehlString == "HueAqua-" 			then ChangeAdjustPanel("HueAqua",WertChar)
	elseif BefehlString == "SatAqua-"		 	then ChangeAdjustPanel("SatAqua",WertChar)
	elseif BefehlString == "LumAqua-" 			then ChangeAdjustPanel("LumAqua",WertChar)
	elseif BefehlString == "HueBlue-" 			then ChangeAdjustPanel("HueBlue",WertChar)
	elseif BefehlString == "SatBlue-" 			then ChangeAdjustPanel("SatBlue",WertChar)
	elseif BefehlString == "LumBlue-" 			then ChangeAdjustPanel("LumBlue",WertChar)
	elseif BefehlString == "HuePurple-"			then ChangeAdjustPanel("HuePurple",WertChar)
	elseif BefehlString == "SatPurple-" 		then ChangeAdjustPanel("SatPurple",WertChar)        
	elseif BefehlString == "LumPurple-" 		then ChangeAdjustPanel("LumPurple",WertChar)
	elseif BefehlString == "HueMagenta-" 		then ChangeAdjustPanel("HueMagenta",WertChar)
	elseif BefehlString == "SatMagenta-" 		then ChangeAdjustPanel("SatMagenta",WertChar)
	elseif BefehlString == "LumMagenta-" 		then ChangeAdjustPanel("LumMagenta",WertChar)
	
	elseif BefehlString == "Contrast0" 			then ChangeAdjustPanel("Contrast",0)        
	elseif BefehlString == "Shadows0" 			then ChangeAdjustPanel("Shadows",0)        
	elseif BefehlString == "Blacks0" 			then ChangeAdjustPanel("Blacks",0)        
	elseif BefehlString == "Whites0" 			then ChangeAdjustPanel("Whites",0)        
	elseif BefehlString == "Highligths0" 		then ChangeAdjustPanel("Highlights",0)        
	elseif BefehlString == "Exposure0" 			then ChangeAdjustPanel("Exposure",0)        
	elseif BefehlString == "Clarity0" 			then ChangeAdjustPanel("Clarity",0)        
	elseif BefehlString == "Vibrance0" 			then ChangeAdjustPanel("Vibrance",0)        
	elseif BefehlString == "Saturation0" 		then ChangeAdjustPanel("Saturation",0)        
	elseif BefehlString == "HueRed0" 			then ChangeAdjustPanel("HueRed",0)        
	elseif BefehlString == "SatRed0" 			then ChangeAdjustPanel("SatRed",0)        
	elseif BefehlString == "LumRed0" 			then ChangeAdjustPanel("LumRed",0)        
	elseif BefehlString == "HueOrange0" 		then ChangeAdjustPanel("HueOrange",0)        
	elseif BefehlString == "SatOrange0" 		then ChangeAdjustPanel("SatOrange",0)        
	elseif BefehlString == "LumOrange0" 		then ChangeAdjustPanel("LumOrange",0)        
	elseif BefehlString == "HueYellow0" 		then ChangeAdjustPanel("HueYellow",0)        
	elseif BefehlString == "SatYellow0" 		then ChangeAdjustPanel("SatYellow",0)
	elseif BefehlString == "LumYellow0" 		then ChangeAdjustPanel("LumYellow",0)
	elseif BefehlString == "HueGreen0" 			then ChangeAdjustPanel("HueGreen",0)
	elseif BefehlString == "SatGreen0"			then ChangeAdjustPanel("SatGreen",0)
	elseif BefehlString == "LumGreen0" 			then ChangeAdjustPanel("LumGreen",0)
	elseif BefehlString == "HueAqua0" 			then ChangeAdjustPanel("HueAqua",0)
	elseif BefehlString == "SatAqua0" 			then ChangeAdjustPanel("SatAqua",0)
	elseif BefehlString == "LumAqua0" 			then ChangeAdjustPanel("LumAqua",0)
	elseif BefehlString == "HueBlue0"			then ChangeAdjustPanel("HueBlue",0)
	elseif BefehlString == "SatBlue0" 			then ChangeAdjustPanel("SatBlue",0)
	elseif BefehlString == "LumBlue0" 			then ChangeAdjustPanel("LumBlue",0)
	elseif BefehlString == "HuePurple0"			then ChangeAdjustPanel("HuePurple",0)
	elseif BefehlString == "SatPurple0" 		then ChangeAdjustPanel("SatPurple",0)        
	elseif BefehlString == "LumPurple0" 		then ChangeAdjustPanel("LumPurple",	0)
	elseif BefehlString == "HueMagenta0" 		then ChangeAdjustPanel("HueMagenta",0)
	elseif BefehlString == "SatMagenta0" 		then ChangeAdjustPanel("SatMagenta",0)
	elseif BefehlString == "LumMagenta0" 		then ChangeAdjustPanel("LumMagenta",0)  

	elseif BefehlString == "Rate0" 		then LrSelection.setRating(0)  
	elseif BefehlString == "Rate1" 		then LrSelection.setRating(1)  
	elseif BefehlString == "Rate2" 		then LrSelection.setRating(2)  
	elseif BefehlString == "Rate3" 		then LrSelection.setRating(3) 
	elseif BefehlString == "Rate4" 		then LrSelection.setRating(4)
	elseif BefehlString == "Rate5" 		then LrSelection.setRating(5)    
    
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
					LrDialogs.message( "Connection established Vers.:30", "4242", "info" )
				end,
				
				--Funktion OnMessage()
				onMessage = function( socket, message )
					
					MatchString(message)
					ASCIItoChar(WertString)
					TestFunction("Bis ASCIItoChar")
					TestFunction(BefehlString)
					TestFunction(WertString)
					LrApplicationView.switchToModule('develop')
					TestFunction("Bis Switch Modul")
					ExecuteFunction()
					TestFunction("Bis Execute Function")
					LrDialogs.showBezel( BefehlString, 2 )
					TestFunction("Bis Bezel")


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