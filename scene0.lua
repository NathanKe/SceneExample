
local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function goTo_scene1()
	print("going to scene 1 from scene 0")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene1")
end

local function goTo_scene2()
	print("going to scene 2 from scene 0")
	_G.sceneSwitchCount = _G.sceneSwitchCount + 1
	composer.gotoScene("scene2")
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	
	local title = display.newText({
		text = "This is Scene 0",
		x = display.viewableContentWidth/2,
		y = 1 * display.viewableContentHeight/8, 
		fontSize = 72,
	})
	title:setFillColor(0, 1, 0)
	
	local score = display.newText({
		text = "Scene Switch Count = " .. _G.sceneSwitchCount ,
		x = display.viewableContentWidth/2,
		y = 2 * display.viewableContentHeight/8, 
		fontSize = 36,
	})
	
	-- goTo 0 at vert position 3

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
	
	sceneGroup:insert(title)
	sceneGroup:insert(score)
	sceneGroup:insert(button_goTo_scene1)
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
		composer.removeScene("scene0")
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
