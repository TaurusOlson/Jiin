class Console

	def initialize

		@lamps = require_lamps

		@memory = ""
		@hello = Hello.new

	end

	def listen

		print "JIIN".ghostly+" #{"<".grey} "
		line = $stdin.readline()

		if line.strip == "exit" then exit 0 ; return false end

		validate(line)

	end

	def validate line

		name =line.split(" ").first
		if line.strip == "" then return end
		if !@lamps[name] then log("JIIN".grey,"?","Unknown Lamp: #{name}") ; return end
		if !@lamps[name].isListening(line) then log("JIIN".grey,"?","#{name} is mute.") ; return end

		@lamps[name].application(line)

	end

	def log lamp = "JIIN".ghostly, rune = "!".grey, message = ""

		puts "#{lamp} #{rune} #{message}"

	end

	def require_lamps

		names = {}
		Dir['lamps/*'].each do |file_name|
			name = file_name.split("/").last.sub(".rb","").strip
			require_relative("../"+file_name)
			names[name.downcase] = Object.const_get(name.capitalize).new
		end
		return names

	end

end