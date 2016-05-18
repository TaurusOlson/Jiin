require_relative("../core/lamp.rb")

class Lect

	include Lamp

	def initialize

		@name = "collection"
		@alia = "LECT"
		@docs = "Database system"

	end

	def isListening

		return true

	end

	def application input

		puts "???"		

	end

end