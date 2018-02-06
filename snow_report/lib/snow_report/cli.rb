class SnowReport::CLI

  def start
    rocky_mtn_array = SnowReport::Scraper.scrape_from_web("https://onthesnow.com/rocky-mountain/skireport.html")
    SnowReport::Mountains.new_by_collection(rocky_mtn_array)
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
      command = gets.downcase.strip
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
end
