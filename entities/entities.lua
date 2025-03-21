Entities = {}

function Entities:load()
    for _, i in ipairs(self) do
        i:load()
    end
end

function Entities:update(dt)
    for _, i in ipairs(self) do
        i:update(dt)
    end
end

function Entities:draw()
    for _, i in ipairs(self) do
        i:draw()
    end
end

Entity = {}
Entity.__index = Entity

function Entity.new(spawn_x_position, spawn_y_position, sprite, add_to_entities_table)
    local newEntity = {}
    add_to_entities_table = add_to_entities_table or true
    
    setmetatable(newEntity, Entity)
    newEntity.__index = newEntity
    newEntity.super = self

    newEntity.x_position = spawn_x_position or 0
    newEntity.y_position = spawn_y_position or 0
    newEntity.sprite = sprite or nil
    if newEntity.sprite then
        newEntity.height, newEntity.width = newEntity.sprite:getDimensions()
    end

    function newEntity:load() end
    function newEntity:update() end
    function newEntity:draw()
        if self.sprite then
            love.graphics.draw(self.sprite, self.x_position, self.y_position)
        end
    end

    table.insert(Entities, newEntity)

    return newEntity
end