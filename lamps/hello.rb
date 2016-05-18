require_relative("../core/lamp.rb")

class Hello

	include Lamp

	def initialize 

		@name = "Hello"
		@alia = "HLLO"
		@docs = "Test lamp"

	end

	def isListening input

		return true

	end

	def application input

		respond("Good Bye #{input.sub("hello","").strip}")

	end

end