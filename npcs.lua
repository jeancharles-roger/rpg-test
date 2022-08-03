
function initializeNpcs(map, world, npcs, player)
    local layer = map:addCustomLayer("PNJs", 2)
    layer.map = map
    layer.player = player
    layer.npcs = npcs
    -- layer.animations = {}

    -- Ajoute les npcs dans world pour les collisions
    for name, npc in pairs(layer.npcs) do
        
        local characterInfo = charactersInfos[npc.class]

        if characterInfo then
            npc.width = characterInfo.width
            npc.height = characterInfo.height
            npc.healthpoints = characterInfo.max_healthpoints
            npc.max_healthpoints = characterInfo.max_healthpoints
            npc.killable = characterInfo.killable or false
            npc.dangerous = characterInfo.dangerous or false

            npc.sprite = characterInfo.sprite
            npc.animations = characterAnimations(characterInfo)
        else
            npc.width = 20
            npc.height = 30
        end

        npc.moving = false

        world:add(npc, npc.x, npc.y, npc.width, npc.height)
    end

    layer.update = updateNpcs
    layer.draw = drawNpcs

end

function updateNpcs(self, dt)

    local scale = self.map.scale or 1
    local maxWidth = love.graphics.getWidth() / 1.70 / scale
    local maxHeight = love.graphics.getHeight() / 1.60 / scale

    for name, npc in pairs(self.npcs) do

        if npc.moving and npc.animations then
            for index, animation in pairs(npc.animations) do
                animation:update(dt)
            end
        end

        -- ressucite les enemis mort si ils sont loin du joueur
        if npc.healthpoints ~= nil and npc.healthpoints < npc.max_healthpoints then 
            local dx = math.abs(npc.x - self.player.x)
            local dy = math.abs(npc.y - self.player.y)
            if dx > maxWidth or dy > maxHeight then
                npc.healthpoints = npc.max_healthpoints
            end
        end
    end
end

function drawNpcs(self)
    for name, npc in pairs(self.npcs) do
        if npc.healthpoints == nil or npc.healthpoints > 0 then 
            if npc.animations ~= nil then 
                npc.animations[1]:draw(
                    npc.sprite, 
                    math.floor(npc.x),
                    math.floor(npc.y),
                    0,
                    1,
                    1,
                    npc.ox,
                    npc.oy
                )

                -- Hitbox
                --love.graphics.rectangle("line", enemy.x, enemy.y, enemy.width, enemy.height)

            else
                love.graphics.print(name, npc.x, npc.y)
            end
        end
    end
end