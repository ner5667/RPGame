

M = {}

-- initialize Global variables
local inventory_out = false --TODO this is horrendous for wanting to expand on overlays but works for now


function M.load()
    SCREEN_WIDTH = love.graphics.getWidth()
    SCREEN_HEIGHT = love.graphics.getHeight()


    Entities:load()

    Hotbar:load()
    Inventory:load()
    Heart_display:load()
    Score_display:load()
    Overlay:push(Hotbar)
    Overlay:push(Heart_display)
    Overlay:push(Score_display)
    

    Background:load_background()

end

function M.update(dt)
    Entities:update(dt)
    Overlay.update(dt)
end

function M.draw()
    Background:draw_background()

    Entities:draw()

    Overlay:draw()
    Heart_display:draw()
end


function M.keypressed(key) 
    if key == "c" then -- debug
        Player.score = Player.score + 1
    end
    if key == "i" then
        if not inventory_out then
            Overlay:push(Inventory)
            inventory_out = true
        elseif inventory_out then
            Overlay:pop()
            inventory_out = false
        end
    end
    --debug
    if key == "up" then
        Player.current_health = Player.current_health + 1
    end
    if key == "down" then
        Player.current_health = Player.current_health - 1
    end
    if key == "left" then
        Player.max_health = Player.max_health + 1
    end
    if key == "right" then
        Player.max_health = Player.max_health - 1
    end
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


return M
