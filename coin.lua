require("math")


Coin = {}


function Coin:load()
    self.x_position = 40
    self.y_position = 12
    self.collection_score = 1
    self.sprite = love.graphics.newImage("assets/Coin/sprite.png")
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
end

function Coin:update(dt)

end

function Coin:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
end


function Coin:on_collect(entity)
    entity.score = entity.score + self.collection_score
    self.y_position = math.random(0, SCREEN_HEIGHT - self.height)
    self.x_position = math.random(0, SCREEN_WIDTH - self.width)
end

