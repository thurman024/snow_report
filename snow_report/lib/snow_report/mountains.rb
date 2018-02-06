class SnowReport::Mountains
  attr_accessor :name, :state, :snowfall, :link, :runs_open, :base_depth
  @@all = []
  def initialize(attributes)
    attributes.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_attributes(hash)
    SnowReport::Mountains.new(hash)
  end

  def self.new_by_collection(array)
    array.each {|hash| self.new_by_attributes(hash)}
  end

  def self.find_all_in_state(state)
    SnowReport::Mountains.all.select {|obj| obj.state == state.capitalize}
  end

  #create from Scraper
  # rocky_mtn_array = SnowReport::Scraper.scrape_from_web("https://onthesnow.com/rocky-mountain/skireport.html")
  # SnowReport::Mountains.new_by_collection(rocky_mtn_array)
end
