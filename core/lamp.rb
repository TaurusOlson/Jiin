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

	def isListening input

		return false

	end

	def respond message,rune = ">"

		$jiin.console.log("#{message}",alia,rune.ghostly)

	end

end

class Default

	include Lamp

	def initialize 

		@name = "Jiin"
		@alia = "JIIN"
		@docs = "Default lamp interface"

	end

	def isListening input

		return true

	end

	def application input

		name = input.split(" ").first
		$jiin.console.log("#{name} is not found")

	end

end