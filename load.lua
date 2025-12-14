asset = {}
asset.wav = {}

function love.load()
    asset.wav['scream'] = love.audio.newSource('/asset/audio/voice/screaming.wav','static')
    asset.wav['title'] = love.audio.newSource('/asset/audio/musa/to be afraid.wav','stream')
end