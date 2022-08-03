
function throwBoomerang(boomerang)
    if boomerang.thrown == nil then
        boomerang.x = boomerang.player.x + boomerang.player.ox
        boomerang.y = boomerang.player.y + boomerang.player.oy  
        boomerang.world:update(boomerang, boomerang.x, boomerang.y)      
        boomerang.thrown = {
            time = 0,
            dx = boomerang.player.dx,
            dy = boomerang.player.dy,
            comming_back = false,
        }
    end
end

function displayBoomerang(boomerang) 
    if boomerang.thrown ~= nil then
        boomerang.animation:draw(
            boomerang.sprite, 
            boomerang.x,
            boomerang.y,
            0,
            1,
            1,
            boomerang.player.ox,
            boomerang.player.oy
        )
    end

end

function updateBoomerang(boomerang, dt) 
    boomerang.animation:update(dt)
    
    if boomerang.thrown ~= nil then 
        boomerang.thrown.time = boomerang.thrown.time + dt    
        
        if boomerang.thrown.comming_back then
            local dx = boomerang.player.x + boomerang.player.ox - boomerang.x
            local dy = boomerang.player.y + boomerang.player.oy - boomerang.y
            if math.abs(dx) > 2 or math.abs(dy) > 2 then
                -- fait revenir le boomerang
                local norm = math.sqrt(dx*dx + dy*dy)   
                
                boomerang.x = boomerang.x + dx/norm * boomerang.speed * dt
                boomerang.y = boomerang.y + dy/norm * boomerang.speed * dt
            else 
                -- arrete le lancer
                boomerang.thrown = nil
            end
        else
            -- fait partir le boomerang
            boomerang.x = boomerang.x + boomerang.thrown.dx * boomerang.speed * dt
            boomerang.y = boomerang.y + boomerang.thrown.dy * boomerang.speed * dt
            
            if boomerang.thrown.time >= boomerang.out_time then
                -- le boomerang doit revenir
                boomerang.thrown.comming_back = true
            end
        end

        
        local function filter(item, other)
            -- filtre les objets en collision, les trous ne bloquent pas le boomerang
            if other == boomerang.player then
                return false
            elseif other.layer and other.layer.name == "Trous" then
                return false
            elseif other.healthpoints ~= nil and other.healthpoints <= 0 then
                return false
            else
                return "slide"
            end
        end

        -- ne mets pas à jour boomerang.x et boomerang.y cela permet au boomerang de rentrer à travers les objets
        _, _, collisions = boomerang.world:move(boomerang, boomerang.x, boomerang.y, filter)
        
        -- si il y a une collision, le boomerang doit revenir
        if #collisions > 0 and boomerang.thrown then
            boomerang.thrown.comming_back = true
            
            -- Teste si la collision peut-être tuée ?
            local collision = collisions[1]
            local element = collision.other
            if element.killable == true then
                element.healthpoints = element.healthpoints - 1
                if element.healthpoints < 0 then
                    element.healthpoints = 0
                end
            end
        end
    
    end

end

function createBoomerang(world, player)

    -- Objet du joueur
    local sprite = love.graphics.newImage("pixmaps/Boomerang.png")
    local grid = anim8.newGrid(16, 16, sprite:getWidth(), sprite:getHeight())

    local boomerang = { 
        world = world,
        player = player,
        sprite = sprite,
        grid = grid,
        animation = anim8.newAnimation(grid("1-8", 1), 0.05),
        speed = 300,
        out_time = 0.35,
        max_out_time = 1.5,
        x = player.x,
        y = player.y,
        ox = 8,
        oy = 16,
        thrown = nil,
    }

    world:add(boomerang, boomerang.x, boomerang.y, 16, 16)
    return boomerang
end