require_relative("../core/lamp.rb")

class Help

	include Lamp

	def initialize 

		@name = "Help"
		@docs = "Help toolchain"

	end

	def isListening input

		return true

	end

	def application input

		$jiin.lamps.each do |name,lamp|
			respond("#{lamp.alia.bold} #{"|".ghostly} #{lamp.name}".fill(30)+"#{"|".ghostly} #{lamp.docs}","*")
		end

	end

end