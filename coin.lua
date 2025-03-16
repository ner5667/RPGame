require("math")


Coin = {}


function Coin:load()
    self.x_position = 40
    self.y_postion = 280
    self.collection_score = 1
    self.sprite = love.graphics.newImage("assets/Coin/sprite.png", normal)
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    print(self.sprite)
end

function Coin:update(dt)
    if check_collision(self, Player) then
        print("Collected")
    end
    
end

function Coin:draw()
    love.graphics.draw(self.sprite, self.x_position, self.y_postion)
end

