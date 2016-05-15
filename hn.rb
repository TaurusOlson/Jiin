require "socket"

server = TCPServer.open(1234)

loop do

    Thread.fork(server.accept) do |client| 

        client.puts("Client")
        puts "Console"
        client.close

    end
    
end