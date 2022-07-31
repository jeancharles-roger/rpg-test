local bump = require "libraries.bump"
local anim8 = require 'libraries.anim8'
local sti = require "libraries.sti"
local bump_sti = require "libraries.sti.plugins.bump"

local player = require "player"
local enemies = require "enemies"

local world
local map

function love.load()
	
	world = bump.newWorld()
	
    -- chargement de la carte
    map = sti("carte.lua", {"bump"})
	map:bump_init(world)
	
    -- Spawn du joueur et des enemis
	local spawn
	local enemies = {}
	for k, object in pairs(map.objects) do
		if object.name == "Joueur" then
			spawn = object
		elseif object.name then 
			enemies[object.name] = object
		end
	end
    map:removeLayer("Placements")
	
	-- Création d'une couche dynamique à partir de l'id 3
	initializePlayer(map, world, spawn)
	initializeEnemies(map, world, enemies)

	map.layers["Trous"].visible = false
	map.layers["Murs"].visible = false
end

function love.keypressed(key, scancode, isrepeat)
	if key == "escape" then
	   love.event.quit()
	elseif key == "c" then
		local layer = map.layers["Joueur"]
		local player = layer.player
		player.character = player.character + 1
		if player.character > 8 then
			player.character = 1
		end	 
		updatePlayerAnimations(player)
	elseif key == "space" then
		local layer = map.layers["Joueur"]
		throwBoomerang(layer.boomerang)
	end
 end 

function love.update(dt)
    map:update(dt)
end

function love.draw()
    local scale = 1.5
	local screen_width  = love.graphics.getWidth()  / scale
	local screen_height = love.graphics.getHeight() / scale

    -- Translate world so that player is always centred
	local player = map.layers["Joueur"].player
	local tx = math.floor(player.x - screen_width  / 2)
	local ty = math.floor(player.y - screen_height / 2)

	map:draw(-tx, -ty, scale)
end