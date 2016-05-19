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
		when "load"
			load(par)
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
			respond("#{extension.upcase.fill(4).bold} #{"|".ghostly} #{name.fill(12)} #{"|".ghostly} Missing Description","*")
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

	def save
		#TODO
	end

	def load target

		respond("Locating #{target}",".")
		Dir['disk/*'].each do |file_name|
			file_name = file_name.split("/").last.sub(".rb","").strip
			name = file_name.split(".").first
			extension = file_name.split(".").last
			if target == name
				loadFile(file_name)
				return
			end
		end
		respond("Could not load file #{target}","!".red)
		return

	end

	def loadFile file

		tree  = {}
		notes = {}
		lines = []

		# Read

		File.open("disk/#{file}","r") do |f|
			number = 0
			f.each_line do |line|
				depth = line[/\A */].size
				line = line.strip
				if line == "" then next end
				if line[0,1] == "~"
					parts = line.split(":")
					key = parts.first.sub("~","").strip.downcase
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

		p parse_pattern_basic(tree,lines,notes)
		# p parse(tree,lines,notes)

	end

	def parse_pattern_basic tree,lines,notes

		content = {}

		tree[-1].each do |line|

			section = lines[line].last
			content[section] = {}
			if !tree[line] then next end

			tree[line].each do |line|
				parts = lines[line].last.split(":")
				key = parts.first.strip.downcase.capitalize
				value = parts.last.strip
				content[section][key] = value
			end

		end

		return content
		
	end

	def parse_pattern_date tree,lines,notes

		content = {}
		tree[-1].each do |line|

			year = lines[line].last
			content[year] = {}
			if !tree[line] then next end

			tree[line].each do |line|

				month = lines[line].last
				content[year][month] = {}
				if !tree[line] then next end

				tree[line].each do |line|

					day = lines[line].last
					content[year][month][day] = {}
					if !tree[line] then next end

					tree[line].each do |line|
						parts = lines[line].last.split(":")
						key = parts.first.strip.downcase.capitalize
						value = parts.last.strip
						content[year][month][day][key] = value
					end

				end
			end
		end

		return content

	end

end