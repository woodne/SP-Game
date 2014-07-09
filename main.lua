require "src/player"
require "src/tiles"

local HC = require "libs/HardonCollider"

function love.load()
  groundlevel = 480
  gravity = 300

  --collisions
  collider = HC(100, on_collide)
  --loading classes
  player.load()
  tiles.load()

end
function love.update(dt)
  player.move(dt)
  player.update(dt)

  collider:update(dt)
end
function love.draw()
  tiles.draw()
  player.draw()
end
