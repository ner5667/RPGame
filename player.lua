

Player = {}

function Player:load()
    self.x_position = 50
    self.y_postion = 50
    self.sprite = love.graphics.newImage("assets/Aseprite/Player_sprite_1.png")
    self.width = self.sprite:getHeight()
    self.height = self.sprite:getHeight()
    self.speed = 120
    self.score = 12
end

function Player:update(dt)
    self:move(dt)
    self:check_out_of_bounds()
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



