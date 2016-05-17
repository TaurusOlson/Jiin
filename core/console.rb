class Console

	def initialize

		@memory = ""

	end

	def read_char

		STDIN.echo = false
		STDIN.raw!
		input = STDIN.getc.chr
		if input == "\e" then
			input << STDIN.read_nonblock(3) rescue nil
			input << STDIN.read_nonblock(2) rescue nil
		end
	ensure
		STDIN.echo = true
		STDIN.cooked!
		return input

	end

	def listen

		print "> "
		line = $stdin.readline()
		puts line.red

	end

	def print_char input

		case input
		when " "
			return "SPACE"
		when "\t"
			return "TAB"
		when "\r"
			return "RETURN"
		when "\n"
			return "LINE FEED"
		when "\e"
			return "ESCAPE"
		when "\e[A"
			return "UP ARROW"
		when "\e[B"
			return "DOWN ARROW"
		when "\e[C"
			return "RIGHT ARROW"
		when "\e[D"
			return "LEFT ARROW".blue
		when "\177"
			return "BACKSPACE"
		when "\004"
			return "DELETE"
		when "\e[3~"
			return "ALTERNATE DELETE"
		when "\u0003"
			return "CONTROL-C"
			exit 0
		when /^.$/
			return "SINGLE CHAR HIT: #{input.inspect}"
		else
			return "SOMETHING ELSE: #{input.inspect}"
		end

	end

	def validate

	end

end

class String

	def colorize(color_code)
		"\e[#{color_code}m#{self}\e[0m"
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

	def pink
		colorize(35)
	end

	def light_blue
		colorize(36)
	end

end