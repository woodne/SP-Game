tiles = {}

function tiles.load()
	TILESIZE = 32
	width,height = love.window.getDimensions()

	Tileset = love.graphics.newImage('res/grass.png')

	local tileWidth, tileHeight = 32,32
	local tilesetW,tilesetH = Tileset:getWidth(), Tileset:getHeight()

	Quads = {
		love.graphics.newQuad(0,0,tileWidth,tileHeight,tilesetW,tilesetH), -- 1
		love.graphics.newQuad(32,0,tileWidth,tileHeight,tilesetW,tilesetH), -- 2
		love.graphics.newQuad(0,32,tileWidth,tileHeight,tilesetW,tilesetH), -- 3
		love.graphics.newQuad(32,32,tileWidth,tileHeight,tilesetW,tilesetH) -- 4
	}

	TileMap = {
		{4,4,4,4,4,4,4,4,4,4,4,4,4,4,4},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,1,1,1,1,1,1,1,1,4,1,1,1,1,1},
		{4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
	}
	
end
function tiles.draw()
	for x=1,#TileMap do
		local row = TileMap[x]
		for y=1,#row do
			local number = row[y]
			i = (x-1) * TILESIZE --tilesize
			j = (y-1) * TILESIZE --tilesize
			love.graphics.draw(Tileset, Quads[number],i,j)
		end
	end
end