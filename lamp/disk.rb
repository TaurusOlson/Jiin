require_relative("../core/lamp.rb")

class Disk

	include Lamp

	def initialize 

		@name = "disk"
		@docs = "File system"

	end

	def isListening

		return true

	end

	def application input

		parts = input.split(" ")
		name = parts[0]
		cmd  = parts[1]
		par = input.sub("#{name}","").sub("#{cmd}","").strip

		case cmd
		when "list"
			list()
		when "echo"
			echo(load(par))
		when "load"
			return load(par)
		when "read"
			read(par)
		else
			respond("#{cmd.bold} is unknown, type 'Help' for a list of commands.")
		end
		
	end

	def list

		Dir['disk/*'].each do |file_name|
			file = file_name.split("/").last
			name = file.split(".").first
			extension = file.split(".").last
			description = "No description"

			# Look for description
			File.open("#{file_name}","r") do |f|
				f.each_line do |line|
					if line.strip[0,9] == "~ NOTE : " then description = line.sub("~ NOTE : ","").strip end
				end
			end

			respond("#{extension.upcase.fill(4).bold} #{"|".ghostly} #{name.fill(12)} #{"|".ghostly} #{description}","*")
		end

	end

	def read target

		if File.file?("disk/#{target}") == false then respond("Cannot locate #{target}","!".red) ; return end

		count = 0
		File.open("disk/#{target}","r") do |f|
			number = 0
			f.each_line do |line|
				respond(line,(count % 9).to_s)
				count += 1
				if count > 20 then break end
			end
		end
		respond("...",".")
	end

	def load file

		case file
		when "lexicon"
			require_relative("disk.lexicon.rb")
		when "horaire"
			require_relative("disk.horaire.rb")
		when "system"
			require_relative("disk.system.rb")
		end

		tree  = {}
		notes = {}
		lines = []

		# Read

		File.open("#{$jiin_path}/disk/#{file}.jin","r:UTF-8") do |f|
			number = 0
			f.each_line do |line|
				depth = line[/\A */].size
				line = line.strip
				if line == "" then next end
				if line[0,1] == "~"
					parts = line.split(":")
					key = parts.first.sub("~","").strip
					value = parts.last.strip
					notes[key] = value
				else
					lines.push([number,depth,line])
					number += 1
				end
			end
		end

		# Traverse

		i = 0
		tree[-1] = []
		while i < lines.count
			l = lines[i]
			if l[1] == 0 then tree[-1].push(l[0]) end
			p = l[0]
			while p > -1
				pl = lines[p]
				if pl[1] < l[1]
					if !tree[pl[0]] then tree[pl[0]] = [] end
					tree[pl[0]].push(l[0])
					break
				end
				p -= 1
			end
			i += 1
		end

		return pattern(tree,lines,notes)

	end

end