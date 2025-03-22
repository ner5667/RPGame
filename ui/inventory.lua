M = {}
Inventory = {}

local inventory_cursor = {
    index = 1,
    max = 2
}

function Inventory:load()
    self.contents = {}

    self.sprite = love.graphics.newImage("assets/ui/inventory/big_inventory.png")
    self.height = self.sprite:getHeight()
    self.width = self.sprite:getWidth()
    self.x_position = (SCREEN_WIDTH - self.width) / 2
    self.y_position = Hotbar.y_position + Hotbar.height - self.height
end


function Inventory:update()
end

function Inventory:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
end


