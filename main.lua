-- alias
    lg = love.graphics
    sin = math.sin; cos = math.cos

require 'load'

t = 0

function love.update()
    if t==0 then
        asset.wav['scream']:play()
        asset.wav['title']:play()
    end

    t = t+1
end

asset.draw = {}
asset.draw['maincanvas'] = lg.newCanvas(SW,SH)
asset.draw.color = {}
asset.draw.color['BG'] = {r=0.33,g=0.25,b=0.4}
asset.draw.color['FG'] = {r=0.25*3,g=0.4,b=0.33*2}

function love.draw()
    lg.setCanvas(asset.draw['maincanvas'])
        local bgc = asset.draw.color['BG']
            lg.setBackgroundColor(bgc.r,bgc.g,bgc.b)
            lg.clear()
        local fgc = asset.draw.color['FG']
            lg.setColor(fgc.r,fgc.g,fgc.b)
            lg.rectangle('fill',0+120,0+120,SW-120*2,SH-120*2)
            -- why does this give me black??
                --lg.setColor(bgc.r,bgc.g,bgc.b)
                --lg.rectangle('fill',0+120*1.5,0+120*1.5,SW-120*1.5*2,SH-120*1.5*2)
    lg.setCanvas()
        lg.draw(asset.draw['maincanvas'])
end