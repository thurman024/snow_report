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
    states_resorts = SnowReport::Mountains.all.select {|obj| obj.state.downcase == state}
    if states_resorts.size == 0
      return nil
    end
    states_resorts
  end

  def self.find_resort(resort)
    SnowReport::Mountains.all.detect {|obj| obj.name.downcase == resort}
  end
end
