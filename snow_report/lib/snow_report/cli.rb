class SnowReport::CLI

  def start
    rocky_mtn_array = SnowReport::Scraper.scrape_from_web("https://onthesnow.com/rocky-mountain/skireport.html")
    SnowReport::Mountains.new_by_collection(rocky_mtn_array)
    west_coast_array = SnowReport::Scraper.scrape_from_web("https://onthesnow.com/west-coast/skireport.html")
    SnowReport::Mountains.new_by_collection(west_coast_array)
    puts "Welcome to Snow Report!"
    puts "Here are possible ways to view snow reports:"
    puts " COMMAND ......... OUTPUT"
    puts " snowfall ........ Top 10 resorts by 72-hr snowfall"
    puts " depth ........... Top 10 resorts by base depth"
    puts " runs ............ Top 10 resorts by open runs"
    puts " [state] ......... List of resorts in that state"
    puts " [resort] ........ All data for that resort"
    puts " exit ............ Quit program"
    run
  end

  def run
    command = nil
    until command == "exit"
      command = gets.downcase.chomp
      case command
      when "snowfall"
        #sort by snowfall method
        snowfall
      when "depth"
        # sort by depth method
        depth
      when "runs"
        # sort by runs method
        runs
      else
        if SnowReport::Mountains.find_all_in_state(command)
          list_from_state(command)
        elsif SnowReport::Mountains.find_resort(command)
          print_resort(command)
        else
          puts "Not a valid input ... try again or type 'menu' to see available commands"
          input = gets.downcase.chomp
          if input == "menu"
            run
          end
        end
      end
    end
  end

  def snowfall
    #sort by snowfall
    snowfall_data = SnowReport::Mountains.all
    snowfall_data.sort_by! {|obj| -obj.snowfall.to_i}
    snowfall_data.each_with_index do |resort, i|
      if i < 10
        puts "#{i+1}. #{resort.name} - #{resort.state} - #{resort.snowfall} inches"
      end
    end
  end

  def depth
    #sort by depth
    depth_data = SnowReport::Mountains.all
    depth_data.sort_by! {|obj| -obj.base_depth.to_i}
    depth_data.each_with_index do |resort, i|
      if i < 10
        puts "#{i+1}. #{resort.name} - #{resort.state} - #{resort.base_depth} inches"
      end
    end
  end

  def runs
    #sort by runs open
    runs_data = SnowReport::Mountains.all
    runs_data.sort_by! {|obj| -obj.runs_open[0].to_i}
    runs_data.each_with_index do |resort, i|
      if i < 10
        puts "#{i+1}. #{resort.name} - #{resort.state} - #{resort.runs_open.join("/")}"
      end
    end
  end

  def list_from_state(state)
    states_resorts = SnowReport::Mountains.find_all_in_state(state)
    states_resorts.each do |resort|
      puts "#{resort.name} - Base depth: #{resort.base_depth}\" - 72hr Snowfall: #{resort.snowfall}\" - Runs Open: #{resort.runs_open.join("/")}"
    end
  end

  def print_resort(resort)
    puts "this is your resort? #{resort}"
  end
end
