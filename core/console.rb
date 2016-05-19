class Console

	def initialize

	end

	def listen

		# puts ""
		print "JIIN".ghostly+" #{"<".bg_red} "
		line = $stdin.readline()

		if line.strip == "exit" then exit 0 ; return false end

		validate(line)

	end

	def validate line

		if line.strip == "" then return end
		if test = $jiin.isLampListening(line) then test.application(line) ; return end

		$jiin.lamps['default'].application(line)

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