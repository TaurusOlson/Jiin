class Jiin

	def initialize

		@console = Console.new
		
	end

	def collect name

		return Collection.new("collections/#{name}.jin",nil)

	end

	def console

		return @console

	end

end