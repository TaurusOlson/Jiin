while true
    print "Type a number: "
    line = $stdin.readline()
    begin
        # Convert string to integer.
        number = Integer(line)
        # Handle various cases.
        case number
            when 0
                puts "Zero"
            when 1, 2, 3
                puts "One to three"
            else
                puts "Other"
        end
    rescue
        # Let the loop continue.
        puts "Invalid"
    ensure
        puts "Done"
    end
end