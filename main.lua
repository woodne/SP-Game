require "src.player"
require "src.tiles"
Camera = require "libs.hump.camera"

local HC = require "libs/HardonCollider"

function love.load()
  groundlevel = 480
  gravity = 300
  --collisions
  collider = HC(100, on_collide)
  --loading classes
  player.load()
  tiles.load()
  --camera
  cam = Camera(hero:center())

  local w,h = love.graphics.getWidth(), love.graphics.getHeight()
  local x,y = hero:center() -- this is used again in update. really need to figure out lua scope...
  map:setDrawRange(x,y,w,h) -- w and h are important. Tiles will render black if incorrect
  print (map:getDrawRange ())
end
function love.update(dt)
  player.move(dt)
  player.update(dt)

  collider:update(dt)
  updateCamera(dt)
end
function love.draw()
  cam:attach()
  tiles.draw()
  player.draw()
  cam:detach()
  love.graphics.print("FPS: "..love.timer.getFPS(), 300, 5)
end
function updateCamera(dt)
  cam:lookAt(hero:center())
end