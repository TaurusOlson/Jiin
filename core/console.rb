class Console

	def initialize

		@lamps = require_lamps

	end

	def listen

		print "JIIN".ghostly+" #{"<".grey} "
		line = $stdin.readline()

		if line.strip == "exit" then exit 0 ; return false end

		validate(line)

	end

	def validate line

		name = line.split(" ").first
		if line.strip == "" then return end
		if @lamps[name] && @lamps[name].isListening(line) then @lamps[name].application(line) ; return end
		@lamps['default'].application(line)

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

	# Logs

	@@previousLamp = ""

	def log message = "", lamp = "JIIN".ghostly, rune = "!".grey

		if @@previousLamp == lamp 
			puts "     #{rune} #{message}"
		else
			puts "#{lamp} #{rune} #{message}"
		end
		@@previousLamp = lamp

	end

end