local bump = require "libraries.bump"
local anim8 = require 'libraries.anim8'
local sti = require "libraries.sti"
local bump_sti = require "libraries.sti.plugins.bump"

local world
local map
local layer 
local player

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


function love.load()
	
	world = bump.newWorld()
	
    -- chargement de la carte
    map = sti("world.lua", {"bump"})
	map:bump_init(world)

    -- Création d'une couche dynamique à partir de l'id 2
    layer = map:addCustomLayer("Sprites", 2)

    -- Spawn du joueur
	local spawn
	for k, object in pairs(map.objects) do
		if object.name == "Joueur" then
			spawn = object
			break
		end
	end

    -- Objet du joueur
	local character = 4
    local sprite = love.graphics.newImage("pixmaps/Characters.png")
	local grid = anim8.newGrid(26, 36, sprite:getWidth(), sprite:getHeight())
	local animations = {
		anim8.newAnimation(grid(characterGridPositions[character][1], characterGridPositions[character][2] + 1), 0.1),
		anim8.newAnimation(grid(characterGridPositions[character][1], characterGridPositions[character][2] + 0), 0.1),
		anim8.newAnimation(grid(characterGridPositions[character][1], characterGridPositions[character][2] + 3), 0.1),
		anim8.newAnimation(grid(characterGridPositions[character][1], characterGridPositions[character][2] + 2), 0.1),
	}

    player = {
		character = character,
        sprite = sprite,
		grid = grid,
		animations = animations,
		direction = 1,
		x = spawn.x,
        y = spawn.y,
        ox = 16,
        oy = 16
    }
	layer.player = player

    layer.update = function(self, dt)
		-- 96 pixels per second
		local speed = 150 * dt
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
			self.player.x = self.player.x - diagSpeed
			self.player.y = self.player.y - diagSpeed
			self.player.direction = 1
		elseif up and right then
			self.player.x = self.player.x + diagSpeed
			self.player.y = self.player.y - diagSpeed			
			self.player.direction = 4
		elseif down and left then
			self.player.x = self.player.x - diagSpeed
			self.player.y = self.player.y + diagSpeed			
			self.player.direction = 1
		elseif down and right then
			self.player.x = self.player.x + diagSpeed
			self.player.y = self.player.y + diagSpeed		
			self.player.direction = 4
		elseif up then
			self.player.y = self.player.y - speed
			self.player.direction = 3
		elseif down then
			self.player.y = self.player.y + speed
			self.player.direction = 2
		elseif left then
			self.player.x = self.player.x - speed
			self.player.direction = 1
		elseif right then
			self.player.x = self.player.x + speed
			self.player.direction = 4
		end

		self.player.x, self.player.y, cols = world:move( player, self.player.x, self.player.y )

		if moving then 
			self.player.animations[self.player.direction]:update(dt)
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

		-- Temporarily draw a point at our location so we know
		-- that our sprite is offset properly
		--love.graphics.setPointSize(5)
		--love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
	end

	world:add(player, player.x, player.y, 16, 16)

    map:removeLayer("Joueurs")
end

function love.keypressed(key, scancode, isrepeat)
	if key == "escape" then
	   love.event.quit()
	elseif key == "c" then
		player.character = player.character + 1
		if player.character > 8 then
			player.character = 1
		end	 
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
 end 

function love.update(dt)
    map:update(dt)
end

function love.draw()

    local scale = 2
	local screen_width  = love.graphics.getWidth()  / scale
	local screen_height = love.graphics.getHeight() / scale

    -- Translate world so that player is always centred
	local player = map.layers["Sprites"].player
	local tx = math.floor(player.x - screen_width  / 2)
	local ty = math.floor(player.y - screen_height / 2)

    map:draw(-tx, -ty, scale)
end