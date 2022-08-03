

local charactersSprite = love.graphics.newImage("pixmaps/Characters.png")
local charactersGrid = anim8.newGrid(26, 36, charactersSprite:getWidth(), charactersSprite:getHeight())

local orcSprite = love.graphics.newImage("pixmaps/orc.png")
local orcGrid = anim8.newGrid(30, 40, orcSprite:getWidth(), orcSprite:getHeight())

charactersInfos = {
	Eagle = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "1-3", column = 1,
		width = 26, height = 36,
	},
	Invisible = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "4-6", column = 1,
		width = 26, height = 36,
	},
	Girl = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "7-9", column = 1,
		width = 26, height = 36,
	},
	Boy = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "10-12", column = 1,
		width = 26, height = 36,
	},
	Blue = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "1-3", column = 5, 
		width = 26, height = 36,
	},
	Red = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "4-6", column = 5,
		width = 26, height = 36,
	},
	Yellow = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "7-9", column = 5,
		width = 26, height = 36,
	},
	Green = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "10-12", column = 5, 
		width = 26, height = 36,
	},
	Orc = { 
		sprite = orcSprite, grid = orcGrid,
		lines = "1-3", column = 1, 
		max_healthpoints = 2,
		width = 30, height = 40,
		killable = true, dangerous = true
	},
}

function characterAnimations(character)
	local lines = character.lines
	local column = character.column
	local grid = character.grid
	return {
		anim8.newAnimation(grid(lines, column + 1), 0.1),
		anim8.newAnimation(grid(lines, column + 0), 0.1),
		anim8.newAnimation(grid(lines, column + 3), 0.1),
		anim8.newAnimation(grid(lines, column + 2), 0.1),
	}
end
