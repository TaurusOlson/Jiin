require_relative("../core/lamp.rb")

class Help

	include Lamp

	def application input

		$console.log("HELP".grey,">","Missing help docs")

	end

end