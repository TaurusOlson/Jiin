require_relative("../core/lamp.rb")

class Docs

	include Lamp

	def initialize 

		@name = "Documentation"
		@alia = "DOCS"
		@docs = "Automatic documentation toolkit"

	end

	def isListening

		return true

	end

	def application input

		respond("TODO")

	end

	def commit

	end

end