require "src/player"
require "src/tiles"

function love.load()
  groundlevel = 480
  gravity = 900
  --loading classes
  player.load()
  tiles.load()
end
function love.update(dt)
  player.move(dt)
  player.boundary()
  player.update(dt)
end
function love.draw()
  tiles.draw()
  player.draw()
end
