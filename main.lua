require("entities/entities")
require("entities/player")
require("entities/coin")
require("ui/inventory")
require("ui/ui")
require("ui/hotbar")
require("ui/graphics")



-- initialize Globals
inventory_out = false --TODO this is horrendous for wanting to expand on overlays but works for now



function love.load()
    SCREEN_WIDTH = love.graphics.getWidth()
    SCREEN_HEIGHT = love.graphics.getHeight()


    Entities:load()

    Inventory:load()
    Hotbar:load()
    Overlay:push(Hotbar)

    Graphics:load_background()


    scoring_display = love.graphics.newText(love.graphics.setNewFont(11), Player.score)
end

function love.update(dt)
    Entities:update(dt)
    Overlay.update()
    scoring_display:set(Player.score) --update, do this in Player
end

function love.draw()
    Graphics:draw_background()

    Entities:draw()

    Overlay:draw() -- TODO here score
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


function love.keypressed(key) 
    if key == "c" then -- debug
        Player.score = Player.score + 1
    end
    if key == "e" then
        if not inventory_out then
            Overlay:push(Inventory)
            inventory_out = true
        elseif inventory_out then
            Overlay:pop()
            inventory_out = false
        end
    end
end
