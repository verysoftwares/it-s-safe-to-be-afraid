scr_enter = {
    function() appear(aliisa) end,
    function() chat('O, the world of Dhamma is filled with light.') end,
    function() if #inventory==0 then script_start(scr_careful) else script_next() end end,
    function() chat('Ya been instagibbed my dude(s)!') end,
}