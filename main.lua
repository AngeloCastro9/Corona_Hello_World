local tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 50, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local function mostraLogos()
    if tapCount == 0 then 
        logo1 = display.newImageRect( "inicio.png", 100, 100 )
        logo1.x = display.contentCenterX
    else
        if tapCount < 2 then 
            logo1:removeSelf()
            logoInicial:removeSelf()
        end
        logo = display.newImageRect( "logo.png", 100, 100 )
        logo.x = display.contentCenterX        
    end
end

logoInicial = display.newImageRect( "inicio.png", 100, 100 )
    logoInicial.x = display.contentCenterX

local platform = display.newImageRect( "platform.png", 300, 30 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

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
    pixel:applyLinearImpulse( 0, -0.90, pixel.x, pixel.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end 
    
pixel:addEventListener( "tap", pushPixel )