local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'
local LrDevelopController = import 'LrDevelopController'
local LrApplicationView   = import 'LrApplicationView'
local LrSelection = import 'LrSelection'
local LrUndo = import 'LrUndo'

require "Limits"
require "CopyPasteVar"
require "ExecuteFunc"

-- BEGIN VIEW
local LrView = import 'LrView'
local LrBinding = import 'LrBinding'
local Etwas
-- END VIEW



----------------- Global Variabel  ----------------
TestString		= "NIL"
WertString    	= "NIL"
BefehlString  	= "NIL"
WertChar 		= 0 

LastView		= "loupe"
KillAllTask 	= false
----------------- Global Variabel  ----------------

---------------- StartAsync Function --------------
function StartAsync()

	local  ReturnReferenz

	KillAllTask = false
	--LrTasks.startAsyncTask(function() LrFunctionContext.callWithContext( 'socket_send', AsyncTest(context))
	LrTasks.startAsyncTask(AsyncTest,"OmiTask")
	----LrDialogs.message( "Async", ReturnValue, "info" )
	
end
---------------- StartAsync Function --------------

---------------- EndAsync Function --------------
function EndAsync()
	
	KillAllTask = true
	
end
---------------- EndAsync Function --------------

---------------- Socket Function ----------------

	-- Ausgestzt. Code befindet sich in Entwiklung.lua

---------------- Socket Function ---------------

---------------- AsyncTest Function ---------------
function AsyncTest(context)

	local running = true
	LrDialogs.message( "Async", "Task gestartet", "info" )
	--local sender = LrSocket.bind
	--LrTasks.startAsyncTask( function()
		-- LrFunctionContext.callWithContext( 'socket_send', AsyncTest( context ))
		--  --local running = true
		--  local sender = LrSocket.bind {
		--   functionContext = "socket_send",
		--   plugin = "MIDI2LR",
		--   port = 10078, -- (let the OS assign the port)
		--   mode = "send",
		--   onConnecting = function( socket, port )
		--    -- TODO
		--   end,
		--   onConnected = function( socket, port )
		--    -- TODO
		--   end,
		--   onMessage = function( socket, message )
		--    -- nothing, we don't expect to get any messages back from a send port
		--   end,
		--   onClosed = function( socket )
		--    running = false
		--   end,
		--   onError = function( socket, err )
		--    if err == "timeout" then
		-- 	socket:reconnect()
		--    end
		--   end,
		--  }
		--  sender:send( "Hello world" )
		--  while running do
		--   LrTasks.sleep( 1/2 ) -- seconds
		--  end
		--  sender:close()
		--end )
	 --end )
	-- while running do
	-- 	--sender:send( "reconnect in 10s\n" ) --immer MIT \n ---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	-- 	LrDialogs.showBezel( "I läbe no", 3 )
	-- 	if KillAllTask == true then running = false
	-- 	else running = true
	-- 	end
	-- 	LrTasks.sleep(5) -- seconds
	-- 	--sender:reconnect()
	-- end	
	-- sender:close()
	-- LrTasks.sleep(5)
	-- LrDialogs.showBezel( "I bi tot", 3 )
end
---------------- AsyncTest Function ---------------

--------------- BlackWhite Function ---------------
function BlackWhite()
-- Wechselt aktuelles Bild zwischen Graustufen und Farben. 

	local isGrayscale = false

	isGrayscale = LrDevelopController.getValue("ConvertToGrayscale")
	LrApplicationView.switchToModule('develop')		-- Change Module
	if isGrayscale == false then LrDevelopController.revealPanel("GrayMixerBlue")	
	else LrDevelopController.revealPanel("SaturationAdjustmentRed")
	end

end
--------------- BlackWhite Function ---------------

--------------- StartDriver Function --------------
function StartDriver()
-- Startet automatisch den zu diesem Plugin dazugehörigen Treiber LR_Connect.
-- !!! Dazu muss der korrekte Pfad angegeben werden !!!
-- Funktioniert nicht unter macOS wenn Lightroom aus AppStore stammt.
	
	local command = "NIL"
	local pluginPath = "\Users\danie\Documents\01_Software\01_GitHub\03_Lightroom_Treiber\Lightroom_Treiber\LRSocket\bin\Debug"
	local filePath = "NIL"

	LrDialogs.message( "Treiber wird gestartet", TestString, "info" )

	-- Pfad hier angeben
	--LrTasks.execute("cd C:\Users\danie\Desktop")
	-- Name des Programmes hier angeben 
	--LrTasks.execute("LR_USB.exe")
	command = string.format('"start /D "%s\\bin" /B convert.exe "%s""', pluginPath, filePath)
	command = string.format('"start C:%sLRSocket.exe "%s"', pluginPath)
	command = string.format('"start C://Users//danie//Documents//01_Software//01_GitHub//03_Lightroom_Treiber//Lightroom_Treiber//LRSocket//bin//Debug//LRSocket.exe"')
	LrTasks.execute(command)

	LrDialogs.message( "Treiber gestartet", TestString, "info" )	
end
--------------- StartDriver Function --------------

--------------- BevorAfter Function ---------------
function BevorAfter()
-- Wechselt zwischen verschiedenen Ansichchten.
	if 		LastView == "loupe" then LastView = "develop_before";
	elseif 	LastView == "develop_before" then LastView = "develop_before_after_horiz"
	elseif 	LastView == "develop_before_after_horiz" then LastView = "develop_before_after_vert"
	elseif 	LastView == "develop_before_after_vert" then LastView = "grid"
	elseif 	LastView == "grid" then LastView = "compare";
	elseif 	LastView == "compare" then LastView = "survey";
	elseif 	LastView == "survey" then LastView = "loupe";
	else	LastView =  "loupe"
	end
	LrApplicationView.showView(LastView)

end
--------------- BevorAfter Function --------------

------------ BevorAfterReset Function ------------
function BevorAfterReset()
-- Setzt die Ansicht auf die Lupe zurück.

		LastView = "loupe";
		LrApplicationView.showView(LastView)
	
end		
--------------- BevorAfter Function --------------

------------------- Up Function ------------------
function Up()
-- Befindet man sich im Modus Libary wird das oberste Bild angewählt.
-- Befindet man sich im Mouds Develop wird etwas in das Bild hineingezoomt.
	
	local CurrentModule = ""

	CurrentModule = LrApplicationView.getCurrentModuleName()
	if CurrentModule == "library" then LrSelection.selectFirstPhoto()	
	elseif CurrentModule == "develop" then LrApplicationView.zoomInSome()
	else LrDialogs.message( "Nur in Bibliothek und Entwicklung verfügbar", TestString, "info" )
	end

end
------------------- Up Function ------------------

------------------ Down Function -----------------
function Down()
-- Befindet man sich im Modus Libary wird das unterste Bild angewählt.
-- Befindet man sich im Mouds Develop wird etwas in das Bild herausgezoomt.
	
	local CurrentModule = ""

	CurrentModule = LrApplicationView.getCurrentModuleName()
	if CurrentModule == "library" then LrSelection.selectLastPhoto()	
	elseif CurrentModule == "develop" then  LrApplicationView.zoomOutSome()
	else LrDialogs.message( "Nur in Bibliothek und Entwicklung verfügbar", TestString, "info" )
	end

end	
------------------ Down Function -----------------

------------------ Right Function ----------------
function Right()
-- Es wird das nächste Bild ausgewählt

	LrSelection.nextPhoto()

end
------------------ Right Function ----------------

------------------ Left Function -----------------
function Left()
-- Es wird das vorherige Bild ausgewählt
	
	LrSelection.previousPhoto()
		
end
------------------ Left Function -----------------

------------------ Rate Function -----------------
function Rate(Bewertung)
-- Ändert die Bewertung eines Bildes.
		
	LrSelection.setRating(Bewertung)
	
end
------------------ Rate Function -----------------

------------------ Redo Function -----------------
LrUndo.redo()
function Redo(Richtung)
-- Bearbeitungsschritt widerherstellen oder wiederholen.
			
	LrUndo.redo(Richtung)
		
end
------------------ Redo Function -----------------

---------------- ChangeLum Function ---------------
function ChangeLum()
-- Lässt das Panel Luminanz erscheinen.

	-- In den Entwicklungsmodus wechseln und aktuellen bearbeiteten Wert Anzeigen(ausgeschaltet).
	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("LuminanceAdjustmentRed")				-- Pop Up Menü

end
---------------- ChangeLum Function ---------------

---------------- ChangeSat Function ---------------
function ChangeSat()
-- Lässt das Panel Saturation in erscheinen.
	
	-- In den Entwicklungsmodus wechseln und aktuellen bearbeiteten Wert Anzeigen(ausgeschaltet).
	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("SaturationAdjustmentRed")				-- Pop Up Menü
	
end
---------------- ChangeSat Function ---------------

---------------- ChangeHue Function ---------------
function ChangeHue()
-- Lässt das Panel HUE erscheinen.

	-- In den Entwicklungsmodus wechseln und aktuellen bearbeiteten Wert Anzeigen(ausgeschaltet).
	LrApplicationView.switchToModule('develop')		-- Change Module
	LrDevelopController.revealPanel("HueAdjustmentRed")				-- Pop Up Menü
end
---------------- ChangeHue Function ---------------

------------------ Copy Function ------------------
function Copy()
-- Kopiert die den Wert der Grössen des aktuellen Bildes.

	Contrast		= LrDevelopController.getValue("Contrast");
	Temp			= LrDevelopController.getValue("Temperature");
	Tint 			= LrDevelopController.getValue("Tint");
	Shadows			= LrDevelopController.getValue("Shadows");
	Whites			= LrDevelopController.getValue("Whites");
	Blacks			= LrDevelopController.getValue("Blacks");
	Highligths		= LrDevelopController.getValue("Highligths");
	Exposure		= LrDevelopController.getValue("Exposure");
	Clarity			= LrDevelopController.getValue("Clarity");
	Vibrance		= LrDevelopController.getValue("Vibrance");
	Saturation		= LrDevelopController.getValue("Saturation");
	HueRed			= LrDevelopController.getValue("HueAdjustmentRed");
	SatRed			= LrDevelopController.getValue("SatAdjustmentRed");
	LumRed			= LrDevelopController.getValue("LumAdjustmentRed");
	HueOrange		= LrDevelopController.getValue("HueAdjustmentOrange");
	SatOrange		= LrDevelopController.getValue("SatAdjustmentOrange");
	LumOrange		= LrDevelopController.getValue("LumAdjustmentOrange");
	HueYellow		= LrDevelopController.getValue("HueAdjustmentYellow");
	SatYellow		= LrDevelopController.getValue("SatAdjustmentYellow");
	LumYellow		= LrDevelopController.getValue("LumAdjustmentYellow");
	HueGreen		= LrDevelopController.getValue("HueAdjustmentGreen");
	SatGreen		= LrDevelopController.getValue("SatAdjustmentGreen");
	LumGreen		= LrDevelopController.getValue("LumAdjustmentGreen");
	HueAqua			= LrDevelopController.getValue("HueAdjustmentAqua");
	SatAqua			= LrDevelopController.getValue("SatAdjustmentAqua");
	LumAqua			= LrDevelopController.getValue("LumAdjustmentAqua");
	HueBlue			= LrDevelopController.getValue("HueAdjustmentBlue");
	SatBlue			= LrDevelopController.getValue("SatAdjustmentBlue");
	LumBlue			= LrDevelopController.getValue("LumAdjustmentBlue");
	HuePurple		= LrDevelopController.getValue("HueAdjustmentPurple");
	SatPurple		= LrDevelopController.getValue("SatAdjustmentPurple");
	LumPurple		= LrDevelopController.getValue("LumAdjustmentPurple");
	HueMagenta		= LrDevelopController.getValue("HueAdjustmentMagenta");
	SatMagenta		= LrDevelopController.getValue("SatAdjustmentMagenta");
	LumMagenta		= LrDevelopController.getValue("LumAdjustmentMagenta");
	--Vignet			= LrDevelopController.getValue("PostCropVignetteAmount")

end
------------------ Copy Function ------------------

------------------ Paste Function -----------------
function Paste()
-- Fügt die Werte in die entsprechenden Grössen des aktuellen Bildes ein.
    
	LrDevelopController.setValue("Contrast",Contrast);
	LrDevelopController.setValue("Temperature",Temp);
	LrDevelopController.setValue("Tint",Tint);
	LrDevelopController.setValue("Shadows",Shadows);
	LrDevelopController.setValue("Whites",Whites);
	LrDevelopController.setValue("Blacks",Blacks);
	LrDevelopController.setValue("Highligths",Highligths);
	LrDevelopController.setValue("Exposure",Exposure);
	LrDevelopController.setValue("Clarity",Clarity);
	LrDevelopController.setValue("Vibrance",Vibrance);
	LrDevelopController.setValue("Saturation",Saturation);
	LrDevelopController.setValue("HueAdjustmentRed",HueRed);
	LrDevelopController.setValue("SatAdjustmentRed",SatRed);
	LrDevelopController.setValue("LumAdjustmentRed",LumRed);
	LrDevelopController.setValue("HueAdjustmentOrange",HueOrange);
	LrDevelopController.setValue("SatAdjustmentOrange",SatOrange);
	LrDevelopController.setValue("LumAdjustmentOrange",LumOrange);
	LrDevelopController.setValue("HueAdjustmentYellow",HueYellow);
	LrDevelopController.setValue("SatAdjustmentYellow",SatYellow);
	LrDevelopController.setValue("LumAdjustmentYellow",LumYellow);
	LrDevelopController.setValue("HueAdjustmentGreen",HueGreen);
	LrDevelopController.setValue("SatAdjustmentGreen",SatGreen);
	LrDevelopController.setValue("LumAdjustmentGreen",LumGreen);
	LrDevelopController.setValue("HueAdjustmentAqua",HueAqua);
	LrDevelopController.setValue("SatAdjustmentAqua",SatAqua);
	LrDevelopController.setValue("LumAdjustmentAqua",LumAqua);
	LrDevelopController.setValue("HueAdjustmentBlue",HueBlue);
	LrDevelopController.setValue("SatAdjustmentBlue",SatBlue);
	LrDevelopController.setValue("LumAdjustmentBlue",LumBlue);
	LrDevelopController.setValue("HueAdjustmentPurple",HuePurple);
	LrDevelopController.setValue("SatAdjustmentPurple",SatPurple);
	LrDevelopController.setValue("LumAdjustmentPurple",LumPurple);
	LrDevelopController.setValue("HueAdjustmentMagenta",HueMagenta);
	LrDevelopController.setValue("SatAdjustmentMagenta",SatMagenta);
	LrDevelopController.setValue("LumAdjustmentMagenta",LumMagenta);
	--LrDevelopController.setValue("PostCropVignetteAmount",Vignet);
	
end
------------------ Paste Function ------------------

------------------ Pick Function ------------------

function Pick()
-- Ist das Aktuelle Bild nicht markiert, wird dieses als angenommen markiert
-- Ist das Aktuelle Bild als angenommen markiert, wird dieses als abgelehnt markiert
-- Ist das Aktuelle Bild als abgelehnt markiert, wird die Markierung entfernt

	local isPicked = 0
	
	isPicked = LrSelection.getFlag() 
	if isPicked == 0 then LrSelection.flagAsPick()
	elseif isPicked == 1 then LrSelection.flagAsReject()
	else LrSelection.removeFlag()
	end
	
end
	
------------------ Pick Function ------------------

----------- switchToFullscreen Function -----------

function switchToFullscreen()
-- Wenn ein zweites Display angeschlossen ist, wird dieses in den Vollbidlmodus gewechselt.
-- Beim erneuten betätigen wechselt der externe Bildschirm wieder in die vorherige Ansicht.
	
	local IsDisplayOn

	IsDisplayOn = LrApplicationView.isSecondaryDisplayOn()

	if	IsDisplayOn == false then LrApplicationView.toggleSecondaryDisplay()
	else LrDialogs.message( "Kein externer Monitor angeschlossen", TestString, "info" )					
	end							

	LrApplicationView.toggleSecondaryDisplayFullscreen()
	
	
end
	
----------- switchToFullscreen Function -----------

------------------ Zoom Function ------------------

function Zoom()
-- Wechselt zwischen denn letzten beiden Zoomstufen.
	LrApplicationView.toggleZoom()

end

------------------ Zoom Function ------------------

--------------- ChangeModule Function -------------

function ChangeModule(Module)
-- Wechselt zu Modus Entwickeln oder Bibliothek

	if Module == "library" then LrApplicationView.switchToModule('library')
	elseif Module == "develop" then LrApplicationView.switchToModule('develop')
	else LrDialogs.message( "Modus ungültig", Module, "info" )
	end

end

--------------- ChangeModule Function -------------

-------------- ChangeExposure Function ------------ 

function ChangeExposure(Groesse,Richtung)
-- Ändert die Grösse Exposure 
	
	local valueDevelopt = 0
	-- In den Entwicklungsmodus wechseln und aktuellen bearbeiteten Wert Anzeigen(eingeschaltet).
	LrApplicationView.switchToModule('develop')		
	LrDevelopController.revealPanel(Groesse)		

	-- Wandelt Float in einen 100x grösseren Integer um.
	valueDevelopt = LrDevelopController.getValue(Groesse);
	valueDevelopt = 100*valueDevelopt;

	-- Änderung der Richtung feststellen und Wert dementsprechend ändern.
	if     	Richtung == "positiv" then valueDevelopt = valueDevelopt + WertChar;                             
	elseif 	Richtung == "negativ" then valueDevelopt = valueDevelopt - WertChar;
	elseif	Richtung == "zero"	  then valueDevelopt = 0;
	else	LrDialogs.message( "Das hat nicht geklappt", "ChangeAdjustPanel", "info" )
	end

	-- Begrenzungen, damit es nicht zu einem Überlauf einer Grösse kommt.
	if valueDevelopt > LimitsHigh[Groesse] then valueDevelopt = LimitsHigh[LimitsHigh]
	elseif valueDevelopt < LimitsLow[Groesse] then valueDevelopt = LimitsLow[Groesse] 
	else valueDevelopt = valueDevelopt
	end

	-- Wandelt Integer wieder in einen 100x kleineren Float.
	valueDevelopt = valueDevelopt/100;	   
	LrDevelopController.setValue(Groesse,valueDevelopt);
	
end
	
-------------- ChangeExposure Function ------------

----------- ChangeAdjustPanel Function  -----------

function ChangeAdjustPanel(Groesse,Richtung)
-- Ändert eine Grösse am aktullen Bild mit Ausnahme von Exposure

	local valueDevelopt = 0

	-- In den Entwicklungsmodus wechseln und aktuellen bearbeiteten Wert Anzeigen(eingeschaltet).
	LrApplicationView.switchToModule('develop')	
	LrDevelopController.revealPanel(Groesse)

	-- Änderung der Richtung feststellen und Wert dementsprechend ändern.
	valueDevelopt = LrDevelopController.getValue(Groesse);
				TestString = string.format("Es wurde der Wert %u gelesen", valueDevelopt) 
				LrDialogs.message( TestString, TestString, "info" )
	if     	Richtung == "positiv" then valueDevelopt = valueDevelopt + WertChar;                             
	elseif 	Richtung == "negativ" then valueDevelopt = valueDevelopt - WertChar;
	elseif	Richtung == "zero"	  then valueDevelopt = 0;
	else	LrDialogs.message( "Das hat nicht geklappt", "ChangeAdjustPanel", "info" )
	end	   

			TestString = string.format("Es befindet sich nun der Wert %u in valueDevelop", valueDevelopt) 
			LrDialogs.message( TestString, TestString, "info" )

	
	-- Aufgrund eines Bugs im LUA Compailer von Lightroom dürfen grosse Werte nicht Verglichen werden. Temperatur fällt in diese Kategorie
	if Groesse == "Temperature" then LrDevelopController.setValue(Groesse,valueDevelopt);
	else
		-- Begrenzungen, damit es nicht zu einem Überlauf einer Grösse kommt.
		if valueDevelopt > LimitsHigh[Groesse] then valueDevelopt = LimitsHigh[Groesse]
			TestString = string.format("Es befindet sich bei überlauftest der Wert %u in valueDevelop", valueDevelopt) 
			LrDialogs.message( TestString, TestString, "info" )
		elseif valueDevelopt < LimitsLow[Groesse] then valueDevelopt = LimitsLow[Groesse]
			TestString = string.format("Es befindet sich bei unterlauftest der Wert %u in valueDevelop", valueDevelopt) 
			LrDialogs.message( TestString, TestString, "info" ) 
		else valueDevelopt = valueDevelopt
			TestString = string.format("Es befindet sich nach allen Tests der Wert %u in valueDevelop", valueDevelopt) 
			LrDialogs.message( TestString, TestString, "info" ) 
		end
		LrDevelopController.setValue(Groesse,valueDevelopt);
	end

end

----------- ChangeAdjustPanel Function  -----------

----------------- Match Function  -----------------

function MatchString(myString)
-- Aus dem Übergebenen Sting wird der der aktuelle Befehl entnommen und der dazugehörige Wert entnommen.    
  
 local i = 0
 local BefehlsWert = {}

 
    for word in string.gmatch(myString, '([^:]+)') do
       BefehlsWert[i] = word
       i = i + 1
    end
	
	
    BefehlString = BefehlsWert[0]
    WertString = BefehlsWert[1]
	
    return "Done"
    
end

----------------- Match Function  -----------------

----------------- Test Function  ------------------

function TestFunction(TestString)
-- Only Lonly Testfunktion zum schnellen Testen von Befehlen.

	LrDialogs.message( TestString, "Das hat geklappt", "info" )

end
----------------- Test Function  ------------------

-------------- ASCIItoChar Function  --------------

function ASCIItoChar(WertASCII)
-- Umwandlung eines  Zahlenstring im ASCII-Format in ein Lua Kompatibles Format(z.B. char) 
	
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

------------------ View Function  -----------------

function View()

	LrDialogs.message( "Huler", "Hier und ad", "info" )
	local myFrame = LrView.osFactory();
	--local bind = LrView.bind
	
	local myDialog = LrDialogs.presentModalDialog() {
		title 		= 'Min Dialog',
		resizable 	= true,
		contents 	= myFrame:column{
			--bind_to_object = Etwas,
			myFrame:static_text {
				title = 'Hello World',
			},
		},
	}


end

------------------ View Function  -----------------

-------------  Receiver Socket Task  --------------

LrTasks.startAsyncTask( 
	function() LrFunctionContext.callWithContext( 'socket_remote', 
		function( context )
		-- Erzeugt einen TCP Empfangssocket auf Port 4242 und nimmt eine Verbindung an.
		-- Wird ein String empfangen, wird dieser erkannt(MatchString und ASCIItoChar) und die Execute Function ausgeführt
		
		--StartDriver()

		local running = true
		
			local remote = LrSocket.bind 
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
					LrDialogs.message( "Connection established Vers.:1.094 ", "4242", "info" )
				end,
				
				--Funktion OnMessage()
				onMessage = function( socket, message )
					
					MatchString(message)
					ASCIItoChar(WertString)
					--LrDialogs.message( "Probleme", "123", "info" )
					ExecuteFunction()
					--LrDialogs.message( "Befehl ausgefuehrt", "123", "info" )
				end,
				
				--Funktion OnClosed()
				onClosed = function( socket )
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

-------------  Receiver Socket Task  --------------