-- Project: Business Sample App
--
-- File name: photogallery.lua
--
-- Author: Corona Labs
--
-- Abstract: Display a gallery of photo thumbnails.
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

local widget = require("widget")
local myApp = require("myapp")

widget.setTheme(myApp.theme)

--local slideView = require( "slideView" )

local photoFiles = {
	"photos/Arch01.jpg",
	"photos/Biloxi05.jpg",
	"photos/Butterfly01.jpg",
	"photos/DSC6722.jpg",
	"photos/DSC_7743.jpg",
	"photos/ElCap.jpg",
	"photos/FlaKeysSunset.jpg",
	"photos/MaimiSkyline.jpg",
	"photos/MtRanier8x10.jpg",
	"photos/Tulip.jpg",
	"photos/WhiteTiger.jpg",
	"photos/Yosemite Valley.jpg",
	"photos/Yosemite2013_Mule_Deer04.jpg",
	"photos/bfly2.jpg",
	"photos/bodieIsland.jpg",
}

local photosThumbnails = {}
local photosThumbGroups = {}

local function showPhoto(event)
	if event.phase == "ended" then
        composer.showOverlay("slideView", {time=250, effect="crossFade", params={start=event.target.index, images=photoFiles}})
	end
	return true
end

function scene:create( event )
    local sceneGroup = self.view

    local background = display.newRect(0,0,display.actualContentWidth, display.actualContentHeight)
    background:setFillColor( 0.95, 0.95, 0.95 )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2

    sceneGroup:insert(background)

    local navBar = widget.newNavigationBar({
        title = "Profile Gallery",
        backgroundColor = { 0.96, 0.62, 0.34 },
        titleColor = {1, 1, 1},
        font = myApp.fontBold,
        rightButton = {
---
       	label = "UserID",
            id = "UserID",
            onEvent = addButtonListener,
            labelAlign = "right",        	
        }
    })
    sceneGroup:insert(navBar)


-- "translate" aka move the navBar
	navBar:translate( 0, -10 ) 



    local row = 0
    local col = 0

    local thumbnailMask = graphics.newMask("images/mask-80x80.png")

    local groupOffsetX = 0

    local groupOffsetY = 10

    local maxCol = math.floor( display.actualContentWidth / 80 ) - 1

    for i = 1, #photoFiles do
    	photosThumbnails[i] = display.newImage(photoFiles[i])
    	local aspectRatio = photosThumbnails[i].width / photosThumbnails[i].height
    	local scale
    	if aspectRatio > 1 then -- landscape photo
    		scale = 80 / photosThumbnails[i].height
    	else
    		scale = 80 / photosThumbnails[i].width
    	end
    	--print(scale, aspectRatio, photosThumbnails[i].width, photosThumbnails[i].width * scale, photosThumbnails[i].height, photosThumbnails[i].height * scale)
   		photosThumbnails[i]:scale(scale,scale)
   		photosThumbGroups[i] = display.newGroup()
   		photosThumbnails[i].x = 0 --groupOffsetX --col * 80 + 40
   		photosThumbnails[i].y = 0 --row * 80 + 40 + 70
   		photosThumbGroups[i]:insert(photosThumbnails[i])
		photosThumbGroups[i].x = col * 80 + 40 + display.safeScreenOriginX
		photosThumbGroups[i].y = row * 80 + 40 + 50 + display.safeScreenOriginY
		photosThumbGroups[i]:setMask(thumbnailMask)
		photosThumbGroups[i].maskX = 0 --groupOffset
		photosThumbGroups[i].maskY = 0 --groupOffset 
		photosThumbGroups[i].index = i
		photosThumbGroups[i]:addEventListener("touch", showPhoto)
		col = col + 1
		if col > maxCol then 
			row = row + 1
			col = 0
		end
		sceneGroup:insert(photosThumbGroups[i])

-- "translate" aka move the photosThumbGroups
--	photosThumbGroups[1]:translate( 0, 0 ) 



    end
    print("Memory", system.getInfo("textureMemoryUsed") / (1024 * 1024))
end

function scene:show( event )
    local sceneGroup = self.view
    
end

function scene:hide( event )
    local sceneGroup = self.view

    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    
end

function scene:destroy( event )
    local sceneGroup = self.view
    
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
