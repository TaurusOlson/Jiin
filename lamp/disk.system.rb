class Disk

	def echo load

		# TODO

	end

	def pattern tree,lines,notes

		content = {}
		tree[-1].each do |line|

			topic = lines[line].last
			content[topic] = {}

			tree[line].each do |line|
				parts = lines[line].last.split(" : ")
				k = parts.first.strip
				v = parts.last.strip
				content[topic][k] = v
			end
		end

		return content

	end

end