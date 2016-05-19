class Jiin

	def initialize

		@console = Console.new
		@lamps = require_lamps
		@console.log("Core".fill(12)+" | #{@lamps.length} Lamps","JIIN".ghostly,"~".bg_red)

	end

	def start
		@system = @lamps['disk'].load("system")
	end

	def collect name

		return Collection.new("collections/#{name}.jin",nil)

	end

	def console

		return @console

	end

	def require_lamps

		names = {}
		Dir['lamps/*'].each do |file_name|
			name = file_name.split("/").last.sub(".rb","").strip
			require_relative("../"+file_name)
			names[name.downcase] = Object.const_get(name.capitalize).new
		end
		names["default"] = Default.new
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