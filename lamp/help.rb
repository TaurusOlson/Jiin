require_relative("../core/lamp.rb")

class Help

	include Lamp

	def initialize 

		@name = "help"
		@docs = "List of available responders"

	end

	def isListening

		return true

	end

	def application input

		$jiin.lamps.each do |name,lamp|
			respond("#{(lamp.isListening == true ? lamp.alia.bold : lamp.alia.red)} #{"|".ghostly} #{lamp.name.fill(12)} #{"|".ghostly} #{lamp.docs}","*")
		end

	end

end