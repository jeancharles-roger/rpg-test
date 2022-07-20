local anim8 = require 'libraries.anim8'

function throwBoomerang(self)
    if self.thrown == nil then
        self.thrown = {
            time = 0,
            dx = self.player.dx,
            dy = self.player.dy,
            comming_back = false,
        }
    end
end

function displayBoomerang(self) 
    local dx = math.abs(self.player.x + self.player.ox - self.x)
    local dy = math.abs(self.player.y + self.player.oy - self.y)
    if self.thrown ~= nil and (dx > 4 or dy > 4) then
        self.animation:draw(
            self.sprite, 
            math.floor(self.x),
            math.floor(self.y),
            0,
            1,
            1,
            self.player.ox,
            self.player.oy
        )
    end

end

function updateBoomerang(self, dt) 
    self.animation:update(dt)


    if self.thrown ~= nil then    
        if self.thrown.comming_back then
            local dx = self.player.x + self.player.ox - self.x
            local dy = self.player.y + self.player.oy - self.y
            if math.abs(dx) > 2 or math.abs(dy) > 2  then
                -- fait revenir le boomerang
                local norm = math.sqrt(dx*dx + dy*dy)   
                
                self.x = self.x + dx/norm * self.speed * dt
                self.y = self.y + dy/norm * self.speed * dt
            else 
                -- arrete le lancer
                self.thrown = nil
            end
        else
            -- fait partir le boomerang
            self.thrown.time = self.thrown.time + dt 
            self.x = self.x + self.thrown.dx * self.speed * dt
            self.y = self.y + self.thrown.dy * self.speed * dt
            
            if self.thrown.time >= self.out_time then
                -- le boomerang doit revenir
                self.thrown.comming_back = true
            end
        end
    else 
        -- place le boomerang sur le jouer si il n'est pas lancé
        self.x = self.player.x + self.player.ox
        self.y = self.player.y + self.player.oy
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
        speed = 450,
        out_time = 0.3,
        x = player.x,
        y = player.y,
        ox = 8,
        oy = 16,
        thrown = nil,
    }
    world:add(boomerang, boomerang.x, boomerang.y, 16, 16)
    return boomerang
end
