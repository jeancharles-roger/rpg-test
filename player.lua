
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

function initializePlayer(world, layer, spawn)
    
     -- Objet du joueur
	local character = 4
    local sprite = love.graphics.newImage("pixmaps/Characters.png")
	local grid = anim8.newGrid(26, 36, sprite:getWidth(), sprite:getHeight())
	
    local player = {
        character = character,
        sprite = sprite,
		grid = grid,
		direction = 1,
		dx = 1,
		dy = 0,
		x = spawn.x,
        y = spawn.y,
		speed = 150,
        ox = 8,
        oy = 16
    }
	layer.player = player

    updatePlayerAnimations(player)
     
    layer.boomerang = createBoomerang(world, player)

    layer.update = function(self, dt)
		local player = self.player
		-- 96 pixels per second
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

		player.x, player.y, cols = world:move(player, player.x, player.y )

        updateBoomerang(self.boomerang, dt)

		if moving then 
			player.animations[player.direction]:update(dt)
		end
	end

    layer.draw = function(self)
		local animation = self.player.animations[self.player.direction]
		animation:draw(
			self.player.sprite, 
			math.floor(self.player.x),
			math.floor(self.player.y),
			0,
			1,
			1,
			self.player.ox,
			self.player.oy
		)

		displayBoomerang(self.boomerang)
		
		-- Temporarily draw a point at our location so we know
		-- that our sprite is offset properly
		--love.graphics.setPointSize(5)
		--love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
	end

	world:add(player, player.x, player.y, 16, 16)
end