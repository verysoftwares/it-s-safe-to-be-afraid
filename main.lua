-- alias
    lg = love.graphics
    sin = math.sin; cos = math.cos; pi = math.pi

require 'load'

t = 0

function love.update()
    if t==0 then
        --asset.wav['scream']:play()
        asset.wav['title']:play()
    end

    t = t+1
end

asset.draw = {}
asset.draw['maincanvas'] = lg.newCanvas(SW,SH)
asset.draw.color = {}
asset.draw.color['BG'] = {r=0.33,g=0.25,b=0.4}
--asset.draw.color['FG'] = {r=0.25*3,g=0.4,b=0.33*2}
asset.draw.color['FG'] = {r=0.64,g=0.64,b=0.64}

function love.draw()
    lg.setCanvas(asset.draw['maincanvas'])
        local bgc = asset.draw.color['BG']
            lg.setBackgroundColor(bgc.r,bgc.g,bgc.b+sin(t*0.02)*0.24)
            lg.clear()
        local fgc = asset.draw.color['FG']
            -- ei niistä koordinaattisekkoiluista
            -- tuu ikinä mittään, tehään polygoni
                for j=1,3 do for i=1,5 do
                    lg.setColor(fgc.r,fgc.g,fgc.b)
                    local ro = 0 -- rectangle size offset
                    local rs = SW/10+8 -- rectangle side offset
                    local cx,cy = rs-8+(i-1)*SW/5-ro,rs-8-ro+14
                    --love.graphics.rectangle('fill',cx,cy,SW/10+24*2,SW/10+24*2)
                    love.graphics.polygon('fill',cx-(SW/10+ro*2),cy+(j-1)*(SW/5),
                                                 cx,cy-(SW/10+ro*2)+(j-1)*(SW/5),
                                                 cx+(SW/10+ro*2),cy+(j-1)*(SW/5),
                                                 cx,cy+(SW/10+ro*2)+(j-1)*(SW/5))
                end end
            -- even Einstein would struggle with
            -- coordinate systems within coordinate systems
                --for i=1,5 do
                    --lg.push()
                        --love.graphics.origin(64+i*SW/5,64)
                        --love.graphics.rotate(t*0.02)
                        --lg.setColor(fgc.r,fgc.g,fgc.b)
                        --love.graphics.origin(120/2,120/2)
                        --love.graphics.rotate(t*0.02)
                        --lg.rectangle('fill',64-12+(i-1)*SW/5,0,120,120)
                    --lg.pop()
                --end
            --lg.rectangle('fill',0+120,0+120,SW-120*2,SH-120*2)
            -- why does this give me black??
                --lg.setColor(bgc.r,bgc.g,bgc.b)
                --lg.rectangle('fill',0+120*1.5,0+120*1.5,SW-120*1.5*2,SH-120*1.5*2)
    lg.setCanvas()
        lg.draw(asset.draw['maincanvas'])
end