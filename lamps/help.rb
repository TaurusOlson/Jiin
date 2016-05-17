require_relative("../core/lamp.rb")

class Help

	include Lamp

	def isListening input

		return true

	end

	def application input

		$console.log("Missing help docs","HELP".grey,"?")

	end

end