

Player = Entity.new(0, 0, nil)

function Player:load()

    local reference_sprite = love.graphics.newImage("assets/Player/Player_sprite_1.png")
    local reference_width = reference_sprite:getWidth()
    local reference_height = reference_sprite:getHeight()


    local image = love.graphics.newImage("assets/Player/Player_sprite_map.png")
    self.sprite_batch = love.graphics.newSpriteBatch(image)
    self.facing_forward = {}
    self.facing_backward = {}
    self.facing_right = {}
    self.facing_left = {}

    local index = 1
    for y = 0, image:getHeight() - 1, reference_height do

        local quad_forward = love.graphics.newQuad(0, y, reference_width, reference_height, image:getDimensions())
        local quad_backward = love.graphics.newQuad(reference_width, y, reference_width, reference_height, image:getDimensions())
        local quad_right = love.graphics.newQuad(reference_width*2, y, reference_width, reference_height, image:getDimensions())
        local quad_left = love.graphics.newQuad(reference_width*3, y, reference_width, reference_height, image:getDimensions())
        self.facing_forward[index] = quad_forward
        self.facing_backward[index] = quad_backward
        self.facing_right[index] = quad_right
        self.facing_left[index] = quad_left

        index = index + 1
    end

    self.animation_counter = 1
    self.sprite = love.graphics.newQuad(0, 0, reference_width, reference_height, image:getDimensions())
    self.animation_used = self.facing_forward


    self.max_health = 5
    self.current_health = self.max_health

    self.movement_vector = {}
    self.movement_vector.vertical = 0
    self.movement_vector.horizontal = 0

    self.width = reference_width
    self.height = reference_height
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
    self:choose_animation()

    self.sprite_batch:add(self.sprite)
    love.graphics.draw(self.sprite_batch, self.x_position, self.y_position)
    self.sprite_batch:clear()


    --self.animation_counter = self.animation_counter + 1
    if self.animation_counter  > #self.animation_used then
        self.animation_counter = 1
    
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

end


function Player:choose_animation()
    if self.movement_vector.vertical == 1 then
        self.animation_used = self.facing_right
    elseif self.movement_vector.vertical == -1 then
        self.animation_used = self.facing_left
    elseif self.movement_vector.horizontal == 1 then
        self.animation_used = self.facing_forward
    elseif self.movement_vector.horizontal == -1 then
        self.animation_used = self.facing_backward
    end

    self.sprite = self.animation_used[self.animation_counter]
end


