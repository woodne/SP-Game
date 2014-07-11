splash = {}

function splash:enter()
    splashimg = love.graphics.newImage("res/Splash.png")
end
function splash:update()
    
end
function splash:draw()
    love.graphics.draw(splashimg,0,0)
end