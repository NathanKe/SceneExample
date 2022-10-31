
local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function goTo_scene0()
	print("going to scene 0 from scene 1")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene0")
end

local function goTo_scene2()
	print("going to scene 2 from scene 1")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene2")
end

local function genericButtonHandler(event)
	local clickedButton = event.target.id
	print(clickedButton)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	
	local title = display.newText({
		text = "This is Scene 1",
		x = display.viewableContentWidth/2,
		y = 1 * display.viewableContentHeight/8, 
		fontSize = 72
	})
	title:setFillColor(0, 0, 1)
	
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
	
	-- vertical spot 4 for missing scene1 option
	
	local button_goTo_scene2 = widget.newButton({
		x = display.viewableContentWidth/2,
		y = 5 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = 500,
        height = 100,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={0.5,0,0,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "Go To Scene 2",
		fontSize = 72,
		onRelease = goTo_scene2
	})
	
	
	local button_a = widget.newButton({
		id = "a",
		x = display.viewableContentWidth/4,
		y = 6 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = display.viewableContentWidth/2,
        height = display.viewableContentHeight/8,
        cornerRadius = 2,
        fillColor = { default={0.5,0.5,1,1}, over={0,0,1,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "A",
		fontSize = 72,
		onRelease = genericButtonHandler
	})
	
	local button_b = widget.newButton({
		id = "b",
		x = 3 * display.viewableContentWidth/4,
		y = 6 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = display.viewableContentWidth/2,
        height = display.viewableContentHeight/8,
        cornerRadius = 2,
        fillColor = { default={1,1,0.5,1}, over={1,0.5,0,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "B",
		fontSize = 72,
		onRelease = genericButtonHandler
	})
	
	local button_c = widget.newButton({
		id = "c",
		x = display.viewableContentWidth/4,
		y = 7 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = display.viewableContentWidth/2,
        height = display.viewableContentHeight/8,
        cornerRadius = 2,
        fillColor = { default={1,0.5,1,1}, over={0.7,0,0.5,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "C",
		fontSize = 72,
		onRelease = genericButtonHandler
	})
	
	local button_d = widget.newButton({
		id = "d",
		x = 3 * display.viewableContentWidth/4,
		y = 7 * display.viewableContentHeight/8,
        shape = "roundedRect",
        width = display.viewableContentWidth/2,
        height = display.viewableContentHeight/8,
        cornerRadius = 2,
        fillColor = { default={0.5,1,1,1}, over={0,1,1,1} },
        strokeColor = { default={1,1,1,1}, over={1,1,1,1} },
        strokeWidth = 4,
		label = "D",
		fontSize = 72,
		onRelease = genericButtonHandler
	})
	
	--button_a:addEventListener("tap", genericButtonHandler)
	--button_b:addEventListener("tap", genericButtonHandler)
	--button_c:addEventListener("tap", genericButtonHandler)
	--button_d:addEventListener("tap", genericButtonHandler)

	
	sceneGroup:insert(button_a)
	sceneGroup:insert(button_b)
	sceneGroup:insert(button_c)
	sceneGroup:insert(button_d)
	
	sceneGroup:insert(title)
	sceneGroup:insert(score)
	sceneGroup:insert(button_goTo_scene0)
	sceneGroup:insert(button_goTo_scene2)
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
		composer.removeScene("scene1")
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