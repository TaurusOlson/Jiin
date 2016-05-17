module Lamp

	@@name = "????"

	def isListening input

		return false

	end

	def respond message

		$console.log("#{message}",@@name.grey,">")

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