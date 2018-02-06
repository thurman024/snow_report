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

  attributes_1 = {
    :name => "Mountain A",
    :state => "Colorado",
    :snowfall => "11",
    :link => "https://onthesnow.com/resort",
    :runs_open => "64/100",
    :base_depth => "38"
  }
  attributes_2 = {
    :name => "Mountain B",
    :state => "California",
    :snowfall => "15",
    :link => "https://onthesnow.com/resort",
    :runs_open => "49/54",
    :base_depth => "42"
  }

  a = SnowReport::Mountains.new_by_attributes(attributes_1)
  b = SnowReport::Mountains.new_by_attributes(attributes_2)

end
