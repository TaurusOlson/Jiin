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

		$jiin.lamps.each do |name,lamp|
			respond(lamp.name,"-")	
		end

	end

end