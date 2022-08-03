
charactersGridPositions = {
	{ "1-3", 1 },
	{ "4-6", 1 },
	{ "7-9", 1 },
	{ "10-12", 1 },
	{ "1-3", 5 },
	{ "4-6", 5 },
	{ "7-9", 5 },
	{ "10-12", 5 },
}

charactersSprite = love.graphics.newImage("pixmaps/Characters.png")
charactersGrid = anim8.newGrid(26, 36, charactersSprite:getWidth(), charactersSprite:getHeight())

function characterAnimations(characterId)
	local lines = charactersGridPositions[characterId][1]
	local column = charactersGridPositions[characterId][2]
	return {
		anim8.newAnimation(charactersGrid(lines, column + 1), 0.1),
		anim8.newAnimation(charactersGrid(lines, column + 0), 0.1),
		anim8.newAnimation(charactersGrid(lines, column + 3), 0.1),
		anim8.newAnimation(charactersGrid(lines, column + 2), 0.1),
	}
end
