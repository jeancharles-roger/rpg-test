local anim8 = require 'libraries.anim8'

function initializeEnemies(map, world, enemies)
    local layer = map:addCustomLayer("Enemis", 2)
    layer.enemies = enemies
    layer.animations = {}

    layer.sprite = love.graphics.newImage("pixmaps/orc.png")
	local grid = anim8.newGrid(30, 40, layer.sprite:getWidth(), layer.sprite:getHeight())
    -- TODO use a loop to construct animations
    layer.animations["Orc"] = {
		anim8.newAnimation(grid("1-3", 1), 0.1),
        anim8.newAnimation(grid("1-3", 2), 0.1),
		anim8.newAnimation(grid("1-3", 3), 0.1),
		anim8.newAnimation(grid("1-3", 4), 0.1),
	}

    -- Ajoute les enemies dans world pour les collisions
    for name, enemy in pairs(layer.enemies) do
        -- On peut le tuer
        enemy.killable = true
        
        if enemy.class == "Orc" then
            enemy.width = 30
            enemy.height = 40
            enemy.healthpoints = 2
            enemy.maxhealthpoints = 2
        else
            enemy.width = 20
            enemy.height = 30
            enemy.healthpoints = 1
            enemy.maxhealthpoints = 1
        end

        world:add(enemy, enemy.x, enemy.y, enemy.width, enemy.height)
    end

    layer.update = function(self, dt)
        for name, animations in pairs(self.animations) do
            for index, animation in pairs(animations) do
                animation:update(dt)
            end
        end
	end

    layer.draw = function(self)

        for name, enemy in pairs(self.enemies) do
            if enemy.healthpoints > 0 then 
                local animation = self.animations[enemy.class]
                if animation ~= nil then 
                    animation[1]:draw(
                        self.sprite, 
                        math.floor(enemy.x),
                        math.floor(enemy.y),
                        0,
                        1,
                        1,
                        enemy.ox,
                        enemy.oy
                    )

                    -- Hitbox
                    --love.graphics.rectangle("line", enemy.x, enemy.y, enemy.width, enemy.height)

                else
                    love.graphics.print(name, enemy.x, enemy.y)
                end
            end
        end

	end

end