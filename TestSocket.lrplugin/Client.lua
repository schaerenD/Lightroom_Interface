local LrSocket = import "LrSocket"
local LrTasks = import "LrTasks"
local LrFunctionContext = import "LrFunctionContext"
local LrDialogs = import 'LrDialogs'
local LrDevelopController = import 'LrDevelopController'
local LrApplicationView   = import 'LrApplicationView'
local LrSelection = import 'LrSelection'
local LrUndo = import 'LrUndo'
-- 


----------------- Global Variabel  ----------------
WertString    	= "NIL"
BefehlString  	= "NIL"
WertChar 		= 0 

LastView		= "loupe"
KillAllTask 	= false

Contrast		= 0
Temp			= 0
Shadows			= 0
Whites			= 0
Blacks			= 0
Highligths		= 0
Exposure		= 0
Clarity			= 0
Vibrance		= 0
Saturation		= 0
HueRed			= 0
SatRed			= 0
LumRed			= 0
HueOrange		= 0
SatOrange		= 0
LumOrange		= 0
HueYellow		= 0
SatYellow		= 0
LumYellow		= 0
HueGreen		= 0
SatGreen		= 0
LumGreen		= 0
HueAqua			= 0
SatAqua			= 0
LumAqua			= 0
HueBlue			= 0
SatBlue			= 0
LumBlue			= 0
HuePurple		= 0
SatPurple		= 0
LumPurple		= 0
HueMagenta		= 0
SatMagenta		= 0
LumMagenta		= 0
Vignet 			= 0

LimitsLow	= {}
LimitsLow["Standard"]						= -100
LimitsLow["Temperatur"]						= 2000
LimitsLow["Exposure"]						= -500
LimitsLow["Tint"]							= -150
LimitsLow["Contrast"]						= -100
LimitsLow["Shadows"]						= -100
LimitsLow["Whites"]							= -100
LimitsLow["Blacks"]							= -100
LimitsLow["Lowlights"]						= -100
LimitsLow["Clarity"]						= -100
LimitsLow["Vibrance"]						= -100
LimitsLow["Saturation"]						= -100
LimitsLow["HueAdjustmentRed"]				= -100
LimitsLow["SaturationAdjustmentRed"]		= -100
LimitsLow["LuminanceAdjustmentRed"]			= -100
LimitsLow["HueAdjustmentOrange"]			= -100
LimitsLow["SaturationAdjustmentOrange"]		= -100
LimitsLow["LuminanceAdjustmentOrange"]		= -100
LimitsLow["HueAdjustmentYellow"]			= -100
LimitsLow["SaturationAdjustmentYellow"]		= -100
LimitsLow["LuminanceAdjustmentYellow"]		= -100
LimitsLow["HueAdjustmentGreen"]				= -100
LimitsLow["SaturationAdjustmentGreen"]		= -100
LimitsLow["LuminanceAdjustmentGreen"]		= -100
LimitsLow["HueAdjustmentAqua"]				= -100
LimitsLow["SaturationAdjustmentAqua"]		= -100
LimitsLow["LuminanceAdjustmentAqua"]		= -100
LimitsLow["HueAdjustmentBlue"]				= -100
LimitsLow["SaturationAdjustmentBlue"]		= -100
LimitsLow["LuminanceAdjustmentBlue"]		= -100
LimitsLow["HueAdjustmentPurple"]			= -100
LimitsLow["SaturationAdjustmentPurple"]		= -100
LimitsLow["LuminanceAdjustmentPurple"]		= -100
LimitsLow["HueAdjustmentMagenta"]			= -100
LimitsLow["SaturationAdjustmentMagenta"]	= -100
LimitsLow["LuminanceAdjustmentMagenta"]		= -100
LimitsLow["straightenAngle"]				= -100
LimitsLow["PostCropVignetteAmount"]			= -100


LimitsHigh	= {}
LimitsHigh["Standard"] 						= 100
LimitsHigh["Temperatur"]					= 50000
LimitsHigh["Exposure"]						= 500
LimitsHigh["Tint"]							= 150
LimitsHigh["Contrast"]						= 100
LimitsHigh["Shadows"]						= 100
LimitsHigh["Whites"]						= 100
LimitsHigh["Blacks"]						= 100
LimitsHigh["Highlights"]					= 100
LimitsHigh["Clarity"]						= 100
LimitsHigh["Vibrance"]						= 100
LimitsHigh["Saturation"]					= 100
LimitsHigh["HueAdjustmentRed"]				= 100
LimitsHigh["SaturationAdjustmentRed"]		= 100
LimitsHigh["LuminanceAdjustmentRed"]		= 100
LimitsHigh["HueAdjustmentOrange"]			= 100
LimitsHigh["SaturationAdjustmentOrange"]	= 100
LimitsHigh["LuminanceAdjustmentOrange"]		= 100
LimitsHigh["HueAdjustmentYellow"]			= 100
LimitsHigh["SaturationAdjustmentYellow"]	= 100
LimitsHigh["LuminanceAdjustmentYellow"]		= 100
LimitsHigh["HueAdjustmentGreen"]			= 100
LimitsHigh["SaturationAdjustmentGreen"]		= 100
LimitsHigh["LuminanceAdjustmentGreen"]		= 100
LimitsHigh["HueAdjustmentAqua"]				= 100
LimitsHigh["SaturationAdjustmentAqua"]		= 100
LimitsHigh["LuminanceAdjustmentAqua"]		= 100
LimitsHigh["HueAdjustmentBlue"]				= 100
LimitsHigh["SaturationAdjustmentBlue"]		= 100
LimitsHigh["LuminanceAdjustmentBlue"]		= 100
LimitsHigh["HueAdjustmentPurple"]			= 100
LimitsHigh["SaturationAdjustmentPurple"]	= 100
LimitsHigh["LuminanceAdjustmentPurple"]		= 100
LimitsHigh["HueAdjustmentMagenta"]			= 100
LimitsHigh["SaturationAdjustmentMagenta"]	= 100
LimitsHigh["LuminanceAdjustmentMagenta"]	= 100
LimitsHigh["straightenAngle"]				= 100
LimitsHigh["PostCropVignetteAmount"]		= 100
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

---------------- Socket Function ----------------
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
	
	LrTasks.execute("cd C:\Users\danie\Desktop\F3gR44gr5gaFGS")
	LrTasks.execute("LR_USB.exe")
	LrDialogs.message( Test, Test, "info" )
	
end

--------------- StartDriver Function --------------
--------------- BevorAfter Function ---------------

function BevorAfter()

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

		LastView = "loupe";
		LrApplicationView.showView(LastView)
	
end
		
--------------- BevorAfter Function --------------
------------------- Up Function ------------------

function Up()
	
	local CurrentModule = ""
	CurrentModule = LrApplicationView.getCurrentModuleName()
	if CurrentModule == "library" then LrSelection.selectFirstPhoto()	
	else LrApplicationView.zoomInSome()
	end

end
		
	
------------------- Up Function ------------------
------------------ Down Function -----------------

function Down()
	
	local CurrentModule = ""
	CurrentModule = LrApplicationView.getCurrentModuleName()
	if CurrentModule == "library" then LrSelection.selectLastPhoto()	
	else LrApplicationView.zoomOutSome()
	end

end
		
	
------------------ Down Function -----------------
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

	Contrast		= LrDevelopController.getValue("Contrast");
	Temp			= LrDevelopController.getValue("Temperature");
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
	Vignet			= LrDevelopController.getValue("PostCropVignetteAmount")
	
	--
	
end
	
------------------ Copy Function ------------------
------------------ Paste Function -----------------

function Paste()
    
	LrDevelopController.setValue("Contrast",Contrast);
	LrDevelopController.setValue("Temperature",Temp);
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
	LrDevelopController.setValue("PostCropVignetteAmount",Vignet);
	
end
	
------------------ Paste Function ------------------
------------------ Pick Function ------------------

function Pick()
	
	local isPicked = 0
	
	isPicked = LrSelection.getFlag() 

	---- LrDialogs.message( isPicked, isPicked, "info" )
	
	if isPicked == 0 then LrSelection.flagAsPick()
	elseif isPicked == 1 then LrSelection.flagAsReject()
	else LrSelection.removeFlag()
	end
	
end
	
------------------ Pick Function ------------------
----------- switchToFullscreen Function -----------

function switchToFullscreen()
	
	local IsDisplayOn

	IsDisplayOn = LrApplicationView.isSecondaryDisplayOn()

	if	IsDisplayOn == false then LrApplicationView.toggleSecondaryDisplay()
	else 					
	end							

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

		-- Begrenzungen
		if valueDevelopt > LimitsHigh[Groesse] then valueDevelopt = LimitsHigh[LimitsHigh]
		elseif valueDevelopt < LimitsLow[Groesse] then valueDevelopt = LimitsLow[Groesse] 
		else valueDevelopt = valueDevelopt
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

	-- Begrenzungen
	if valueDevelopt > LimitsHigh["Standard"] then valueDevelopt = LimitsHigh["Standard"]
	elseif valueDevelopt < LimitsLow["Standard"] then valueDevelopt = LimitsLow["Standard"] 
	else valueDevelopt = valueDevelopt
	end

	LrDevelopController.setValue(Groesse,valueDevelopt);

end

----------- ChangeAdjustPanel Function  -----------
----------------- Execute Function  ---------------

function ExecuteFunction()

	local valueDevelopt
	
    -- Fakultaet(message)
	if     BefehlString == "Contrast+" 			then ChangeAdjustPanel("Contrast","positiv")
	elseif BefehlString == "Temp+" 				then ChangeAdjustPanel("Temperature","positiv")	                            
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
	elseif BefehlString == "Crop+" 				then ChangeAdjustPanel("straightenAngle","positiv")
	elseif BefehlString == "Vignet+" 			then ChangeAdjustPanel("PostCropVignetteAmount","positiv")
	
	elseif BefehlString == "Contrast-" 			then ChangeAdjustPanel("Contrast","negativ")
	elseif BefehlString == "Temp-" 				then ChangeAdjustPanel("Temperature","negativ")	        
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
	elseif BefehlString == "Crop-" 				then ChangeAdjustPanel("straightenAngle","negativ")
	elseif BefehlString == "Vignet-" 			then ChangeAdjustPanel("PostCropVignetteAmount","negativ")
	
	elseif BefehlString == "Contrast0" 			then ChangeAdjustPanel("Contrast","zero")
	elseif BefehlString == "Temp0" 				then ChangeAdjustPanel("Temperature","zero")
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
	elseif BefehlString == "Crop0" 				then LrDevelopController.resetCrop()
	elseif BefehlString == "Vignet0" 			then ChangeAdjustPanel("PostCropVignetteAmount","zero")

	elseif BefehlString == "Hue" 		then ChangeHue()  
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
	elseif BefehlString == "Up"			then Up()
	elseif BefehlString == "Down"		then Down()

	elseif BefehlString == "BW" 		then BlackWhite()
	elseif BefehlString == "Copy" 		then Copy()
	elseif BefehlString == "Paste" 		then Paste()
	elseif BefehlString == "Pick"		then Pick()
	elseif BefehlString == "Zoom"		then LrApplicationView.toggleZoom()
	elseif BefehlString == "Full"		then switchToFullscreen()
	elseif BefehlString == "Bevor"		then BevorAfter()
	elseif BefehlString == "BevorReset"	then BevorAfterReset()

	elseif BefehlString == "Grid" 		then LrApplicationView.switchToModule('library')
	elseif BefehlString == "Devel"		then LrApplicationView.switchToModule('develop')

	elseif BefehlString == "Verb"		then StartAsync();
	elseif BefehlString == "Kill"		then EndAsync();
		
	-- elseif BefehlString == "Test1"		then LrApplicationView.switchToModule('develop');;
	-- elseif BefehlString == "Test2"		then LrApplicationView.switchToModule('develop');;
	-- elseif BefehlString == "Test3"		then if  then end;;
	-- elseif BefehlString == "Test4"		then ConvertToGrayscale();
	-- elseif BefehlString == "Test5"		then ConvertToGrayscale();
	-- elseif BefehlString == "Test6"		then ConvertToGrayscale();	

		
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
					LrDialogs.message( "Connection established Vers.:141", "4242", "info" )
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