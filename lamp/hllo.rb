require_relative("../core/lamp.rb")

class Hllo

	include Lamp

	def initialize 

		@name = "hello"
		@alia = "HLLO"
		@docs = "Simple Hello World app"

	end

	def isListening

		return false

	end

	def application input

		respond("Good Bye #{input.sub("hello","").strip}")

	end

end