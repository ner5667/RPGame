

Player = {}

function Player:load()
    self.x_position = 50
    self.y_postion = 50
    self.sprites = {}
    for i = 1, 1, 1 do
        self.sprites[i] = love.graphics.newImage("assets/Player/Player_sprite_" .. tostring(i) .. ".png")
    end
    self.current_animation = 1
    self.sprite = self.sprites[self.current_animation] 

    self.width = self.sprite:getHeight()
    self.height = self.sprite:getHeight()
    self.speed = 120
    self.score = 0
end

function Player:update(dt)
    self:move(dt)
    self:check_out_of_bounds()
    --TODO this should only change when player char changes animation and not every frame
    self.sprite = self.sprites[self.current_animation]
end


function Player:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_postion)
end

function Player:check_out_of_bounds()
    if self.x_position < -0 then
        self.x_position = 0
    end
    if self.x_position > SCREEN_WIDTH - self.width then
        self.x_position = SCREEN_WIDTH - self.width
    end
end



function Player:move(dt) --remove straving from here
    if love.keyboard.isDown("w") then
        self.y_postion = self.y_postion - self.speed * dt
    end
    if love.keyboard.isDown("s") then
        self.y_postion = self.y_postion + self.speed * dt
    end
    if love.keyboard.isDown("a") then
        self.x_position = self.x_position - self.speed * dt
    end
    if love.keyboard.isDown("d") then
        self.x_position = self.x_position + self.speed * dt
    end
end



