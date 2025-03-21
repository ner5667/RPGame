Overlay = {}


function Overlay:pop()
    Overlay[#Overlay] = nil
end

function Overlay:pop_all()
    Overlay = {}
end

function Overlay:push(element)
    Overlay[#Overlay+1] = element
end

function Overlay:update()
    for _, element in ipairs(Overlay) do
        element:update()
    end
end

function Overlay:draw()
    for _, element in ipairs(Overlay) do
        element:draw()
    end
end


