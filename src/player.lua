 player = {}

require "libs.anal"

function player.load(dt)
	player.x = 0
	player.y = 0
	player.friction = 7
	player.width = 32
	player.height = 32
    player.coins = 0
	hero = collider:addRectangle(player.x,player.y,player.height,player.width)
	heroimage = love.graphics.newImage("res/hero.png")
    anim = newAnimation(heroimage,104,110,.5,0)
    anim:setMode("bounce")
	hero.velocity = {x = 0, y = 0}
	hero.speed = 400
	local jumped
end
function player.update(dt)
	--hero:move(0,dt*gravity)
    anim:update(dt)
	if hero.velocity.y > 0 then
		hero.velocity.y = hero.velocity.y -5
	elseif hero.velocity.y < 0 then
		hero.velocity.y = hero.velocity.y +5
	end
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
	end
	if love.keyboard.isDown('left') then 
			hero:move(-hero.speed*dt, 0)
	end
	if love.keyboard.isDown('down') then 
			hero:move(0, hero.speed*dt)
	end
    if love.keyboard.isDown('up') then 
            hero:move(0, -hero.speed*dt)
    end
	if love.keyboard.isDown(' ') and
		jumped == false then
			hero.velocity.y = hero.velocity.y -500
			if (hero.velocity.y < -500) then
				hero.velocity.y = -500
			end
			print (hero.velocity.y)
			hero:move(hero.velocity.x * dt, hero.velocity.y * dt )
			jumped = true
	end
end
function player.draw()
	--love.graphics.setColor(255,0,0)
	--hero:draw("fill")

	local x, y = hero:center()
    anim:draw(x,y)
	--[[love.graphics.draw(heroimage, x, y, 
		0, .5, .5, heroimage:getWidth()/2, heroimage:getWidth()/2)]]
	love.graphics.reset()
end

function on_collide(dt, shape_a, shape_b, mtv_x, mtv_y)
    collideHeroWithTile(dt, shape_a, shape_b, mtv_x, mtv_y)
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
    if hero.velocity.y == 0 then
    	jumped = false
    end
    hero_shape:move(0, mtv_y)

end



