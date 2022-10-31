
local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function goTo_scene0()
	print("going to scene 0 from scene 2")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene0")
end

local function goTo_scene1()
	print("going to scene 1 from scene 2")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene1")
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	
	local title = display.newText({
		text = "This is Scene 2",
		x = display.viewableContentWidth/2,
		y = 1 * display.viewableContentHeight/8, 
		fontSize = 72
	})
	title:setFillColor(1, 0, 0)
	
	local score = display.newText({
		text = "Scene Switch Count = " .. _G.sceneSwitchCount ,
		x = display.viewableContentWidth/2,
		y = 2 * display.viewableContentHeight/8, 
		fontSize = 36,
	})

	local button_goTo_scene0 = widget.newButton({
		x = display.viewableContentWidth/2,
		y = 3 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = 500,
        height = 100,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.5,0,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "Go To Scene 0",
		fontSize = 72,
		onRelease = goTo_scene0
	})
	
	local button_goTo_scene1 = widget.newButton({
		x = display.viewableContentWidth/2,
		y = 4 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = 500,
        height = 100,
        cornerRadius = 2,
        fillColor = { default={0,0,1,1}, over={0,0,0.5,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "Go To Scene 1",
		fontSize = 72,
		onRelease = goTo_scene1
	})
	
	-- vertical spot 5 for missing scene 2 button

	
	
	local scrollSection = widget.newScrollView({
		x = display.viewableContentWidth/2,
		top = 6 * display.viewableContentHeight/8,
		width = display.viewableContentWidth,
		height = 2 * display.viewableContentHeight/8,
		scrollWidth = display.viewableContentWidth,
		scrollHeight = 4*display.viewableContentHeight/4
	})
	
	
	local blockOfText = "this is the wrong text"
	local path = system.pathForFile("test.txt", system.ResourceDirectory)
	local file, errorString = io.open(path, "r")
	if not file then
		print(errorString)
	else
		blockOfText = file:read("*a")
		file:close()
	end
	
	local lorem_ipsum = display.newText({
		text = blockOfText,
		x = scrollSection.width/2,
		top = 6 * display.viewableContentHeight/8,
		width = scrollSection.width,
		top = scrollSection.top,
		fontSize = 72,
	})
	lorem_ipsum.anchorY = 0
	lorem_ipsum:setFillColor(1, 0, 0)
	
	scrollSection:insert(lorem_ipsum)
	
	sceneGroup:insert(title)
	sceneGroup:insert(score)
	sceneGroup:insert(scrollSection)
	sceneGroup:insert(button_goTo_scene0)
	sceneGroup:insert(button_goTo_scene1)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene("scene2")

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
