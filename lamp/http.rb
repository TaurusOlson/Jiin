require_relative("../core/lamp.rb")

class Http

	include Lamp

	def initialize 

		@name = "http"
		@alia = "HTTP"
		@docs = "Website Server"

	end

	def isListening

		return true

	end

	def application input

		input = input.sub("http","").strip

		if input == "list"
			list
			return
		end

		if Dir.exists?("http/#{input}")
			require_relative("../http/#{input}/main.rb")
			puts main
		else
			respond("Could not find site-#{input}")
		end

	end

	def list
		Dir['http/*'].each do |file_name|
			file = file_name.split("/").last
			name = file.split(".").first
			extension = file.split(".").last
			respond("#{extension.upcase.fill(4).bold} #{"|".ghostly} #{name.fill(12)} #{"|".ghostly} Missing Description","*")
		end
	end

	def commit

	end

end