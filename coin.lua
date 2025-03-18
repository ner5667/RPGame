require("math")
require("os")

math.randomseed(os.time())

Coin = {}


function Coin:load()
    self.x_position = 0
    self.y_position = 0
    self.collection_score = 1
    self.sprite = love.graphics.newImage("assets/Coin/coin.png")
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()

    --instantly get a new spawn point
    Coin:on_collect(nil)
end

function Coin:update(dt)

end

function Coin:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_position)
end


function Coin:on_collect(entity)
     if entity then entity.score = entity.score + self.collection_score end
    self.y_position = math.random(0, SCREEN_HEIGHT - self.height)
    self.x_position = math.random(0, SCREEN_WIDTH - self.width)
end

