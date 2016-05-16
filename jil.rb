class Jil

	def initialize file,pattern

		@file = file
		@lines = []
		@tree = {}
		@notes = {}

		read
		traverse
		build

		@notes.each do |k,v|
			puts "#{k} -> #{v}"
		end

	end

	def read

		File.open(@file,"r") do |f|
			number = 0
			f.each_line do |line|
				depth = line[/\A */].size
				line = line.strip
				if line[0,1] == "~"
					parts = line.split(":")
					key = parts.first.sub("~","").strip.downcase
					value = parts.last.strip
					@notes[key] = value
				else
					@lines.push([number,depth,line])
					number += 1
				end
			end
		end

	end

	def traverse

		i = 0
		@tree[-1] = []
		while i < @lines.count
			l = @lines[i]
			if l[1] == 0 then @tree[-1].push(l[0]) end
			p = l[0]
			while p > -1
				pl = @lines[p]
				if pl[1] < l[1]
					if !@tree[pl[0]] then @tree[pl[0]] = [] end
					@tree[pl[0]].push(l[0])
					break
				end
				p -= 1
			end
			i += 1
		end

	end

	def build

		content = {}
		@tree[-1].each do |line|

			year = @lines[line].last
			content[year] = {}
			if !@tree[line] then next end

			@tree[line].each do |line|

				month = @lines[line].last
				content[year][month] = {}
				if !@tree[line] then next end

				@tree[line].each do |line|

					day = @lines[line].last
					content[year][month][day] = {}
					if !@tree[line] then next end

					@tree[line].each do |line|
						parts = @lines[line].last.split(":")
						key = parts.first.strip.downcase.capitalize
						value = parts.last.strip
						content[year][month][day][key] = value
					end

				end
			end
		end

		p content

	end

end

Jil.new("database/horaire.jil",nil)

