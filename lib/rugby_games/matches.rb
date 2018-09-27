class RugbyGames::Matches
  attr_accessor :name, :location, :league, :url
  
  def self.today
  match_1 = self.new 
  match_1.name = "Hawkes Bay vs Northland"
  match_1.location = "McLean Park, Napier" 
  match_1.league = "Mitre 10 Cup"
  match_1.url = "http://www.espn.com/rugby/match?gameId=292858&league=270563"
  
  match_2 = self.new 
  match_2.name = "New Zealand vs Argentina"
  match_2.location = "Wellington" 
  match_2.league = "Friendly"
  match_2.url = "http://www.espn.com/rugby/match?gameId=somethingleague=something"
  
  [match_1, match_2]
  end
end