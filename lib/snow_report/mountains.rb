class SnowReport::Mountains
  attr_accessor :state, :snowfall, :link, :runs_open, :base_depth
  @@all
  def initialize(attributes)
    attributes.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

  
end
