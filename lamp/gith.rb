require_relative("../core/lamp.rb")

class Gith

	include Lamp

	def initialize 

		@name = "github"
		@docs = "Github tools"

	end

	def isListening

		return true

	end

	def application input

		respond("working")

	end

	def commit

	end

end