

Player = Entity.new(0, 0, nil)

function Player:load()
    self.sprites = {}
    --TODO implement playermap here + keep animations in mind (do a table of tables w different animations?)
    for i = 1, 4, 1 do
        self.sprites[i] = love.graphics.newImage("assets/Player/Player_sprite_" .. tostring(i) .. ".png")
    end
    self.current_animation = 1
    self.sprite = self.sprites[self.current_animation]

    self.max_health = 5
    self.current_health = self.max_health

    self.movement_vector = {}
    self.movement_vector.vertical = 0
    self.movement_vector.horizontal = 0

    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    self.base_speed = 450
    self.score = 0
end

function Player:update(dt)
    self:move(dt)
    self:check_out_of_bounds()
    if check_collision(self, Coin) then
        Coin:on_collect(self)
    end
end

function Player:check_out_of_bounds()
    if self.x_position < 0 then
        self.x_position = 0
    end
    if self.x_position > love.graphics.getWidth() - self.width then
        self.x_position = love.graphics.getWidth() - self.width
    end
    if self.y_position > love.graphics.getHeight() - self.height then
        self.y_position = love.graphics.getHeight() - self.height
    end
    if self.y_position < 0 then
        self.y_position = 0
    end
end



function Player:move(dt)
    local adjusted_speed = self.base_speed

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

    if self.movement_vector.vertical and self.movement_vector.horizontal then
        adjusted_speed = adjusted_speed / 1.4
    end



    self.x_position = self.x_position + self.movement_vector.horizontal * adjusted_speed * dt
    self.y_position = self.y_position + self.movement_vector.vertical * adjusted_speed * dt

    self.movement_vector.vertical = 0
    self.movement_vector.horizontal = 0


    self.sprite = self.sprites[self.current_animation]
end



