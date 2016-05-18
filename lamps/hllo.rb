require_relative("../core/lamp.rb")

class Hllo

	include Lamp

	def initialize 

		@name = "Hello"
		@alia = "HLLO"
		@docs = "Test lamp"

	end

	def application input

		respond("Good Bye #{input.sub("hello","").strip}")

	end

end