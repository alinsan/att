-- Project: EVENTS Sample App
--
-- File name: menu.lua
--
-- Author: Corona Labs
--
-- Abstract: A simple menu.
--
--
-- Target devices: simulator, device
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2013 Corona Labs Inc. All Rights Reserved.
---------------------------------------------------------------------------------------
--[[

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

]]--
---------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- local checkerBoard = display.newImageRect("table.png", 720, 158)

-- local myImage = display.newImageRect("table.png", 720, 58)
-- myImage:translate( 0, 70 ) 

-- local myImage2 = display.newImageRect("table.png", 720, 58 )
-- myImage2:translate( 0, 350 ) 


local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local widgetExtras = require("widget-extras")
local myApp = require( "myapp" )

widget.setTheme(myApp.theme)

local titleText
local locationtxt
local views = {}


local function ignoreTouch( event )
	return true
end



function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
	background:setFillColor( 0.95, 0.95, 0.95 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
	sceneGroup:insert(background)
	background:addEventListener("touch", ignoreTouch)

    local navBar = widget.newNavigationBar({
        title = "MAIN EVENTS",
        backgroundColor = { 0.96, 0.62, 0.14 },
        titleColor = {1, 1, 1},
        font = myApp.fontBold
    })
    sceneGroup:insert(navBar)

-- "translate" aka move the navBar
	navBar:translate( 0, -25 ) 

	local myImage = display.newImageRect("video-embed-example-crop.jpg", 360, 176)
	sceneGroup:insert(myImage)
	myImage:translate( 150, 120 ) 


--    local button1 = widget.newButton({
--    	width = 160,
--    	height = 40,
--    	label = "Greek Festivals",
--        labelColor = { 
--            default = { 0.90, 0.60, 0.34 }, 
--            over = { 0.79, 0.48, 0.30 } 
--        },
--    	labelYOffset = -4, 
--    	font = myApp.font,
--    	fontSize = 18,
--    	emboss = false,
--    	onRelease = myApp.showScreen2
--    })
--    sceneGroup:insert(button1)
--    button1.x = display.contentCenterX
--    button1.y = display.contentCenterY - 160


    local button3 = widget.newButton({
    	width = 160,
    	height = 40,
    	label = "Oktoberfest",
        labelColor = { 
            default = { 0.90, 0.60, 0.34 }, 
            over = { 0.79, 0.48, 0.30 } 
        },
    	labelYOffset = -4, 
    	font = myApp.font,
    	fontSize = 18,
    	emboss = false,
    	onRelease = myApp.showScreen2
    })
    sceneGroup:insert(button3)
    button3.x = display.contentCenterX
    button3.y = display.contentCenterY - 20

    local button4 = widget.newButton({
    	width = 160,
    	height = 40,
    	label = "Mexican Independence Day",
        labelColor = { 
            default = { 0.90, 0.60, 0.34 }, 
            over = { 0.79, 0.48, 0.30 } 
        },
    	labelYOffset = -4, 
    	font = myApp.font,
    	fontSize = 18,
    	emboss = false,
    	onRelease = myApp.showScreen2
    })
    sceneGroup:insert(button4)
    button4.x = display.contentCenterX
    button4.y = display.contentCenterY + 40

    local button5 = widget.newButton( {
        width = 160,
        height = 40,
        label = "Data Entry",
        labelColor = { 
            default = { 0.90, 0.60, 0.34 }, 
            over = { 0.79, 0.48, 0.30 } 
        },
        labelYOffset = -4, 
        font = myApp.font,
        fontSize = 18,
        emboss = false,
        onRelease = myApp.showScreen2
    } )
    sceneGroup:insert(button5)
    button5.x = display.contentCenterX
    button5.y = display.contentCenterY + 105


    local button2 = widget.newButton({
    	width = 160,
    	height = 40,
    	label = "LA County Fair",
        labelColor = { 
            default = { 0.90, 0.60, 0.34 }, 
            over = { 0.79, 0.48, 0.30 } 
        },
    	labelYOffset = -4, 
    	font = myApp.font,
    	fontSize = 18,
    	emboss = false,
    	onRelease = myApp.showScreen2
    })
    sceneGroup:insert(button2)
    button2.x = display.contentCenterX
    button2.y = display.contentCenterY + 170



end

function scene:show( event )
	local sceneGroup = self.view

end

function scene:hide( event )
	local sceneGroup = self.view

	--
	-- Clean up native objects
	--

end









------------------------------------------------

      --------------Video-----------------

------------------------------------------------

local widget = require( "widget" )

display.setStatusBar( display.HiddenStatusBar )

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight


local video			-- forward reference
local playButton, seekButton, muteButton, stopButton	-- forward references
local seekValue = 25		-- forward reference
local totalPlayTime

local videoPaused = false

display.setDefault( "background", 100/255 )

--local posterFrame = display.newImage( "PosterFrame.png", centerX, centerY )

local videoWidth = _W - 20
local videoHeight = _H - 40 

local stoppedTimeString = "----"
local runningTime = display.newText( stoppedTimeString, _W - 45, _H - 30, native.systemFont, 13 )
local totalTime = display.newText( stoppedTimeString, _W - 45, _H - 15, native.systemFont, 13 )

videoRatio = 180/320		-- used to create our video container based on video size (320 x 180)

local posterFrame = display.newRoundedRect( centerX, centerY - 20, _W, _H - 40, 20 )
posterFrame:setFillColor( 200/255 )

-- Determine if running on Corona Simulator
--
local isSimulator = "simulator" == system.getInfo("environment")

-- Video is not supported on Simulator
--
if isSimulator then
	msg = display.newText( "native.newVideo() not supported in Simulator", centerX, 80, native.systemFontBold, 22 )
else
	msg = display.newText( "Press Play to start video", centerX, 60, native.systemFontBold, 22 )
--	posterFrame:addEventListener( "tap", posterFrame )		-- add Tap listener
end

msg:setFillColor( 0, 0, 1 )

-------------------------------
-- Enable/Disable Buttons
-------------------------------
--
-- Called when video is started or ended to enable/disable button touches
--
local function buttonsEnable( value )
	stopButton:setEnabled( value )
	seekButton:setEnabled( value )
	muteButton:setEnabled( value )
end

-------------------------------
-- Stop video (removes object)
-------------------------------
--
-- Called when Stop button pressed or video "done" listener
--
local function stopCtl( event )
	if video then
		video:removeSelf()
		video = nil
		seekValue = 25
		playButton:setLabel( "Play" )
		muteButton:setLabel( "Mute" )
		seekButton:setLabel( "Seek 25%" )
		runningTime.text = stoppedTimeString
		totalTime.text = stoppedTimeString
		msg.text = "Stopped"
		buttonsEnable( false )
	end
end

-------------------------------
-- Play or Pause the video
-------------------------------
--
function playCtl( event )

	if not isSimulator and not video then
	
		local function videoListener( event )
			print( "Video Listener called: ", event.phase )
			if "ready" == event.phase then
				totalPlayTime = video.totalTime		-- get total video time (in seconds)
				totalTime.text = string.format( "Total: %.0f sec.", totalPlayTime )
			end
			if "ended" == event.phase then
				stopCtl( event )		-- remove and clean up the video player
				msg.text = "Video Done"
			end
		end
		
		msg.text = "Loading Video ..."		-- message will appear after the video finishes
		video = native.newVideo( display.contentCenterX, 140, videoWidth, videoWidth * videoRatio )
		video:load( "https://www.coronalabs.com/video/bbb/BigBuckBunny_640x360.m4v", media.RemoteSource )
		videoPaused = true
		video:addEventListener( "video", videoListener )
		buttonsEnable( true )
	end
	
	if video then
		if videoPaused then	
			video:play()
			videoPaused = false
			playButton:setLabel( "Pause" )
		else
			video:pause()
			videoPaused = true
			playButton:setLabel( "Resume" )
		end
	end
	
end

-------------------------------
-- Mute video sound
-------------------------------
--
local function muteCtl( event )
	if video then
		if video.isMuted then
			video.isMuted = false
			muteButton:setLabel( "Mute" )
		else
			video.isMuted = true
			muteButton:setLabel( "UnMute" )
		end
	end
end

-----------------------------------
-- Seek video (25%, 50%, 95%, 0%)
-----------------------------------
--
local function seekCtl( event )
	if video then
		local newSeekValue = 0
		
		if seekValue == 0 then
			newSeekValue = 25
		elseif seekValue == 25 then
			newSeekValue = 50
		elseif seekValue == 50 then
			newSeekValue = 95
		else
			newSeekValue = 0
		end
		
		video:seek( totalPlayTime * seekValue/100 )		-- seek to percentage of total time
		print( "seeking to ", totalPlayTime * seekValue/100 )
		seekValue = newSeekValue
		seekButton:setLabel( "Seek " .. seekValue .. "%" )
	end
end

-------------------------------
-- Create the buttons
-------------------------------

buttonTop = _H - 35
FONT_SIZE = 14

playButton = widget.newButton
	{
	    left = 5,
	    top = buttonTop,
		width = 90,
		height = 30,
		font = native.systemFontBold,
		fontSize = FONT_SIZE,
		id = "playButton",
	    label = "Play",
	    onRelease = playCtl,
	}

stopButton = widget.newButton
	{
	    left = 100,
	    top = buttonTop,
		width = 90,
		height = 30,
		font = native.systemFontBold,
		fontSize = FONT_SIZE,
		id = "stopButton",
	    label = "Stop",
	    onRelease = stopCtl,
	}
	
seekButton = widget.newButton
	{
	    left = 195,
	    top = buttonTop,
		width = 90,
		height = 30,
		font = native.systemFontBold,
		fontSize = FONT_SIZE,
		id = "seekButton",
	    label = "Seek 25%",
	    onRelease = seekCtl,
	}

muteButton = widget.newButton
	{
	    left = 290,
	    top = buttonTop,
		width = 90,
		height = 30,
		font = native.systemFontBold,
		fontSize = FONT_SIZE,
		id = "muteButton",
	    label = "Mute",
	    onRelease = muteCtl,
	}

buttonsEnable( false )		-- disable all but the Play button

-------------------------------------------------
-- Update the movie time on the screen
-------------------------------------------------
--
local function updateTime( event )
	-- Don't update the time if the video is not running
	if video then
		local currentTime = video.currentTime
		if currentTime > 0 and currentTime < 2 then
			-- Clear the "Loading" message once the video starts playing
			msg.text = ""
		end
		runningTime.text = string.format( "Time: %.0f sec.", currentTime )
	end
end

timer.performWithDelay( 1000, updateTime, 0 )

-- for tvOS bind play/pause to the button on remote
if system.getInfo( "platformName" ) == "tvOS" then
	local function onKeyEvent( event )
	    if ( event.keyName == "buttonX" and event.phase=="down" ) then
	        playCtl()
	    end
	    return false
	end

	Runtime:addEventListener( "key", onKeyEvent )
end





function scene:destroy( event )
	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene