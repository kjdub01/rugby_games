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
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?date=20180929"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    binding.pry
  end
end