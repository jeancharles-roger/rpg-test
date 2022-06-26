local sti = require "libraries.sti"

local map
local layer 
local player

function love.load()

    -- chargement de la carte
    map = sti("world.lua")

    -- Création d'une couche dynamique à partir de l'id 2
    layer = map:addCustomLayer("Sprites", 2)

    -- Spawn du joueur
	for k, object in pairs(map.objects) do
		if object.name == "Joueur" then
			player = object
			break
		end
	end

    -- Objet du joueur
    local sprite = love.graphics.newImage("pixmaps/Archer-Green.png")
    layer.player = {
        sprite = sprite,
        x = player.x,
        y = player.y,
        ox = -8,
        oy = -8
    }

    layer.update = function(self, dt)
		-- 96 pixels per second
		local speed = 120 * dt

		-- Move player up
		if love.keyboard.isDown("w", "up") then
			self.player.y = self.player.y - speed
		end

		-- Move player down
		if love.keyboard.isDown("s", "down") then
			self.player.y = self.player.y + speed
		end

		-- Move player left
		if love.keyboard.isDown("a", "left") then
			self.player.x = self.player.x - speed
		end

		-- Move player right
		if love.keyboard.isDown("d", "right") then
			self.player.x = self.player.x + speed
		end
	end

    layer.draw = function(self)
		love.graphics.draw(
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
		love.graphics.setPointSize(5)
		love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
	end


    map:removeLayer("Joueurs")
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