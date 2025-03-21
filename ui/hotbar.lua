Hotbar = {}

function Hotbar:load()
    self.contents = {}
    self.sprite = love.graphics.newImage("assets/ui/inventory/hotbar.png")
    self.height = self.sprite:getHeight()
    self.width = self.sprite:getWidth()
    self.x_position = (SCREEN_WIDTH - self.width) / 2
    self.y_position = SCREEN_HEIGHT - self.height - 12
end


function Hotbar:update()
end

function Hotbar:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
end


