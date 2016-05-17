require_relative("../core/lamp.rb")

class Help

	include Lamp

	def initialize 
		@name = "HELP"
	end

	def isListening input

		return true

	end

	def application input

		respond("Lamps".grey," ")
		respond("Hello","-")
		respond("Help","-")
		respond("Collections".grey," ")
		respond("Hello","-")
		respond("Help","-")

	end

end