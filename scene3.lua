
local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local scrollView
local icons = {}
 
local function iconListener( event )
    local id = event.target.id
 
    if ( event.phase == "moved" ) then
        local dx = math.abs( event.x - event.xStart ) 
        if ( dx > 5 ) then
            scrollView:takeFocus( event ) 
        end
    elseif ( event.phase == "ended" ) then
        --take action if an object was touched
        print( "object", id, "was touched" )
        timer.performWithDelay( 10, function() 
            if scrollView then
                scrollView:removeSelf()
                scrollView = nil
            end
        end )
    end
    return true
end
 
scrollView = widget.newScrollView
{
    width = 460,
    height = 100,
    scrollWidth = 1200,
    scrollHeight = 100,
    verticalScrollDisabled = true
}
scrollView.x = display.contentCenterX
scrollView.y = display.contentCenterY
local scrollViewBackground = display.newRect( 600, 50, 1200, 100 )
scrollViewBackground:setFillColor( 0, 0, 0.2 )
scrollView:insert( scrollViewBackground )
--generate icons
for i = 1, 20 do
    icons[i] = display.newCircle( i * 56, 50, 22 )
    icons[i]:setFillColor( math.random(), math.random(), math.random() )
    scrollView:insert( icons[i] )
    icons[i].id = i
    icons[i]:addEventListener( "touch", iconListener )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	
	sceneGroup:insert(scrollView)
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
