
Graphics = {}

function Graphics:load_canvas()
    love.graphics.setDefaultFilter("nearest", "nearest", 0)
    self.canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
end


function Graphics:render_canvas()
    love.graphics.setCanvas()
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.canvas, 0, 0, 0, PIXEL_SIZE, PIXEL_SIZE)
end


function Graphics:setup_canvas()
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear(0, 0, 0, 0)
    love.graphics.setBlendMode("alpha")
end


function Graphics:render_entities()
    Player:draw()
    Coin:draw()
    love.graphics.draw(scoring_display, 0, 0)
end



