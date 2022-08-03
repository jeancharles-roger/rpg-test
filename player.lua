
local anim8 = require 'libraries.anim8'

require 'boomerang'

local sqrtOf2 = 1.4142135624
local characterGridPositions = {
	{ "1-3", 1 },
	{ "4-6", 1 },
	{ "7-9", 1 },
	{ "10-12", 1 },
	{ "1-3", 5 },
	{ "4-6", 5 },
	{ "7-9", 5 },
	{ "10-12", 5 },
}

function updatePlayerAnimations(player)
	local grid = player.grid
	local lines = characterGridPositions[player.character][1]
	local column = characterGridPositions[player.character][2]
	player.animations = {
		anim8.newAnimation(grid(lines, column + 1), 0.1),
		anim8.newAnimation(grid(lines, column + 0), 0.1),
		anim8.newAnimation(grid(lines, column + 3), 0.1),
		anim8.newAnimation(grid(lines, column + 2), 0.1),
	}
end

function initializePlayer(map, world, spawn)
    
	local layer = map:addCustomLayer("Joueur", 3)

     -- Objet du joueur
	local character = 4
    local sprite = love.graphics.newImage("pixmaps/Characters.png")
	local grid = anim8.newGrid(26, 36, sprite:getWidth(), sprite:getHeight())
	
    local player = {
		world = world,
        character = character,
        sprite = sprite,
		grid = grid,
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

    updatePlayerAnimations(player)
     
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