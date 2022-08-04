

local charactersSprite = love.graphics.newImage("pixmaps/Characters.png")
local charactersGrid = anim8.newGrid(26, 36, charactersSprite:getWidth(), charactersSprite:getHeight())

local orcSprite = love.graphics.newImage("pixmaps/Orc.png")
local orcGrid = anim8.newGrid(30, 40, orcSprite:getWidth(), orcSprite:getHeight())

local goblinSprite = love.graphics.newImage("pixmaps/Goblin.png")
local goblinGrid = anim8.newGrid(20, 25, goblinSprite:getWidth(), goblinSprite:getHeight())

charactersInfos = {
	Eagle = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "1-3", column = 1,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Invisible = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "4-6", column = 1,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Girl = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "7-9", column = 1,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Boy = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "10-12", column = 1,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Blue = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "1-3", column = 5, 
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Red = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "4-6", column = 5,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Yellow = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "7-9", column = 5,
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Green = { 
		sprite = charactersSprite, grid = charactersGrid,
		lines = "10-12", column = 5, 
		width = charactersGrid.frameWidth, height = charactersGrid.frameHeight,
	},
	Orc = { 
		sprite = orcSprite, grid = orcGrid,
		lines = "1-3", column = 1, 
		max_healthpoints = 3,
		width = orcGrid.frameWidth, height = orcGrid.frameHeight,
		killable = true, dangerous = true
	},
	Goblin = { 
		sprite = goblinSprite, grid = goblinGrid,
		lines = "1-3", column = 1, 
		max_healthpoints = 1,
		width = goblinGrid.frameWidth, height = goblinGrid.frameHeight,
		killable = true, dangerous = true
	},
}

function characterAnimations(character)
	local lines = character.lines
	local column = character.column
	local grid = character.grid
	return {
		anim8.newAnimation(grid(lines, column + 0), 0.1),
		anim8.newAnimation(grid(lines, column + 1), 0.1),
		anim8.newAnimation(grid(lines, column + 2), 0.1),
		anim8.newAnimation(grid(lines, column + 3), 0.1),
	}
end
