class RugbyGames::Dates
    attr_accessor :text
  
  @@all = []
  
  def self.game_day
    @@all
  end
  
  def save 
    @@all << self
  end
end