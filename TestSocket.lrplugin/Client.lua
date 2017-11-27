local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'

local LrDevelopController = import 'LrDevelopController'

----------------- Global Variabel  ----------------
WertString    	= "NIL"
BefehlString  	= "NIL"
WertChar 		= 0 
----------------- Global Variabel  ----------------
----------------- Execute Function  ---------------

function ExecuteFunction()
	
    -- Fakultaet(message)
	if     BefehlString == "Contrast+" 			then LrApplicationView.switchToModule('develop') LrDevelopController.increment("Contrast",4)                              
	elseif BefehlString == "Shadows+" 			then LrDevelopController.increment("Shadows",WertChar)        
	elseif BefehlString == "Whites+" 			then LrDevelopController.increment("Whites",WertChar)        
	elseif BefehlString == "Blacks+" 			then LrDevelopController.increment("Blacks",WertChar)        
	elseif BefehlString == "Highligths+" 		then LrDevelopController.increment("Highlights",WertChar)        
	elseif BefehlString == "Exposure+" 			then LrDevelopController.increment("Exposure",WertChar)        
	elseif BefehlString == "Clarity+" 			then LrDevelopController.increment("Clarity",WertChar)        
	elseif BefehlString == "Vibrance+" 			then LrDevelopController.increment("Vibrance",WertChar)        
	elseif BefehlString == "Saturation+" 		then LrDevelopController.increment("Saturation",WertChar)        			
	elseif BefehlString == "HueRed+" 			then LrDevelopController.increment("HueRed",WertChar)        
	elseif BefehlString == "SatRed+" 			then LrDevelopController.increment("SatRed",WertChar)        
	elseif BefehlString == "LumRed+" 			then LrDevelopController.increment("LumRed",WertChar)        
	elseif BefehlString == "HueOrange+" 		then LrDevelopController.increment("HueOrange",WertChar)        
	elseif BefehlString == "SatOrange+" 		then LrDevelopController.increment("SatOrange",WertChar)        
	elseif BefehlString == "LumOrange+" 		then LrDevelopController.increment("LumOrange",WertChar)        
	elseif BefehlString == "HueYellow+" 		then LrDevelopController.increment("HueYellow",WertChar)        
	elseif BefehlString == "SatYellow+" 		then LrDevelopController.increment("SatYellow",WertChar)
	elseif BefehlString == "LumYellow+" 		then LrDevelopController.increment("LumYellow",WertChar)
	elseif BefehlString == "HueGreen+" 			then LrDevelopController.increment("HueGreen",WertChar)
	elseif BefehlString == "SatGreen+" 			then LrDevelopController.increment("SatGreen",WertChar)
	elseif BefehlString == "LumGreen+" 			then LrDevelopController.increment("LumGreen",WertChar)
	elseif BefehlString == "HueAqua+" 			then LrDevelopController.increment("HueAqua",WertChar)
	elseif BefehlString == "SatAqua+"			then LrDevelopController.increment("SatAqua",WertChar)
	elseif BefehlString == "LumAqua+" 			then LrDevelopController.increment("LumAqua",WertChar)
	elseif BefehlString == "HueBlue+" 			then LrDevelopController.increment("HueBlue",WertChar)
	elseif BefehlString == "SatBlue+"			then LrDevelopController.increment("SatBlue",WertChar)
	elseif BefehlString == "LumBlue+" 			then LrDevelopController.increment("LumBlue",WertChar)
	elseif BefehlString == "HuePurple+" 		then LrDevelopController.increment("HuePurple",WertChar)
	elseif BefehlString == "SatPurple+" 		then LrDevelopController.increment("SatPurple",WertChar)        
	elseif BefehlString == "LumPurple+" 		then LrDevelopController.increment("LumPurple",WertChar)
	elseif BefehlString == "HueMagenta+" 		then LrDevelopController.increment("HueMagenta",WertChar)
	elseif BefehlString == "SatMagenta+" 		then LrDevelopController.increment("SatMagenta",WertChar)
	elseif BefehlString == "LumMagenta+" 		then LrDevelopController.increment("LumMagenta",WertChar)
	
	elseif BefehlString == "Contrast-" 			then LrDevelopController.decrement("Contrast",WertChar)        
	elseif BefehlString == "Shadows-" 			then LrDevelopController.decrement("Shadows",WertChar)        
	elseif BefehlString == "Blacks-" 			then LrDevelopController.decrement("Blacks",WertChar)        
	elseif BefehlString == "Whites-" 			then LrDevelopController.decrement("Whites",WertChar)        
	elseif BefehlString == "Highligths-" 		then LrDevelopController.decrement("Highlights",WertChar)        
	elseif BefehlString == "Exposure-" 			then LrDevelopController.decrement("Exposure",WertChar)        
	elseif BefehlString == "Clarity-" 			then LrDevelopController.decrement("Clarity",WertChar)        
	elseif BefehlString == "Vibrance-" 			then LrDevelopController.decrement("Vibrance",WertChar)        
	elseif BefehlString == "Saturation-" 		then LrDevelopController.decrement("Saturation",WertChar)        
	elseif BefehlString == "HueRed-" 			then LrDevelopController.decrement("HueRed",WertChar)        
	elseif BefehlString == "SatRed-" 			then LrDevelopController.decrement("SatRed",WertChar)        
	elseif BefehlString == "LumRed-" 			then LrDevelopController.decrement("LumRed",WertChar)        
	elseif BefehlString == "HueOrange-" 		then LrDevelopController.decrement("HueOrange",WertChar)        
	elseif BefehlString == "SatOrange-" 		then LrDevelopController.decrement("SatOrange",WertChar)        
	elseif BefehlString == "LumOrange-" 		then LrDevelopController.decrement("LumOrange",WertChar)        
	elseif BefehlString == "HueYellow-" 		then LrDevelopController.decrement("HueYellow",WertChar)        
	elseif BefehlString == "SatYellow-" 		then LrDevelopController.decrement("SatYellow",WertChar)
	elseif BefehlString == "LumYellow-" 		then LrDevelopController.decrement("LumYellow",WertChar)
	elseif BefehlString == "HueGreen-" 			then LrDevelopController.decrement("HueGreen",WertChar)
	elseif BefehlString == "SatGreen-" 			then LrDevelopController.decrement("SatGreen",WertChar)
	elseif BefehlString == "LumGreen-" 			then LrDevelopController.decrement("LumGreen",WertChar)
	elseif BefehlString == "HueAqua-" 			then LrDevelopController.decrement("HueAqua",WertChar)
	elseif BefehlString == "SatAqua-"		 	then LrDevelopController.decrement("SatAqua",WertChar)
	elseif BefehlString == "LumAqua-" 			then LrDevelopController.decrement("LumAqua",WertChar)
	elseif BefehlString == "HueBlue-" 			then LrDevelopController.decrement("HueBlue",WertChar)
	elseif BefehlString == "SatBlue-" 			then LrDevelopController.decrement("SatBlue",WertChar)
	elseif BefehlString == "LumBlue-" 			then LrDevelopController.decrement("LumBlue",WertChar)
	elseif BefehlString == "HuePurple-"			then LrDevelopController.decrement("HuePurple",WertChar)
	elseif BefehlString == "SatPurple-" 		then LrDevelopController.decrement("SatPurple",WertChar)        
	elseif BefehlString == "LumPurple-" 		then LrDevelopController.decrement("LumPurple",WertChar)
	elseif BefehlString == "HueMagenta-" 		then LrDevelopController.decrement("HueMagenta",WertChar)
	elseif BefehlString == "SatMagenta-" 		then LrDevelopController.decrement("SatMagenta",WertChar)
	elseif BefehlString == "LumMagenta-" 		then LrDevelopController.decrement("LumMagenta",WertChar)
	
	elseif BefehlString == "Contrast0" 			then LrDevelopController.setValue("Contrast",0)        
	elseif BefehlString == "Shadows0" 			then LrDevelopController.setValue("Shadows",0)        
	elseif BefehlString == "Blacks0" 			then LrDevelopController.setValue("Blacks",0)        
	elseif BefehlString == "Whites0" 			then LrDevelopController.setValue("Whites",0)        
	elseif BefehlString == "Highligths0" 		then LrDevelopController.setValue("Highlights",0)        
	elseif BefehlString == "Exposure0" 			then LrDevelopController.setValue("Exposure",0)        
	elseif BefehlString == "Clarity0" 			then LrDevelopController.setValue("Clarity",0)        
	elseif BefehlString == "Vibrance0" 			then LrDevelopController.setValue("Vibrance",0)        
	elseif BefehlString == "Saturation0" 		then LrDevelopController.setValue("Saturation",0)        
	elseif BefehlString == "HueRed0" 			then LrDevelopController.setValue("HueRed",0)        
	elseif BefehlString == "SatRed0" 			then LrDevelopController.setValue("SatRed",0)        
	elseif BefehlString == "LumRed0" 			then LrDevelopController.setValue("LumRed",0)        
	elseif BefehlString == "HueOrange0" 		then LrDevelopController.setValue("HueOrange",0)        
	elseif BefehlString == "SatOrange0" 		then LrDevelopController.setValue("SatOrange",0)        
	elseif BefehlString == "LumOrange0" 		then LrDevelopController.setValue("LumOrange",0)        
	elseif BefehlString == "HueYellow0" 		then LrDevelopController.setValue("HueYellow",0)        
	elseif BefehlString == "SatYellow0" 		then LrDevelopController.setValue("SatYellow",0)
	elseif BefehlString == "LumYellow0" 		then LrDevelopController.setValue("LumYellow",0)
	elseif BefehlString == "HueGreen0" 			then LrDevelopController.setValue("HueGreen",0)
	elseif BefehlString == "SatGreen0"			then LrDevelopController.setValue("SatGreen",0)
	elseif BefehlString == "LumGreen0" 			then LrDevelopController.setValue("LumGreen",0)
	elseif BefehlString == "HueAqua0" 			then LrDevelopController.setValue("HueAqua",0)
	elseif BefehlString == "SatAqua0" 			then LrDevelopController.setValue("SatAqua",0)
	elseif BefehlString == "LumAqua0" 			then LrDevelopController.setValue("LumAqua",0)
	elseif BefehlString == "HueBlue0"			then LrDevelopController.setValue("HueBlue",0)
	elseif BefehlString == "SatBlue0" 			then LrDevelopController.setValue("SatBlue",0)
	elseif BefehlString == "LumBlue0" 			then LrDevelopController.setValue("LumBlue",0)
	elseif BefehlString == "HuePurple0"			then LrDevelopController.setValue("HuePurple",0)
	elseif BefehlString == "SatPurple0" 		then LrDevelopController.setValue("SatPurple",0)        
	elseif BefehlString == "LumPurple0" 		then LrDevelopController.setValue("LumPurple",	0)
	elseif BefehlString == "HueMagenta0" 		then LrDevelopController.setValue("HueMagenta",	0)
	elseif BefehlString == "SatMagenta0" 		then LrDevelopController.setValue("SatMagenta",	0)
	elseif BefehlString == "LumMagenta0" 		then LrDevelopController.setValue("LumMagenta",0)  

	elseif BefehlString == "Rate0" 		then LrSelection.setRating(0)  
	elseif BefehlString == "Rate1" 		then LrSelection.setRating(1)  
	elseif BefehlString == "Rate2" 		then LrSelection.setRating(2)  
	elseif BefehlString == "Rate3" 		then LrSelection.setRating(3) 
	elseif BefehlString == "Rate4" 		then LrSelection.setRating(4)
	elseif BefehlString == "Rate5" 		then LrSelection.setRating(5)    
    
	else    LrDialogs.message( "Das hat nicht geklappt", TestString, "info" )
	end

	LrDialogs.showBezel( WertChar, 2 )

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

	LrDialogs.message( "Das hat geklappt", TestString, "info" )
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
					LrDialogs.message( "Connection established Vers.:12", "4242", "info" )
				end,
				
				--Funktion OnMessage()
				onMessage = function( socket, message )
					
					MatchString(message)
					----TestFunction(BefehlString)
					----TestFunction(Wert)
					--LrDialogs.showBezel( BefehlString, 2 )
					ASCIItoChar(WertString)
					WertChar = 55
					ExecuteFunction()


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
