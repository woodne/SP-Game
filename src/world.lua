world = {}

require "src.player"
require "src.tiles"
Camera = require "libs.hump.camera"

local HC = require "libs/HardonCollider"

function world:enter()
  gravity = 300
  --collisions
  collider = HC(100, on_collide)
  --loading classes
  player.load()
  tiles.load()
  --camera
  cam = Camera(hero:center())

  local w,h = map.width*64, map.height*32
  local x,y = hero:center() 
  map:setDrawRange(x,y,w,h)
  print (map:getDrawRange ())
end
function world:update(dt)
  player.move(dt)
  player.update(dt)

  collider:update(dt)
  updateCamera(dt)
end
function world:draw()
  cam:attach()
  tiles.draw()
  player.draw()
  cam:detach()
  love.graphics.print("FPS: "..love.timer.getFPS(), 300, 5)
  love.graphics.print("COINS: "..player.coins,0,5)
end
function updateCamera(dt)
  cam:lookAt(hero:center())
end