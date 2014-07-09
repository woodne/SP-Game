tiles = {}

local loader = require "libs/Advanced-Tiled-Loader/Loader"
loader.path = "maps/"

function tiles.load()
	map = loader.load("level.tmx")
	allSolidTiles = findSolidTiles(map)

  return allSolidTiles
end
function tiles.draw()
	map:draw()
end

function findSolidTiles(map)

  local collidable_tiles = {}

  local layer = map.layers["ground"]

  for tileX, tileY, tile in layer:iterate() do

      if tile and tile.properties.solid then
        local ctile = collider:addRectangle((tileX) * 32, (tileY) * 32, 32, 32)
        ctile.type = "tile"
        collider:addToGroup("tiles", ctile)
        collider:setPassive(ctile)
        table.insert(collidable_tiles, ctile)
      end

  end

  return collidable_tiles
end


