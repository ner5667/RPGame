require("player")
require("graphics")


function love.load()
    -- initialize Globals
    PIXEL_SIZE = 5.0
    SCREEN_WIDTH = love.graphics.getWidth() / PIXEL_SIZE
    SCREEN_HEIGHT = love.graphics.getHeight() / PIXEL_SIZE

    --initialize graphics
    Graphics:load_canvas()

    --initialize Player (TODO: do it for all entities in one function)
    Player:load()


    scoring_display = love.graphics.newText(love.graphics.setNewFont(11), Player.score)
end

function love.update(dt)
    Player:update(dt)
    scoring_display:set(Player.score)
end

function love.draw()
    Graphics:setup_canvas()

    Graphics:render_entities()

    Graphics:render_canvas()

    local r, g, b = love.math.colorFromBytes(86, 179, 192)
    love.graphics.setBackgroundColor(r, g, b)
end



