class SnowReport::CLI
  
  def start
    puts "Welcome to Snow Report!"
    puts "Here are possible ways to view snow reports:"
    puts " COMMAND ......... OUTPUT"
    puts " snowfall ........ Top 10 resorts by 72-hr snowfall"
    puts " depth ........... Top 10 resorts by base depth"
    puts " runs ............ Top 10 resorts by most open runs"
    puts " [state] ......... List of resorts in that state"
    puts " [resort] ........ All data for that resort"
    run
  end

  def run
    command = nil
    until command == "exit"
      command = gets.downcase.strip
      case command
      when "snowfall"
        #sort by snowfall method
        puts "Mountain A: 14 in. snowfall"
      when "depth"
        # sort by depth method
        puts "Mountain A: 44 in base depth"
      when "runs"
        # sort by runs method
        puts "Mountain A: 50/60 runs open"
      end
    end
  end
end
