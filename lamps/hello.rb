require_relative("../core/lamp.rb")

class Hello

	include Lamp

	def isListening input

		return true

	end

	def application input

		$console.log("HLLO".grey,">","#{input}")

	end

end