local anim8 = require 'libraries.anim8'

function throwBoomerang(boomerang)
    if boomerang.thrown == nil then
        boomerang.thrown = {
            time = 0,
            dx = boomerang.player.dx,
            dy = boomerang.player.dy,
            comming_back = false,
        }
    end
end

function displayBoomerang(boomerang) 
    local dx = math.abs(boomerang.player.x + boomerang.player.ox - boomerang.x)
    local dy = math.abs(boomerang.player.y + boomerang.player.oy - boomerang.y)
    if boomerang.thrown ~= nil and (dx > 4 or dy > 4) then
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

function updateBoomerang(boomerang, world, dt) 
    boomerang.animation:update(dt)

    if boomerang.thrown ~= nil then    
        if boomerang.thrown.comming_back then
            local dx = boomerang.player.x + boomerang.player.ox - boomerang.x
            local dy = boomerang.player.y + boomerang.player.oy - boomerang.y
            if math.abs(dx) > 2 or math.abs(dy) > 2  then
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
            boomerang.thrown.time = boomerang.thrown.time + dt 
            boomerang.x = boomerang.x + boomerang.thrown.dx * boomerang.speed * dt
            boomerang.y = boomerang.y + boomerang.thrown.dy * boomerang.speed * dt
            
            if boomerang.thrown.time >= boomerang.out_time then
                -- le boomerang doit revenir
                boomerang.thrown.comming_back = true
            end
        end
    else 
        -- place le boomerang sur le jouer si il n'est pas lanc??
        boomerang.x = boomerang.player.x + boomerang.player.ox
        boomerang.y = boomerang.player.y + boomerang.player.oy
    end
        
    local function filter(item, other)
        if other == boomerang.player then
            return false
        else 
            return "slide"
        end
    end
    boomerang.x, boomerang.y, collisions = world:move(boomerang, boomerang.x, boomerang.y, filter )
    -- il y a une collision, le boomerang doit revenir
    if #collisions > 0 and boomerang.thrown then
        boomerang.thrown.comming_back = true
    end
    
end

function createBoomerang(world, player)

    -- Objet du joueur
    local sprite = love.graphics.newImage("pixmaps/Boomerang.png")
    local grid = anim8.newGrid(16, 16, sprite:getWidth(), sprite:getHeight())

    local boomerang = { 
        player = player,
        sprite = sprite,
        grid = grid,
        animation = anim8.newAnimation(grid("1-8", 1), 0.05),
        speed = 300,
        out_time = 0.35,
        x = player.x,
        y = player.y,
        ox = 8,
        oy = 16,
        thrown = nil,
    }
    world:add(boomerang, boomerang.x, boomerang.y, 16, 16)
    return boomerang
end
