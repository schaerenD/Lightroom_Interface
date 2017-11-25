local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'

local LrDevelopController = import 'LrDevelopController'

----------------- Global Variabel  ----------------
Wert    = "NIL"
Befehl  = "NIL" 
----------------- Global Variabel  ----------------
----------------- Execute Function  ---------------

function ExecuteFunction(myString)
	
	--TEST Umgebung
	if     Befehl == "Contrast+" 	then LrDevelopController.increment("Contrast",Wert)                              
	elseif Befehl == "Shadows+" 	then LrDevelopController.increment("Shadows",Wert)        
	elseif Befehl == "Whites+" 		then LrDevelopController.increment("Whites",Wert)        
	elseif Befehl == "Blacks+" 		then LrDevelopController.increment("Blacks",Wert)        
	else 	Befehl == "Highligths+" 	then LrDevelopController.increment("Highlights",Wert)
	
	
	--[[
    -- Fakultaet(message)
	if     Befehl == "Contrast+" 	then LrDevelopController.increment("Contrast",Wert)                              
	elseif Befehl == "Shadows+" 	then LrDevelopController.increment("Shadows",Wert)        
	elseif Befehl == "Whites+" 		then LrDevelopController.increment("Whites",Wert)        
	elseif Befehl == "Blacks+" 		then LrDevelopController.increment("Blacks",Wert)        
	elseif Befehl == "Highligths+" 	then LrDevelopController.increment("Highlights",Wert)        
	elseif Befehl == "Exposure+" 	then LrDevelopController.increment("Exposure",Wert)        
	elseif Befehl == "Clarity+" 	then LrDevelopController.increment("Clarity",Wert)        
	elseif Befehl == "Vibrance+" 	then LrDevelopController.increment("Vibrance",Wert)        
	elseif Befehl == "Saturation+" 	then LrDevelopController.increment("Saturation",Wert)        
	elseif Befehl == "HueRed+" 		then LrDevelopController.increment("HueRed",Wert)        
	elseif Befehl == "SatRed+" 		then LrDevelopController.increment("SatRed",Wert)        
	elseif Befehl == "LumRed+" 		then LrDevelopController.increment("LumRed",Wert)        
	elseif Befehl == "HueOrange+" 	then LrDevelopController.increment("HueOrange",Wert)        
	elseif Befehl == "SatOrange+" 	then LrDevelopController.increment("SatOrange",Wert)        
	elseif Befehl == "LumOrange+" 	then LrDevelopController.increment("LumOrange",Wert)        
	elseif Befehl == "HueYellow+" 	then LrDevelopController.increment("HueYellow",Wert)        
	elseif Befehl == "SatYellow+" 	then LrDevelopController.increment("SatYellow",Wert)
	elseif Befehl == "LumYellow+" 	then LrDevelopController.increment("LumYellow",Wert)
	elseif Befehl == "HueGreen+" 	then LrDevelopController.increment("HueGreen",Wert)
	elseif Befehl == "SatGreen+" 	then LrDevelopController.increment("SatGreen",Wert)
	elseif Befehl == "LumGreen+" 	then LrDevelopController.increment("LumGreen",Wert)
	elseif Befehl == "HueAqua+" 	then LrDevelopController.increment("HueAqua",Wert)
	elseif Befehl == "SatAqua+"		then LrDevelopController.increment("SatAqua",Wert)
	elseif Befehl == "LumAqua+" 	then LrDevelopController.increment("LumAqua",Wert)
	elseif Befehl == "HueBlue+" 	then LrDevelopController.increment("HueBlue",Wert)
	elseif Befehl == "SatBlue+"		then LrDevelopController.increment("SatBlue",Wert)
	elseif Befehl == "LumBlue+" 	then LrDevelopController.increment("LumBlue",Wert)
	elseif Befehl == "HuePurple+" 	then LrDevelopController.increment("HuePurple",Wert)
	elseif Befehl == "SatPurple+" 	then LrDevelopController.increment("SatPurple",Wert)        
	elseif Befehl == "LumPurple+" 	then LrDevelopController.increment("LumPurple",Wert)
	elseif Befehl == "HueMagenta+" 	then LrDevelopController.increment("HueMagenta",Wert)
	elseif Befehl == "SatMagenta+" 	then LrDevelopController.increment("SatMagenta",Wert)
	elseif Befehl == "LumMagenta+" 	then LrDevelopController.increment("LumMagenta",Wert)
	
	elseif Befehl == "Contrast-" 	then LrDevelopController.decrement("Contrast",Wert)        
	elseif Befehl == "Shadows-" 	then LrDevelopController.decrement("Shadows",Wert)        
	elseif Befehl == "Blacks-" 		then LrDevelopController.decrement("Blacks",Wert)        
	elseif Befehl == "Whites-" 		then LrDevelopController.decrement("Whites",Wert)        
	elseif Befehl == "Highligths-" 	then LrDevelopController.decrement("Highlights",Wert)        
	elseif Befehl == "Exposure-" 	then LrDevelopController.decrement("Exposure",Wert)        
	elseif Befehl == "Clarity-" 	then LrDevelopController.decrement("Clarity",Wert)        
	elseif Befehl == "Vibrance-" 	then LrDevelopController.decrement("Vibrance",Wert)        
	elseif Befehl == "Saturation-" 	then LrDevelopController.decrement("Saturation",Wert)        
	elseif Befehl == "HueRed-" 		then LrDevelopController.decrement("HueRed",Wert)        
	elseif Befehl == "SatRed-" 		then LrDevelopController.decrement("SatRed",Wert)        
	elseif Befehl == "LumRed-" 		then LrDevelopController.decrement("LumRed",Wert)        
	elseif Befehl == "HueOrange-" 	then LrDevelopController.decrement("HueOrange",Wert)        
	elseif Befehl == "SatOrange-" 	then LrDevelopController.decrement("SatOrange",Wert)        
	elseif Befehl == "LumOrange-" 	then LrDevelopController.decrement("LumOrange",Wert)        
	elseif Befehl == "HueYellow-" 	then LrDevelopController.decrement("HueYellow",Wert)        
	elseif Befehl == "SatYellow-" 	then LrDevelopController.decrement("SatYellow",Wert)
	elseif Befehl == "LumYellow-" 	then LrDevelopController.decrement("LumYellow",Wert)
	elseif Befehl == "HueGreen-" 	then LrDevelopController.decrement("HueGreen",Wert)
	elseif Befehl == "SatGreen-" 	then LrDevelopController.decrement("SatGreen",Wert)
	elseif Befehl == "LumGreen-" 	then LrDevelopController.decrement("LumGreen",Wert)
	elseif Befehl == "HueAqua-" 	then LrDevelopController.decrement("HueAqua",Wert)
	elseif Befehl == "SatAqua-" 	then LrDevelopController.decrement("SatAqua",Wert)
	elseif Befehl == "LumAqua-" 	then LrDevelopController.decrement("LumAqua",Wert)
	elseif Befehl == "HueBlue-" 	then LrDevelopController.decrement("HueBlue",Wert)
	elseif Befehl == "SatBlue-" 	then LrDevelopController.decrement("SatBlue",Wert)
	elseif Befehl == "LumBlue-" 	then LrDevelopController.decrement("LumBlue",Wert)
	elseif Befehl == "HuePurple-"	then LrDevelopController.decrement("HuePurple",Wert)
	elseif Befehl == "SatPurple-" 	then LrDevelopController.decrement("SatPurple",Wert)        
	elseif Befehl == "LumPurple-" 	then LrDevelopController.decrement("LumPurple",Wert)
	elseif Befehl == "HueMagenta-" 	then LrDevelopController.decrement("HueMagenta",Wert)
	elseif Befehl == "SatMagenta-" 	then LrDevelopController.decrement("SatMagenta",Wert)
	elseif Befehl == "LumMagenta-" 	then LrDevelopController.decrement("LumMagenta",Wert)
	
	elseif Befehl == "Contrast0" 	then LrDevelopController.setValue("Contrast",0)        
	elseif Befehl == "Shadows0" 	then LrDevelopController.setValue("Shadows",0)        
	elseif Befehl == "Blacks0" 		then LrDevelopController.setValue("Blacks",0)        
	elseif Befehl == "Whites0" 		then LrDevelopController.setValue("Whites",0)        
	elseif Befehl == "Highligths0" 	then LrDevelopController.setValue("Highlights",0)        
	elseif Befehl == "Exposure0" 	then LrDevelopController.setValue("Exposure",0)        
	elseif Befehl == "Clarity0" 	then LrDevelopController.setValue("Clarity",0)        
	elseif Befehl == "Vibrance0" 	then LrDevelopController.setValue("Vibrance",0)        
	elseif Befehl == "Saturation0" 	then LrDevelopController.setValue("Saturation",0)        
	elseif Befehl == "HueRed0" 		then LrDevelopController.setValue("HueRed",0)        
	elseif Befehl == "SatRed0" 		then LrDevelopController.setValue("SatRed",0)        
	elseif Befehl == "LumRed0" 		then LrDevelopController.setValue("LumRed",0)        
	elseif Befehl == "HueOrange0" 	then LrDevelopController.setValue("HueOrange",0)        
	elseif Befehl == "SatOrange0" 	then LrDevelopController.setValue("SatOrange",0)        
	elseif Befehl == "LumOrange0" 	then LrDevelopController.setValue("LumOrange",0)        
	elseif Befehl == "HueYellow0" 	then LrDevelopController.setValue("HueYellow",0)        
	elseif Befehl == "SatYellow0" 	then LrDevelopController.setValue("SatYellow",0)
	elseif Befehl == "LumYellow0" 	then LrDevelopController.setValue("LumYellow",0)
	elseif Befehl == "HueGreen0" 	then LrDevelopController.setValue("HueGreen",0)
	elseif Befehl == "SatGreen0"	then LrDevelopController.setValue("SatGreen",0)
	elseif Befehl == "LumGreen0" 	then LrDevelopController.setValue("LumGreen",0)
	elseif Befehl == "HueAqua0" 	then LrDevelopController.setValue("HueAqua",0)
	elseif Befehl == "SatAqua0" 	then LrDevelopController.setValue("SatAqua",0)
	elseif Befehl == "LumAqua0" 	then LrDevelopController.setValue("LumAqua",0)
	elseif Befehl == "HueBlue0"		then LrDevelopController.setValue("HueBlue",0)
	elseif Befehl == "SatBlue0" 	then LrDevelopController.setValue("SatBlue",0)
	elseif Befehl == "LumBlue0" 	then LrDevelopController.setValue("LumBlue",0)
	elseif Befehl == "HuePurple0"	then LrDevelopController.setValue("HuePurple",0)
	elseif Befehl == "SatPurple0" 	then LrDevelopController.setValue("SatPurple",0)        
	elseif Befehl == "LumPurple0" 	then LrDevelopController.setValue("LumPurple",	0)
	elseif Befehl == "HueMagenta0" 	then LrDevelopController.setValue("HueMagenta",	0)
	elseif Befehl == "SatMagenta0" 	then LrDevelopController.setValue("SatMagenta",	0)
	elseif Befehl == "LumMagenta0" 	then LrDevelopController.setValue("LumMagenta",0)  

	elseif Befehl == "Rate1" 		then LrSelection.setRating()  
	elseif Befehl == "Rate2" 		then LrSelection.setRating()  
	elseif Befehl == "Rate3" 		then LrSelection.setRating()  
	elseif Befehl == "Rate4" 		then LrSelection.setRating() 
	elseif Befehl == "Rate5" 		then LrSelection.setRating()  
    
	else    print("Kein Befehl erkannt")
	end

end
]]
----------------- Execute Function  ---------------
----------------- Match Function  -----------------

function MatchString(myString)
    
  
 local i = 0
 local BefehlsWert = {}

 
    for word in string.gmatch(myString, '([^:]+)') do
       BefehlsWert[i] = word
       i = i + 1
    end
    
    Befehl = BefehlsWert[0]
    Wert = BefehlsWert[1]
    
    return "Done"
    
end

----------------- Match Function  -----------------
----------------- Test Function  ------------------

function TestFunction(TestString)

	LrDialogs.message( "Das hat geklappt", TestString, "info" )
	--if message =="Test+" then LrDevelopController.increment ( "Exposure" ) end

end
----------------- Test Function  ------------------

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
					LrDialogs.message( "Connection established", "4242", "info" )
				end,
				
				--Funktion OnMessage()
				onMessage = function( socket, message )
					
					MatchString(message)
					TestFunction(Wert)
					TestFunction(Befehl)

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
			LrTasks.sleep( 1/3 ) -- seconds
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
