require_relative("../core/lamp.rb")

class Disk

	include Lamp

	def initialize 

		@name = "Disk"
		@alia = "DISK"
		@docs = "File system"

	end

	def list

		Dir['disk/*'].each do |file_name|
			file = file_name.split("/").last
			name = file.split(".").first
			extension = file.split(".").last
			respond("#{extension.upcase.fill(4).bold} #{"|".ghostly} #{name.fill(20)}","*")
		end

	end

	def isListening input

		return true

	end

	def application input

		cmd = input.sub(@name.downcase,"").strip
		case cmd
		when "list"
			list()
		else
			respond("#{cmd.bold} is unknown, type 'Help' for a list of commands.")
		end
		

	end

end