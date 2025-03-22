Heart_display = {}


function Heart_display:load()
    local image = love.graphics.newImage("assets/ui/hearts/hearts_container.png")
    self.sprite_batch = love.graphics.newSpriteBatch(image)

    local image_width = image:getWidth()
    local image_height = image:getHeight()

    self.full_heart_quad = love.graphics.newQuad(0, 0, image_width / 2, image_height, image:getDimensions())
    self.empty_heart_quad = love.graphics.newQuad(image_width/2, 0, image_width / 2, image_height, image:getDimensions())

    self.width, self.height = image:getDimensions()
    self.width = self.width / 2 -- TODO Maybe do that a bit nicer?

    self.max_hearts = Player.max_health
    self.current_hearts = Player.current_health

    self.x_position = SCREEN_WIDTH - self.width
    self.y_position = 0
end

function Heart_display:update()
    self.max_hearts = Player.max_health
    self.current_hearts = Player.current_health
end

function Heart_display:draw()
    self.sprite_batch:clear()
    for counter = self.max_hearts-1, 0, -1 do
        local heart_to_add
        if self.current_hearts - counter >= 0 then
            heart_to_add = self.full_heart_quad
        else
            heart_to_add = self.empty_heart_quad
        end
        self.sprite_batch:add(heart_to_add, self.x_position - counter * self.width, self.y_position)
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

