Background = {}

Background.background_images = {}


function Background:load_background()
    local GRASS_SIZE = 32
    local image = love.graphics.newImage("assets/Background/Grass_batch.png") --TODO do everything in a tile_map
    self.sprite_batch = love.graphics.newSpriteBatch(image)

    local quad_table = {}

    for x = 0, image:getWidth() / 32 - 1 do
        for y = 0, image:getHeight() / 32 - 1 do
            table.insert(quad_table, {
                grass_quad = love.graphics.newQuad((x * GRASS_SIZE), (y * GRASS_SIZE), GRASS_SIZE, GRASS_SIZE, image:getDimensions())
            })
        end
    end

    for x = 0, love.graphics.getWidth(), GRASS_SIZE do
        for y = 0, love.graphics.getHeight(), GRASS_SIZE do
            local quad = quad_table[math.random(#quad_table)].grass_quad

                table.insert(self.background_images, {
                    quad = quad,
                    x = x,
                    y = y,
                })
        end
    end
end


function Background:draw_background()
    self.sprite_batch:clear()
    for _, entity in ipairs(self.background_images) do
        self.sprite_batch:add(entity.quad, entity.x, entity.y)
    end
    love.graphics.draw(self.sprite_batch)
end

