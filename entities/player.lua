

Player = Entity.new(0, 0, nil)

function Player:load()

    local reference_sprite = love.graphics.newImage("assets/Player/Player_sprite-1.png")
    local reference_height, local reference_width = reference_sprite:getDimensions()


    self.sprite = {
        local image = love.graphics.newImage("assets/Player/Player_sprite")
        sprite_batch = love.graphics.newSpriteBatch(image)
        facing_forward = {}
        facing_backward = {}
        facing_right = {}
        facing_left = {}

        for y = 0, image:getHeight(), reference_height do
            local quad_forward = love.graphics.newQuad(0, y, reference_sprite:getDimensions(), image:getDimensions())
            local quad_backward = love.graphics.newQuad(reference_width, y, reference_sprite:getDimensions(), image:getDimensions())
            local quad_right = love.graphics.newQuad(reference_width*2, y, reference_sprite:getDimensions(), image:getDimensions())
            local quad_left = love.graphics.newQuad(reference_width*3, y, reference_sprite:getDimensions(), image:getDimensions())
            local index = y / reference_height
            facing_forward[index] = quad_forward
            facing_backward[index] = quad_backward
            facing_right[index] = quad_right
            facing_left[index] = quad_left
        end

        animation_counter = 1
    }

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

function Player:draw()
    
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



