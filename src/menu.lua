gamestate = require ("src/hump.gamestate")

local menu = {} -- previously: Gamestate.new()
local game = {}

function menu:draw()
    love.graphics.print("Press Enter to continue", 10, 10)
end

function menu:keyreleased(key, code)
    if key == 'enter' then
        Gamestate.switch(game)
    end
end

function game:enter()
    Entities.clear()
    -- setup entities here
end

function game:update(dt)
    Entities.update(dt)
end

function game:draw()
    Entities.draw()
end