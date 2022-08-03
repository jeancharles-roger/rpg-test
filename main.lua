bump = require "libraries.bump"
anim8 = require 'libraries.anim8'
sti = require "libraries.sti"
bump_sti = require "libraries.sti.plugins.bump"

local boomerang = require "boomerang"
local player = require "player"
local npcs = require "npcs"
local characters = require "characters"

local world
local map

function love.load()
	
	world = bump.newWorld()
	
    -- chargement de la carte
    map = sti("carte.lua", {"bump"})
	map:bump_init(world)
	
    -- Spawn du joueur et des pnjs
	local spawn
	local npcs = {}
	for k, object in pairs(map.objects) do
		if object.name == "Joueur" then
			spawn = object
		elseif object.name then 
			npcs[object.name] = object
		end
	end
    map:removeLayer("Placements")
	
	-- Création d'une couche dynamique à partir de l'id 3
	local player = initializePlayer(map, world, spawn)
	initializeNpcs(map, world, npcs, player.player)

	map.layers["Trous"].visible = false
	map.layers["Murs"].visible = false
end

function love.keypressed(key, scancode, isrepeat)
	if key == "escape" then
	   love.event.quit()
	elseif key == "space" then
		local layer = map.layers["Joueur"]
		throwBoomerang(layer.boomerang)
	end
 end 

function love.update(dt)
    map:update(dt)
end

function love.draw()
    local scale = 2
	local screen_width  = love.graphics.getWidth()  / scale
	local screen_height = love.graphics.getHeight() / scale

	map.scale = scale
	
    -- Translate world so that player is always centred
	local player = map.layers["Joueur"].player
	local tx = math.floor(player.x - screen_width  / 2)
	local ty = math.floor(player.y - screen_height / 2)

	map:draw(-tx, -ty, scale)
end