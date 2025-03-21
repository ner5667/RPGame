require("entities/entities")
require("entities/player")
require("entities/coin")

require("ui/inventory")
require("ui/ui")
require("ui/hotbar")
require("ui/background")
require("ui/overlay")




state = {}

state.ingame = require("states/ingame")




function love.load()
    state.current_state = state.ingame
    state.current_state.load()
end

function love.update(dt)
    state.current_state.update(dt)
end

function love.draw()
    state.current_state.draw()
end
