M = {}






function M:load()


    local r, g, b = love.math.colorFromBytes(105, 158, 252)
    love.graphics.setBackgroundColor(r, g, b)

    text = love.graphics.newText(love.graphics.setNewFont(50), Player.score)
    text_x = (love.graphics.getWidth() - text:getWidth()) / 2
    text_y = (love.graphics.getHeight() - text:getHeight()) / 2

    Menu_buttons = {}

    local image = love.graphics.newImage("assets/UI/menu/menu_button_selected.png")

    button_1 = Menu_button.new(
        (love.graphics.getWidth() - image:getWidth()) / 2,
        25,
        function()
            state.ingame:load()
            state.current_state = state.ingame
        end,
        "PLAY"
    )
    button2 = Menu_button.new(
        (love.graphics.getWidth() - image:getWidth()) / 2,
        75 + image:getHeight() * 2,
        function()
            love.event.quit(0)
        end,
        "QUIT"
    )

    cursor = {
    index = 1,
    max = #Menu_buttons}
end




function M:update(dt)
    text:set(cursor.index)
    for i, button in ipairs(Menu_buttons) do
        button.is_selected = i == cursor.index
        button:update(dt)
    end
end



function M:draw()
    love.graphics.draw(text, text_x, text_y)
    for _, button in pairs(Menu_buttons) do
        button:draw()
    end
end

function M.keypressed(key)
    if key == "s" then
        if cursor.index < cursor.max then
            cursor.index = cursor.index + 1
        else
            cursor.index = 1
        end
    end
    if key == "w" then
        if cursor.index > 1 then
            cursor.index = cursor.index - 1
        else
            cursor.index = cursor.max
        end
    end
    if key == "space" then
        Menu_buttons[cursor.index].action()
    end
end

return M
