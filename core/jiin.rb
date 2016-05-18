class Jiin

	def initialize

		@console = Console.new
		@lamps = require_lamps

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

		name = line.split(" ").first
		if !@lamps[name] then return false end
		if @lamps[name].isListening(line) == false then return false end

		return @lamps[name]

	end

	def lamps
		return @lamps
	end

end