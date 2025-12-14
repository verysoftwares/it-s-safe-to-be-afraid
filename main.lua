require 'load'

t = 0

function love.update()
    if t==0 then
        asset.wav['scream']:play()
        asset.wav['title']:play()
    end

    t = t+1
end

function love.draw()
    
end