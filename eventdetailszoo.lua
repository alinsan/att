-- Project: EVENTS Sample App
--
-- File name: winterevents.lua
--
-- Author: Corona Labs
--
-- Abstract: subsection (event details).
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

--
--

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
	background:setFillColor( 1.95, 1.95, 1.95 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
	sceneGroup:insert(background)
	background:addEventListener("touch", ignoreTouch)

    local navBar = widget.newNavigationBar({
        title = "Event info",
        backgroundColor = { 0.96, 0.62, 0.14 },
        titleColor = {1, 1, 1},
        font = myApp.fontBold
    })
    sceneGroup:insert(navBar)

-- "translate" aka move the navBar
	navBar:translate( 0, -25 ) 



	local myImage = display.newImageRect("hqdefault-18-cropped-sml.jpg", 380, 58)
	sceneGroup:insert(myImage)
	myImage:translate( 150, 70 )

    local myText = [[LA Zoo Lights at Griffith Park, 
Los Angeles. 
 
lazoolights.org

@lazoo]]
 
local options = {
   text = myText,
   x = display.contentCenterX,
   y = display.contentCenterY,
   width = 200,
   height = 300,
   fontSize = 24,
   align = "left"
}
 
local textField = display.newText( options )
textField:setFillColor( 0, 0, 0 )

sceneGroup:insert( textField )

--[[
    local button6 = widget.newButton( {
        width = 160,
        height = 40,
        label = "December",
        labelColor = { 
            default = { 0.90, 0.60, 0.34 }, 
            over = { 0.79, 0.48, 0.30 } 
        },
        labelYOffset = -9, 
        font = myApp.font,
        fontSize = 18,
        emboss = false,
        onRelease = myApp.showScreen2
    } )
    sceneGroup:insert(button5)
    button5.x = display.contentCenterX
    button5.y = display.contentCenterY + 110

]]--

end
--
--

function scene:show( event )
	local sceneGroup = self.view

end

function scene:hide( event )
	local sceneGroup = self.view
	
-- Completely remove the scene, including its scene object
-- composer.removeScene( "sceneGroup" ) | DOESNT HELP

-- 
-- 
-- sceneGroup:remove( myText )  --DOESNT WORK creates ERROR | WARNING: winterevents.lua:134: objectGroup:remove(): index of 0 out of range (should be 1 to 2)

-- newText:removeSelf()
-- newText = nil


--
--
-- composer.removeScene( "sceneGroup" )  --also DOESNT WORK

	--
	-- Clean up native objects
	--

end

function scene:destroy( event )
	local sceneGroup = self.view
end


--
--

--
--

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene