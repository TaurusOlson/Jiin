module Lamp

	def name
		return @name
	end

	def alia
		return !@alia ? @name.upcase : @alia
	end

	def docs
		return !@docs ? "Documentation missing" : @docs
	end

	def isListening

		return false

	end

	def isAnswering line

		return false

	end

	def isAnswering line

		cmd = line.split(" ").first.strip.downcase
		if cmd == @name || cmd.upcase == @alia then return true end
		return false
		
	end

	def respond message,rune = ">"

		$jiin.console.log("#{message}",alia,rune.bg_white)

	end

end

class Default

	include Lamp

	def initialize 

		@name = "Jiin"
		@alia = "JIIN"
		@docs = "Default lamp interface"

	end

	def isListening

		return true

	end

	def application input

		name = input.split(" ").first
		$jiin.console.log("#{name} is not found")

	end

end