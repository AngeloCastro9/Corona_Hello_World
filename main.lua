tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 50, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local function mostraLogos()
        if tapCount == 0 then 
            logoInicial:removeSelf()
        end
end

-- imagem de inicio do jogo
logoInicial = display.newImageRect( "inicio.png", 100, 100 )
    logoInicial.x = display.contentCenterX

local platform = display.newImageRect( "platform.png", 300, 30 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-5        

local pixel = display.newImageRect( "pixel.png", 112, 112 )
pixel.x = display.contentCenterX
pixel.y = display.contentCenterY
pixel.alpha = 0.8

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( pixel, "dynamic", { radius=50, bounce=0.3 } )

local function pushPixel()
    mostraLogos()
    pixel:applyLinearImpulse( 0, -0.75, pixel.x, pixel.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end 
    
pixel:addEventListener( "tap", pushPixel )