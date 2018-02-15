-- Zusätzliche Befehlsfunktionen
	-- elseif BefehlString == "Test1"		then LrApplicationView.switchToModule('develop');;
	-- elseif BefehlString == "Test2"		then LrApplicationView.switchToModule('develop');;
	-- elseif BefehlString == "Test3"		then if  then end;;
	-- elseif BefehlString == "Test4"		then ConvertToGrayscale();
	-- elseif BefehlString == "Test5"		then ConvertToGrayscale();
    -- elseif BefehlString == "Test6"		then ConvertToGrayscale();



-- Auslesen eines Wertes aus 
    
    TestString = string.format("Es wurde der Wert %u gelesen", valueDevelopt) 
    LrDialogs.message( TestString, TestString, "info" )



-- Meldungen erzeugen

    LrDialogs.message( "Befehl wurde nicht erkannt", TestString, "info" )
        

-- Async Task Funktionen

--LrTasks.startAsyncTask(
	--function() LrFunctionContext.callWithContext( 'socket_remote', 
		--function( context )
		
			--local running = true
			-- local sender = LrSocket.bind
			-- {
			-- 	 functionContext = context,
			-- 	 port = 4243, -- (let the OS assign the port)
			-- 	 plugin = _PLUGIN,
			-- 	 mode = "send",
			-- 	 onConnecting = function( socket, port )
			-- 		-- TODO
			-- 	 end,
			-- 	 onConnected = function( socket, port )
			-- 		LrDialogs.message( "Conncectd!", "", "info" )
			-- 	 end,
			-- 	 onMessage = function( socket, message )
			-- 		 LrDialogs.message( "Message!" .. message, "", "info" )
			-- 		-- nothing, we don't expect to get any messages back from a send port
			-- 	 end,
			-- 	 onClosed = function( socket )
			-- 		--LrDialogs.message( "Disconnect!", "", "info" )
			-- 		running = false
			-- 	 end,
			-- 	 onError = function( socket, err )
			-- 		LrDialogs.message( "Error: " .. err, "", "info" )
			-- 		if err == "timeout" then
			-- 			socket:reconnect()
			-- 		end
			-- 	 end,
			-- }
			-- sender:close()
			--while running do
				--sender:send( "reconnect in 10s\n" ) --immer MIT \n ---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				--LrTasks.sleep(10) -- seconds
				--sender:reconnect()
			--end	
    --end )
 --end


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
--end 
--	)
--)