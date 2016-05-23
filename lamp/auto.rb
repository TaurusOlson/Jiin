require_relative("../core/lamp.rb")

class Auto

	include Lamp

	def initialize 

		@name = "auto"
		@docs = "Simple Hello World app"

	end

	def isListening

		return false

	end

	def application input

		respond("Current time")

	end

end