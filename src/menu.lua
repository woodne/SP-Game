menu = {}

function menu:enter()
    menuimg = love.graphics.newImage("res/menu.png")
end
function menu:update(dt)
    function menu:keyreleased(key, code)
        if key == 'return' then
            Gamestate.switch(world)
        end
    end
end
function menu:draw()
    love.graphics.draw(menuimg,0,0)
    love.graphics.setColor(255,0,0)
    love.graphics.print("Press Enter/Return to continue.",5,5)
    love.graphics.reset()
end