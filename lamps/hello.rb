
require_relative("lamp.rb")

class Hello

	include Lamp

	def hears input
		puts "Hello -> #{input}"
	end

end