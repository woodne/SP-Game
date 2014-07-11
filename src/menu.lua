menu = {}

function menu:enter()
    menuimg = love.graphics.newImage("res/menu.png")
end
function menu:update()
    function love.mousepressed(x,y)
    if x> 300 and x< 350 and y> 5 and y< 50 then
        Gamestate.switch(world)       
    end
end
end
function menu:draw()
    love.graphics.draw(menuimg,0,0)
    love.graphics.setColor(255,0,0)
    love.graphics.print("Play",300,5)
end