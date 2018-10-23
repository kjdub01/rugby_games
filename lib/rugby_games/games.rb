class Games
  attr_accessor :home_team, :away_team, :time, :home_score, :away_score
  
  @@all = []
  
  def self.today
    @@all
  end
  
  def save 
    @@all << self
  end
end