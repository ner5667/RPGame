require("math")
require("os")

math.randomseed(os.time())



Coin = Entity.new(0, 0, love.graphics.newImage("assets/Coin/coin.png"))

function Coin:load()
    self.collection_score = 1

    --instantly get a new spawn point
    Coin:on_collect(nil)
end


function Coin:on_collect(entity)
     if entity then entity.score = entity.score + self.collection_score end
    self.y_position = math.random(0, SCREEN_HEIGHT - self.height)
    self.x_position = math.random(0, SCREEN_WIDTH - self.width)
end

