module Lamp

	def isListening input

		return false

	end

end

class Default

	include Lamp

	def isListening input

		return true

	end

	def application input

		name = input.split(" ").first
		$console.log("#{name} is not found")

	end

end