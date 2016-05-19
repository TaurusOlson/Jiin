require_relative("../core/lamp.rb")

class Hllo

	include Lamp

	def initialize 

		@name = "hello"
		@alia = "HLLO"
		@docs = "Test lamp"

	end

	def isListening

		return true

	end

	def application input

		respond("Good Bye #{input.sub("hello","").strip}".template)

	end

end