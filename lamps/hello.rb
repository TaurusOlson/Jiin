require_relative("../core/lamp.rb")

class Hello

	include Lamp

	@@name = "HLLO"

	def isListening input

		return true

	end

	def application input

		respond("hello #{input.sub("hello","").strip}")

	end

end