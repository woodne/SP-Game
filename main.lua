Gamestate = require ("libs.hump.gamestate")
require ("src.splash")
require ("src.menu")
require ("src.world")

Timer = require ("libs.hump.timer")

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(splash)
    Timer.add(3, function() Gamestate.switch(menu) end)
end

function love.update(dt)
    Timer.update(dt)
end