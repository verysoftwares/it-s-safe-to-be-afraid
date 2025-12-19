function assetload()
    aliisa = {}
    imgsrc(aliisa,'aliisa-LV2.png')
    fontsrc(aliisa,'HelloCatround.ttf')
    aliisa.id = 'Aliisa'
    aliisa.col = {r=0.9-0.15,g=0.4-0.15,b=0.5-0.15}
    
    aliisa1 = {}
    imgsrc(aliisa1,'aliisa-LV1.png')
    fontsrc(aliisa1,'HelloCatround.ttf')
    aliisa1.id = 'aliisa'
    aliisa1.col = {r=0.9-0.15,g=0.4-0.15,b=0.5-0.15}

    sounds = {}
end

function imgsrc(obj,src)
    -- the ImageData is needed for reading pixel colors.
    obj.imgdata = love.image.newImageData(string.format('/asset/visual/sprite/%s',src))
    obj.img = lg.newImage(obj.imgdata)
end

function fontsrc(obj,src)
    obj.font = lg.newFont(string.format('/asset/visual/font/%s',src),48+8+8)
    obj.fontsmol = lg.newFont(string.format('/asset/visual/font/%s',src),28+12)
    obj.fontbig = lg.newFont(string.format('/asset/visual/font/%s',src),142)
end

assetload()