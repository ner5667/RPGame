Heart_display = {}


function Heart_display:load()
    local image = love.graphics.newImage("assets/ui/hearts/full_heart.png")
    self.width, self.height = image:getDimensions()

    self.current_hearts = Player.max_health

    self.sprite_batch = love.graphics.newSpriteBatch(image)
    self.hearts_quad = {
        heart_1 = love.graphics.newQuad(0, 0, self.height, self.width, image:getDimensions()),
        heart_2 = love.graphics.newQuad(0, 0, self.height, self.width, image:getDimensions()),
        heart_3 = love.graphics.newQuad(0, 0, self.height, self.width, image:getDimensions()),
    }


    self.x_position = SCREEN_WIDTH - (self.current_hearts * self.width)
    self.y_position = 0
end

function Heart_display:draw()
    self.sprite_batch:clear()
    local counter = 0 -- this is horrendous programming
    for i, heart in pairs(self.hearts_quad) do
        self.sprite_batch:add(heart, self.x_position + counter * self.width, self.y_position)
        counter = counter + 1
    end

    love.graphics.draw(self.sprite_batch)
end



Score_display = {}

function Score_display:load()
    self.font_size = 40
    self.obj = love.graphics.newText(love.graphics.setNewFont(self.font_size), Player.score)
    self.x_position = 0
    self.y_position = 0
end

function Score_display:update()
    self.obj:set(Player.score)
end

function Score_display:draw()
    love.graphics.draw(self.obj, self.x_position, self.y_posiiton)
end

