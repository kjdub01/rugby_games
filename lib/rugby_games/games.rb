class RugbyGames::Games
  attr_accessor :home_team, :away_team, :time, :home_score, :away_score, :url, :home_record, :away_record
  
  @@all = []
  
  def self.today
    @@all
  end
  
  def save 
    @@all << self
  end
end