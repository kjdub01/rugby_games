class Leagues
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
end
