
--Timer = require("timer")

Tomato = require("tomato")


lg = love.graphics
lw = love.window

Screen = {}

--curscale = 1

function love.load()
	print("Tomato Timer by Alex Hayes")
	--icon = love.image.newImageData( 'images/icon.png' )
	--lw.setIcon( icon )

	tomatotimer = Tomato()
	tomatotimer:pause()
	rng = love.math.newRandomGenerator( )

	--fonts = {standard=lg.newFont( "fonts/GothamNarrow-Medium.otf", 28 ),
	--		small=lg.newFont( "fonts/GothamNarrow-Medium.otf", 14 ),
	--		chart=lg.newFont( "fonts/GothamNarrow-Medium.otf", 44)}

	lg.setBackgroundColor(39,40,34) --nice for hud
	--lg.setBackgroundColor(255,255,255) --for images

	Screen.w = love.window.getWidth()
	Screen.h = love.window.getHeight()


	--camera = Camera(Screen.w/2,Screen.h/2, 1, 0)


	--pan_speed = 0

	--csv = CSV() --('C:/Users/Alex/Desktop/Panel Viewer/example.csv')
	
end


function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function love.update( dt )
	--require("lovebird").update()
	
	Screen.w = love.window.getWidth()
	Screen.h = love.window.getHeight()
	--Timer.update(dt)
	--for k,v in pairs(flacsruns) do
	--	v:update(dt)
	--end
	tomatotimer:update(dt)
	--local cam_x, cam_y = camera:pos()

	--pan_speed = 650 * (curscale)  

end

function love.draw()
	--for k,v in pairs(flacsruns) do
	--	v:draw()
	--end
    --camera:attach()
    --draw_panels()
    --camera:detach()
	--CAMERA?!
	--draw_hud()


	tomatotimer:draw()
end

function draw_if(item)
	if item then
		item:draw()
	end
end

function update_if(item,dt)

end

function love.mousepressed(x, y, button)
   if button == "wu" then
      --camera:zoom(1.1) 
   elseif button == 'wd' then
   		--camera:zoom(0.9)
   end
end

function love.keypressed(key,isrepeat)

	if key == 'f1' then 
		if (tomatotimer.paused == false) then
			tomatotimer.paused = true
		else
			tomatotimer.paused = false
		end
		--csv:setMode('xy') --csv.mode = 'xy'
		--csv.otherdir = 'z'
		--csv.label_v = 'South'
		--csv.label_h = 'East'
	elseif key == 'f2' then
		tomatotimer.remaining = 25*60
	elseif key == 'f3' then
		tomatotimer.remaining = 3*60
	elseif key == 'f4' then
		tomatotimer.remaining = 10*60
	end

	if key == 'f5' then
		tomatotimer.remaining = 0
	elseif key == 'f6' then
		tomatotimer.remaining = tomatotimer.remaining + 1*60
	end

end

function exit()
	love.event.push('quit')
end
