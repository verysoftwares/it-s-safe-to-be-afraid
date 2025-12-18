scr_incamp = {
    function() waitclick() end,
    function() appear(aliisa) end,
    --function() chat('All the cakes are at home!') end,
    function() chat('woah i can see myself on screen',aliisa) end,
    function() chat('that\'s pretty rad!',aliisa) end,
    function() appear(aliisa1) end,
    function() chat('screen? mikA vitun screen.',aliisa1) end,
    function() chat('this is Section\n87 ettAs tiiAt.',aliisa1) end,
    function() chat('..',aliisa) end,
    function() chat('...',aliisa1) end,
    function() waitsoft(160) end,
    function() chat('.. well do you wanna move on.',aliisa1) end,
    function() chat('.. which one of\nus said that.',aliisa) end,
    function() chat('yo don\'t ask\nsuch difficult,',aliisa) end,
    function() chat('questions,',aliisa) end,
    function() chat('at 11.26 AM in\nthe morning,',aliisa) end,
    function() chat('!',aliisa); waithard(50) end,
    function() chat('eikAku \'.\'',aliisa); waithard(25) end,
    function() waitsoft(180) end,
    function() chat('well do we have some kinda,',aliisa1) end,
    function() chat('<< referaatti >>.',aliisa1) end,
    function() chat('yea i just dru one. imeanwrote',aliisa) end,
    function() chat('would you paraphrase?',aliisa) end,
    function() chat('whoops that\nwas you now,',aliisa) end,
    function() chat('eikOs juu.',aliisa) end,
    function() chat('juu',aliisa1) end,
    function() chat('the note, i\nmean drawing,',aliisa1) end,
    function() chat('goes as\nfollows:',aliisa1) end,
    function() waithard(280) end,
    function() chat('i forgot lmao',aliisa1) end,
    function() chat('lmao',aliisa) end,
    function() if #inventory==inventory.max then script_start(scr_cafefull) else script_next() end end,
}

function camp_collect(obj)
    if obj.id=='cake' then 
        if not scr_cakeget.seen then script_start(scr_cakeget)
        elseif not scr_cakeget2.seen then script_start(scr_cakeget2)
        else script_start(scr_cakeget3) end
    end
    if obj==arska then script_start(scr_friend) end
    if obj==touko then script_start(scr_selfie) end
end

function camp_use(obj)
    if obj.id=='cake' then
        if flags.steal then script_start(scr_cantpay); flags.steal = false
        else script_start(scr_cakeadmire) end
    end
    if obj.id=='leaf' then 
        if flags.steal then script_start(scr_leafpay)
        else script_start(scr_leafadmire) end
    end
    if obj.id=='map' then script_start(scr_locatecafe) end
    if obj==touko then script_start(scr_selfie2) end
end

function camp_reset()
    --bg_img = cafe_bg

    scene = {aliisa,aliisa1}

    aliisa.x,aliisa.y = 0,SH-aliisa.img:getHeight()/2
    aliisa.x = aliisa.x-aliisa.img:getWidth()/2-20

    aliisa1.x,aliisa1.y = SW,SH-aliisa1.img:getHeight()/2
    --aliisa1.x = aliisa1.x-aliisa1.img:getWidth()/2-20
 
    script_collect = camp_collect
    script_use = camp_use

    bg_img = lg.newImage('/asset/visual/photo/section 87.jpg')

    script_start(scr_incamp)
end
