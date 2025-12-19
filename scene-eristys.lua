-- chapter 3

scr_intoeristys = {
    function() waitclick() end,
    function() appear(aliisa) end,
    function() chat('all the cakes are at home!',aliisa) end,
    function() bg_img = lg.newImage('/asset/visual/photo/er1stys.jpg'); chat(); waithard(1); end,
    function() chat('where do i find myself now.',aliisa); aliisa.x = aliisa.x+2 end,
    function() chat('right about where i am.',aliisa); aliisa1.x = aliisa1.x-1 end,
    function() chat('even when there\'s emptiness,',aliisa1) end,
    function() chat('sunyata,',aliisa) end,
    function() chat('there\'s still something.',aliisa1) end,
    function() chat('as you stare\nat the stars,',aliisa1) end,
    function() chat('you don\'t only see light,',aliisa1) end,
    function() chat('you also see,',aliisa) end,
    function() chat('the absence\nof light.',aliisa) end,
    function() chat('that is still not nothing, desho?',aliisa) end, 
    function() waithard(340) end, 
    function() chat('i had forgotten that,',aliisa1) end, 
    function() chat('this is why i need reminders.',aliisa1) end, 
    function() waithard(-1) end, 
    function() chat('that is why we need reminders.',aliisa) end, 
    function() waithard(444) end, 
    -- function() show('dr_pepper') end,
    function() chat('this \'dream\' sponsored by Dr. Pepper!1') end, 
    function() chat('authentic blend of 23 flavours!') end, 
    function() chat('or flavors if you\'re american.') end,

    --function() chat('angy aphorism time!',aliisa) end,

        --function() chat('aa well, sorry for not being able',aliisa1) end,
        --function() chat('sorry for not being able,',aliisa1) end,
        --function() chat('to afford a 1000€ sound system.',aliisa1) end,
}

function eristys_collect(obj)
    if obj.id=='cake' then 
        if not scr_cakeget.seen then script_start(scr_cakeget)
        elseif not scr_cakeget2.seen then script_start(scr_cakeget2)
        else script_start(scr_cakeget3) end
    end
    if obj==arska then script_start(scr_friend) end
    if obj==touko then script_start(scr_selfie) end
end

function eristys_use(obj)
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

function eristys_reset()
    scene = {aliisa,aliisa1}

    aliisa.x,aliisa.y = 0,SH-aliisa.img:getHeight()/2
    aliisa.x = aliisa.x-aliisa.img:getWidth()/2-20

    aliisa1.x,aliisa1.y = SW,SH-aliisa1.img:getHeight()/2
    --aliisa1.x = aliisa1.x-aliisa1.img:getWidth()/2-20
 
    script_collect = eristys_collect
    script_use = eristys_use

    bg_img = lg.newImage('/asset/visual/photo/er1stys.jpg')

    script_start(scr_intoeristys)
end

-- eristysselli scenario.
-- go as deep as you can.
-- from yours truly 2 you