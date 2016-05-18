class String

	def colorize(color_code)
		"\e[#{color_code}m#{self}\e[0m"
	end

	def tempalte
		i = 0
		while i < 50
			puts "#{i}".colorize(i)
			i += 1
		end
	end

	def bold
		colorize(1)
	end

	def ghostly
		colorize(2)
	end

	def underline
		colorize(4)
	end

	def blink
		colorize(5)
	end

	def bg
		colorize(7)
	end

	def black
		colorize(30)
	end

	def bg_red
		colorize(41)
	end

	def bg_grey
		colorize(47)
	end

	def red
		colorize(31)
	end

	def green
		colorize(32)
	end

	def yellow
		colorize(33)
	end

	def blue
		colorize(34)
	end

	def grey
		colorize(37)
	end

	def pink
		colorize(35)
	end

	def light_blue
		colorize(36)
	end

	def fill length, filler = " "

		filled = self
		while filled.length < length
			filled += filler
		end
		"#{filled}"
		
	end

end