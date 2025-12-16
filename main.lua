-- alias
    lg = love.graphics
    sin = math.sin; cos = math.cos; pi = math.pi
    bg = lg.clear; fg = lg.setColor
    rand = love.math.random

require 'load'

require 'asset' -- loads global entities and data.
require 'script' -- tools for progressing dialogue.
require 'dialogue' -- tools for showing dialogue.
require 'sprite' -- tools for clickable entities.
require 'state' -- love.update functions.
require 'misc' -- leftover functions.

require '/asset/text/script-00'

require 'scene' -- general scene transition functions.
require 'scene-camp' -- kämppä

t = 0

function love.update()
    if t==0 then
        if not SKIP then asset.wav['scream']:play() end
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
                    local rb = 0 -- rectangle bounce
                    if j==3 then rb = SW/10 end
                    --love.graphics.rectangle('fill',cx,cy,SW/10+24*2,SW/10+24*2)
                    love.graphics.polygon('fill',cx-(SW/10+ro*2),cy+(j-1)*(SW/5)+rb,
                                                 cx,cy-(SW/10+ro*2)+(j-1)*(SW/5)+rb,
                                                 cx+(SW/10+ro*2),cy+(j-1)*(SW/5)+rb,
                                                 cx,cy+(SW/10+ro*2)+(j-1)*(SW/5)+rb)
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
        lg.setFont(asset.font['1'])
        local fw = lg.getFont():getWidth(title) -- font width
        lg.setColor(0.74+0.08+sin(t*0.02)*0.22,0.74+0.05,0.74+0.1*3)
        lg.print(title,SW/2-fw/2,63+23)
        --lg.setColor(0.44+0.08+sin(t*0.023)*0.22,0.44+0.05,0.44+0.1*5)
        --lg.print(title,SW/2-fw/2,63+23+23-9)
        lg.setColor(0.44+0.08+sin(t*0.024)*0.22,0.44+0.05,0.44+0.1)
        lg.print(title,SW/2-fw/2,63+23+23+23)

        local yo = -45-2 -- ylioppilas which translates to yläoikea which translates to y offset
        local msg = '[      PLAY      ]'
        lg.setFont(asset.font['2-1'])
        lg.setColor(0.74+0.08+sin(t*0.02)*0.22,0.74+0.05,0.74+0.1*3)
        local fw = lg.getFont():getWidth(msg)
        lg.print(msg,SW/2-fw/2,SH/2+yo)

        local yo2 = -14 -- ylioppilas II: electric boogaloo
        local msg = 'GAME'
        lg.setFont(asset.font['2-2'])
        local fw = lg.getFont():getWidth(msg)
        lg.print(msg,SW/2-fw/2,SH/2+144+yo+yo2)
        local msg = 'SET'
        local fw = lg.getFont():getWidth(msg)
        lg.print(msg,SW/2-fw/2,SH/2+144+52+yo+yo2)
        local msg = 'NO.'
        local fw = lg.getFont():getWidth(msg)
        lg.print(msg,SW/2-fw/2,SH/2+144+52+52+yo+yo2)

    lg.setCanvas()
        lg.draw(asset.draw['maincanvas'])
end

scene_launch('camp') -- showtime.

function love.draw()
    lg.setCanvas(asset.draw['maincanvas'])
        if not bg_img then bg(0.8-0.6,0.8-0.6,0.8-0.6,1.0)
        else fg(1,1,1,1); lg.draw(bg_img,-120,-240,0,0.25) end

        dialoguedraw()

        fg(1,1,1,1)
            inventorydraw()

            for i,obj in ipairs(scene) do
                spritedraw(obj)
            end
            for i=#scene,1,-1 do
                local obj = scene[i]
                if spritehover(obj) then fg(0.4,1,0.4,1); spritedraw(obj); break end
            end

            --if #inventory>0 then
                --lg.setFont(touko.font)
                    --fg(0.4-0.15,0.8-0.15,0.5-0.15)
                    --local msg = string.format('< %d/%d >',#inventory,inventory.max)
                    --lg.print(msg,touko.x+touko.img:getWidth()/4-lg.getFont():getWidth(msg)/2,touko.y-20)
            --end

    lg.setCanvas()
        fg(1,1,1,1)
        lg.draw(asset.draw['maincanvas'],0,0)
end