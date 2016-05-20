class Disk

	def echo load

		if load == nil then respond("Load failed","!".red) ; return end

		load.each do |k,v|
			respond(k," ".red)
			v.each do |k1,v1|

				if k1 == "LONG"
					respond("  #{k1} : #{v1.length}","-")
					v1.each do |text|
						respond("    #{text.split(" ").first}","-")
					end
				elsif k1 == "BREF"
					respond("  #{k1} : #{v1[0,30]}...","-")
				else
					respond("  #{k1} : #{v1}","-")
				end
				
			end
		end

	end

	def pattern tree,lines,notes

		content = {}

		tree[-1].each do |line|

			section = lines[line].last
			content[section] = {}
			if !tree[line] then next end

			tree[line].each do |line|
				parts = lines[line].last.split(":")
				key = parts.first.strip
				value = parts.last.strip
				content[section][key] = value

				if key == "LONG"
					tree[line].each do |line|
						if content[section]["LONG"] == "LONG" then content[section]["LONG"] = [] end
						text = lines[line].last
						content[section]["LONG"].push(text)
					end
				end
				
			end

		end

		return content
		
	end

end