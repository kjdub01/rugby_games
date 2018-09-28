  class RugbyGames::Matches
  attr_accessor :name, :location, :league, :url
  
  def self.today
    self.scrape_matches
  end
  
  def self.scrape_matches
    matches = []
    
    matches << self.scrape_espn
  end
  
  def self.scrape_espn
    site = Nokogiri::HTML(open("http://www.espn.com/rugby/fixtures"))
    binding.pry
  end
end