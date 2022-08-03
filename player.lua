
local sqrtOf2 = 1.4142135624

function initializePlayer(map, world, spawn)
    
	local layer = map:addCustomLayer("Joueur", 3)

    -- Objet du joueur
	local characterId = "Boy"
	local characterInfo = charactersInfos[characterId]

    local player = {
		world = world,
        id = characterId,
        sprite = characterInfo.sprite,
		animations = characterAnimations(characterInfo),
		direction = 1,
		dx = 1,
		dy = 0,
		x = spawn.x,
        y = spawn.y,
		spawn = spawn,
		width = spawn.width,
		height = spawn.height,
		speed = 150,
        ox = 6,
        oy = 10,
		wounded_time = 0.5,
		healthpoints = 5,
		max_healthpoints = 5,
    }
	layer.player = player
    
    layer.boomerang = createBoomerang(world, player)

    layer.update = playerUpdate
    layer.draw = playerDraw

	world:add(player, player.x, player.y, player.width, player.height)

	return layer
end

function playerUpdate(self, dt)
	local player = self.player

	local speed = player.speed * dt
	local diagSpeed = speed / sqrtOf2

	local up = love.keyboard.isDown("w", "up")
	local down = love.keyboard.isDown("s", "down")
	local left = love.keyboard.isDown("a", "left")
	local right = love.keyboard.isDown("d", "right")

	-- protects from contrary inputs
	if up and down then 
		up = false
		down = false
	end
	if left and right then 
		left = false
		right = false
	end

	local moving = up or down or left or right

	-- updates positions
	if up and left then
		player.x = player.x - diagSpeed
		player.y = player.y - diagSpeed
		player.direction = 1
		player.dx = -1/sqrtOf2
		player.dy = -1/sqrtOf2
	elseif up and right then
		player.x = player.x + diagSpeed
		player.y = player.y - diagSpeed			
		player.direction = 4
		player.dx = 1/sqrtOf2
		player.dy = -1/sqrtOf2
	elseif down and left then
		player.x = player.x - diagSpeed
		player.y = player.y + diagSpeed			
		player.direction = 1
		player.dx = -1/sqrtOf2
		player.dy = 1/sqrtOf2
	elseif down and right then
		player.x = player.x + diagSpeed
		player.y = player.y + diagSpeed		
		player.direction = 4
		player.dx = 1/sqrtOf2
		player.dy = 1/sqrtOf2
	elseif up then
		player.y = player.y - speed
		player.direction = 3
		player.dx = 0
		player.dy = -1
	elseif down then
		player.y = player.y + speed
		player.direction = 2
		player.dx = 0
		player.dy = 1
	elseif left then
		player.x = player.x - speed
		player.direction = 1
		player.dx = -1
		player.dy = 0
	elseif right then
		player.x = player.x + speed
		player.direction = 4
		player.dx = 1
		player.dy = 0
	end

	local function filter(item, other)
		if other == self.boomerang then
			return false
		elseif other.healthpoints ~= nil and other.healthpoints <= 0 then
			return false
		else 
			return "slide"
		end
	end

	player.x, player.y, collisions = player.world:move(player, player.x, player.y, filter )

	if player.wounded then
		player.wounded.time = player.wounded.time + dt
		
		if player.wounded.time > player.wounded_time then
			player.wounded = nil
		end
	else
		-- teste si le joueur a touché un npc 
		local wounded = false
		for _, object in ipairs(collisions) do
			local element = object.other
			if element.dangerous then
				wounded = true
				break
			end
		end

		if wounded then
			player.healthpoints = player.healthpoints - 1
			if player.healthpoints <= 0 then
				-- remete le joueur au point de départ
				player.healthpoints = player.max_healthpoints
				player.x = player.spawn.x
				player.y = player.spawn.y
				player.world:update(player, player.x, player.y)      
			else
				player.wounded = {
					time = 0
				}
			end
		end
	end

	updateBoomerang(self.boomerang, dt)

	if moving then 
		player.animations[player.direction]:update(dt)
	end
end

function playerDraw(self)
	local player = self.player
	local animation = player.animations[player.direction]
	animation:draw(
		player.sprite, 
		player.x,
		player.y,
		0,
		1,
		1,
		player.ox,
		player.oy
	)

	displayBoomerang(self.boomerang)
	
	if player.wounded then
		love.graphics.print("aie", player.x + 15, player.y - 15)
	end

	-- Temporarily draw a point at our location so we know
	-- that our sprite is offset properly
	-- love.graphics.rectangle("line", self.player.x, self.player.y, player.width, player.height)	
end