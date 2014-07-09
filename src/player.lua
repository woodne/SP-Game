 player = {}

function player.load()
	player.x = 300
	player.y = 5
	player.friction = 7
	player.speed = 1000
	player.width = 32
	player.height = 32
	hero = collider:addRectangle(player.x,player.y,player.height,player.width)
	hero.velocity = {x = 0, y = 0}
	hero.speed = 50
end
function player.update(dt)
	hero:move(0,dt*gravity)
	hero:move(hero.velocity.x * dt, hero.velocity.y * dt)
	--[[
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + gravity * dt
	player.xvel = player.xvel * (1 - math.min(dt*player.friction,1))
	]]
end
function player.move(dt)
	if love.keyboard.isDown('right') then
		    hero:move(hero.speed*dt, 0)
			--hero.velocity.x  = hero.velocity.x + player.speed * dt
	end
	if love.keyboard.isDown('left') then 
			hero:move(-hero.speed*dt, 0)
			--hero.velocity.x  = hero.velocity.x  - player.speed * dt
	end
end
function player.draw()
	love.graphics.setColor(255,0,0)
	hero:draw("fill")
	love.graphics.reset()
end

function on_collide(dt, shape_a, shape_b, mtv_x, mtv_y)

    collideHeroWithTile(dt, shape_a, shape_b, mtv_x, mtv_y)
    --print ("Collidingggg!!!!!")

end

function collideHeroWithTile(dt, shape_a, shape_b, mtv_x, mtv_y)

    -- sort out which one our hero shape is
    local hero_shape, tileshape
    if shape_a == hero and shape_b.type == "tile" then
        hero_shape = shape_a
    elseif shape_b == hero and shape_a.type == "tile" then
        hero_shape = shape_b
    else
        -- none of the two shapes is a tile, return to upper function
        return
    end

    hero_shape:move(mtv_x, 0)
    hero_shape:move(0, mtv_y)

end



