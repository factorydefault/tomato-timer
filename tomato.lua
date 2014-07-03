
local class = require('middleclass')

Tomato = class('Tomato')


function Tomato:initialize()

	self.pomodoro_mins  = 25
	self.shortbreak_mins = 5
	self.longbreak_mins = 10

	self.paused = false

	self.remaining = 25*60

	self.img_tomato = lg.newImage( "images/tomato.png" )
	print("Tomato by Jose Campos from The Noun Project")
	self.fonts = {large = lg.newFont("fonts/Gotham-Medium.otf",48)}
	self.formatted = ""

	--fonts = {standard=lg.newFont( "fonts/GothamNarrow-Medium.otf", 28 ),
	--		small=lg.newFont( "fonts/GothamNarrow-Medium.otf", 14 ),
	--		chart=lg.newFont( "fonts/GothamNarrow-Medium.otf", 44)}
end

function Tomato:update(dt)
	
	if self.paused == true then
		--paused timer
	else
		if self.remaining > 0 then
			self.remaining = self.remaining - dt
			
		else
			self.remaining = 0
			self.paused = true
		end

	end
	local s = self.remaining
	
	if s < 0 then
		s = 0
	end

	--self.formatted = string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60)
	
	self.formatted = string.format("%.2d:%.2d", math.floor(s/60), math.floor(s-(math.floor(s/60)*60)))
	
	lw.setTitle( self.formatted )
	if self.paused == true then
		lw.setTitle( self.formatted .. " - Paused")
	end
end

function Tomato:draw()

	lg.setColor(255,25,25,255)
	lg.draw(self.img_tomato,10,10)

	lg.setFont( self.fonts.large )

	

	lg.setColor(255,255,255,255)
	lg.printf( self.formatted, 140, 60-(48/2), 300, "left" )

end

function Tomato:pause()
	self.paused = true
end

return Tomato