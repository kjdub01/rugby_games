  class RugbyGames::Games
  attr_accessor :first_team, :second_team, :time, :league, :url
  
  @@all = []
  
  def self.today
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.build_games
    RugbyGames::Scrape.scrape_espn
   
    (0..a_teams.size).to_a.each do |i|
      a_team_name = a_teams[i]
      b_team_name = b_teams[i]
      time = times[i]
      
      game = Games.new 
      game.first_team = a_team_name
      game.second_team = b_team_name
      game.time = time
      game.save
    end
  end
  binding.pry
end