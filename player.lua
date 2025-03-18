

Player = {}

function Player:load()
    self.x_position = 0
    self.y_position = 0
    self.sprites = {}
    for i = 1, 8, 1 do
        self.sprites[i] = love.graphics.newImage("assets/Player/Player_sprite_" .. tostring(i) .. ".png")
    end
    self.current_animation = 1
    self.sprite = self.sprites[self.current_animation] 

    self.movement_vector = {}
    self.movement_vector.vertical = 0
    self.movement_vector.horizontal = 0

    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    self.speed = 450
    self.score = 0
end

function Player:update(dt)
    self:move(dt)
    self:check_out_of_bounds()
    if check_collision(self, Coin) then
        Coin:on_collect(self)
    end
    self.score = love.timer.getFPS()
end


function Player:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
end

function Player:check_out_of_bounds()
    if self.x_position < 0 then
        self.x_position = 0
    end
    if self.x_position > love.graphics.getWidth() - self.width then
        self.x_position = love.graphics.getWidth() - self.width
    end
end



function Player:move(dt)
    local adjusted_speed = self.speed

    if love.keyboard.isDown("a") then
        self.movement_vector.horizontal = -1
        self.current_animation = 4
    end
    if love.keyboard.isDown("d") then
        self.movement_vector.horizontal = 1
        self.current_animation = 3
    end
    if love.keyboard.isDown("w") then
        self.movement_vector.vertical = -1
        self.current_animation = 2
    end
    if love.keyboard.isDown("s") then
        self.movement_vector.vertical = 1
        self.current_animation = 1
    end
    if love.keyboard.isDown("c") then
        print(Coin.x_position, Coin.y_position)
    end
    if love.keyboard.isDown("space") then
        print(self.x_position, self.y_position)
    end



    self.x_position = self.x_position + self.movement_vector.horizontal * adjusted_speed * dt
    self.y_position = self.y_position + self.movement_vector.vertical * adjusted_speed * dt

    self.movement_vector.vertical = 0
    self.movement_vector.horizontal = 0


    self.sprite = self.sprites[self.current_animation]
end



