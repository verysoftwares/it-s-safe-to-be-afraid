asset = {}
    asset.wav = {}
    asset.font = {}

function love.load()
    asset.wav['scream'] = love.audio.newSource('/asset/audio/voice/screaming.wav','static')
    asset.wav['scream']:setVolume(0.5)
    asset.wav['scream']:seek(2-1)
    asset.wav['title'] = love.audio.newSource('/asset/audio/musa/to be afraid.wav','stream')
    asset.wav['title']:seek(7-1+0.5)

    asset.font['1'] = love.graphics.newFont('/asset/visual/font/DBorneo-CI.ttf',96)
    asset.font['2-1'] = love.graphics.newFont('/asset/visual/font/HelloCatround.ttf',96)
    asset.font['2-2'] = love.graphics.newFont('/asset/visual/font/HelloCatround.ttf',69)
end