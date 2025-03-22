Menu_button = {}
Menu_button.__index = Menu_button


function Menu_button.new(x_position, y_position, action, text, add_to_button_table)
    local new_button = {}
    add_to_button_table = add_to_button_table or true

    setmetatable(new_button, Menu_button)
    new_button.__index = new_button
    new_button.super = self

    new_button.is_selected = false

    new_button.x_position = x_position or 0
    new_button.y_position = y_position or 0
    new_button.selected_sprite = love.graphics.newImage("assets/UI/menu/menu_button_selected.png")
    new_button.unselected_sprite = love.graphics.newImage("assets/UI/menu/menu_button_unselected.png")
    new_button.sprite = new_button.unselected_sprite

    new_button.height = new_button.selected_sprite:getHeight()
    new_button.width = new_button.sprite:getWidth()


    new_button.action = action or function()
        print("No Function given as Argument to this button")
    end

    new_button.text_object = love.graphics.newText(love.graphics.setNewFont(20), text or ("Button" .. tostring(#Menu_buttons)))
    new_button.text_width, new_button.text_height = new_button.text_object:getDimensions()
    new_button.text_x_position = new_button.x_position + (new_button.width - new_button.text_object:getWidth()) / 2
    new_button.text_y_position = new_button.y_position + (new_button.height - new_button.text_object:getHeight()) / 2


    function new_button:load() end

    function new_button:update(dt)
        if new_button.is_selected then
            new_button.sprite = new_button.selected_sprite
        else
            new_button.sprite = new_button.unselected_sprite
        end
    end

    function new_button:draw()
        love.graphics.draw(self.sprite, self.x_position, self.y_position)
        love.graphics.draw(self.text_object, self.text_x_position, self.text_y_position)
    end


    if add_to_button_table then
        table.insert(Menu_buttons, new_button)
    end

    return new_button
end
