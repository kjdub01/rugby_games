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
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    leagues = doc.search('h2.date-heading').map(&:text).delete_if{|x| x !~ /\w/}
    times = doc.search('span.game-time').map(&:text).delete_if{|x| x !~ /\w/}
    fullgames = doc.search('a.competitors').map(&:text).delete_if{|x| x !~ /\w/}
    binding.pry
  end
  
  def self.scrape_bbc
    doc = Nokogiri::HTML(open("https://www.bbc.com/sport/rugby-union/international-match/fixtures"))
    games = doc.search('aritcle.fixture').map(&:text)
    dates = doc.search('h4.gel-minion').map(&:text)
    binding.pry
  end
end