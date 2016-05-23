class Disk

	def echo load

		# TODO

	end

	def pattern tree,lines,notes

		content = {}
		tree[-1].each do |line|

			year = lines[line].last
			if !tree[line] then next end

			tree[line].each do |line|

				month = lines[line].last
				if !tree[line] then next end

				tree[line].each do |line|

					day = lines[line].last
					content["#{year}-#{month}-#{day}"] = {}
					if !tree[line] then next end

					tree[line].each do |line|
						parts = lines[line].last.split(" : ")
						key = parts.first.strip
						value = parts.last.strip
						content["#{year}-#{month}-#{day}"][key] = value
					end

				end
			end
		end

		return content

	end

end