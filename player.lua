

Player = {}

function Player:load()
    self.x_position = 50
    self.y_position = 50
    self.sprites = {}
    for i = 1, 4, 1 do
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
    if check_collision(self, Coin) then
        Coin:on_collect(self)
    end
end


function Player:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
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
    local movement_vector = {}
    movement_vector.vertical = 0
    movement_vector.horizontal = 0

    if love.keyboard.isDown("w") then
        movement_vector.vertical = -1
        self.current_animation = 2
    end
    if love.keyboard.isDown("s") then
        movement_vector.vertical = 1
        self.current_animation = 1
    end
    if love.keyboard.isDown("a") then
        movement_vector.horizontal = -1
        self.current_animation = 4
    end
    if love.keyboard.isDown("d") then
        movement_vector.horizontal = 1
        self.current_animation = 3
    end

    local adjusted_speed = self.speed
    if movement_vector.horizontal ~= 0 or movement_vector.vertical ~= 0  then
        adjusted_speed = adjusted_speed / 1.5
    end
    self.x_position = self.x_position + movement_vector.horizontal * adjusted_speed * dt
    self.y_position = self.y_position + movement_vector.vertical * adjusted_speed * dt
    
    
    self.sprite = self.sprites[self.current_animation]
end



