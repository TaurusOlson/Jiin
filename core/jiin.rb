
require_relative("console.rb")
require_relative("lamp.rb")
require_relative("../lamp/disk.rb")

require_relative("../misc/string.rb")

class Jiin

	def initialize

		@console = Console.new
		@lamps = require_lamps
		$jiin_path = File.expand_path(File.join(File.dirname(__FILE__), "/.."))

	end

	def collect name

		return Collection.new("collections/#{name}.jin",nil)

	end

	def command input

		if lamp = isLampListening(input) then return lamp.application(input) end
		return "Error"

	end

	def console

		return @console

	end

	def require_lamps

		names = {}
		Dir['lamp/*'].each do |file_name|
			name = file_name.split("/").last.sub(".rb","").strip
			if name.include?(".") then next end 							   # Skip extensions
			require_relative("../"+file_name)
			names[name.downcase] = Object.const_get(name.capitalize).new
		end
		names["default"] = Default.new
		names["disk"] = Disk.new
		return names

	end

	def isLampListening line

		@lamps.each do |name,lamp|
			if lamp.isListening == false then next end
			if lamp.isAnswering(line) == false then next end
			return lamp
		end

		return nil

	end

	def lamps
		return @lamps
	end

end