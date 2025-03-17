require("player")
require("graphics")
require("coin")


function love.load()
    -- initialize Globals
    PIXEL_SIZE = 5.0
    SCREEN_WIDTH = love.graphics.getWidth() / PIXEL_SIZE
    SCREEN_HEIGHT = love.graphics.getHeight() / PIXEL_SIZE

    --initialize graphics
    Graphics:load_canvas()

    --initialize Player (TODO: do it for all entities in one function)
    Player:load()
    Coin:load()


    scoring_display = love.graphics.newText(love.graphics.setNewFont(11), Player.score)
end

function love.update(dt)
    Player:update(dt)
    Coin:update(dt)
    scoring_display:set(Player.score)
end

function love.draw()
    Graphics:setup_canvas()

    Graphics:render_entities()

    Graphics:render_canvas()

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

