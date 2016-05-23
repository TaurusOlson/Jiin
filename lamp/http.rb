require_relative("../core/lamp.rb")

class Http

	include Lamp

	def initialize 

		@name = "http"
		@alia = "HTTP"
		@docs = "Website Server"

	end

	def isListening

		return true

	end

	def application input

		respond("working on this")

	end

	def commit

	end

end