module Lamp

	def isListening input

		return false

	end

	def respond message,rune = ">"

		$console.log("#{message}",@name.grey,rune)

	end

end

class Default

	include Lamp

	def initialize 
		@name = "JIIN"
	end

	def isListening input

		return true

	end

	def application input

		name = input.split(" ").first
		$console.log("#{name} is not found")

	end

end