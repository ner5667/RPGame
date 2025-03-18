require("player")
require("graphics")
require("coin")

-- initialize Globals
PIXEL_SIZE = 5.0


function love.load()
    SCREEN_WIDTH = love.graphics.getWidth()
    SCREEN_HEIGHT = love.graphics.getHeight()

    --initialize graphics
    Graphics:load_canvas()

    Player:load()
    Coin:load()

    Graphics:load_background()

    background_grass_images = {}
    for i = 1, 3, 1 do 
        background_grass_images[i] = love.graphics.newImage("assets/Background/Grass_" .. tostring(i) .. ".png")
    end

    test_batch = love.graphics.newSpriteBatch(background_grass_images[1], 12)


    scoring_display = love.graphics.newText(love.graphics.setNewFont(11), Player.score)
end

function love.update(dt)
    Player:update(dt)
    Coin:update(dt)
    scoring_display:set(Player.score)
end

function love.draw()


    Graphics:draw_background()
    Graphics:render_entities()

    Player:draw()


    local r, g, b = love.math.colorFromBytes(201, 226, 158)
    love.graphics.setBackgroundColor(r, g, b)

end


function check_collision(a, b)
    if a.x_position + a.width > b.x_position and 
        a.x_position < b.width + b.x_position and
        a.y_position + a.height > b.y_position and
        a.y_position < b.height + b.y_position 
    then
        return true
    else
        return false
    end
end

