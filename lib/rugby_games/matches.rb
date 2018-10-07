  class Games
  attr_accessor :name, :location, :league, :url
  
  def self.today
    self.scrape_games
  end
  
  def self.scrape_games
    matches = []
    
    matches << self.scrape_espn
  end
  
  def self.scrape_espn
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?date=20181005"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    times = doc.search('span.game-time').map(&:text).delete_if{|x| x !~ /\w/}
    leagues = doc.search('h2.date-heading').map(&:text).delete_if{|x| x !~ /\w/}
    urls = doc.search('a.button-alt').attr('href')
    
    a_teams = teams.values_at(*teams.each_index.select(&:even?))
    b_teams = teams.values_at(*teams.each_index.select(&:odd?))
    games = a_teams.zip(times, b_teams)
    the_games = games.collect { |game| game.join(" ") }
    
    
    game = Games.new 
    game.name = 
    
    binding.pry
  end
  
  
  
  
  def self.scrape_bbc
    doc = Nokogiri::HTML(open("https://www.bbc.com/sport/rugby-union/international-match/fixtures"))
    games = doc.search('a.fixture__block-link').map(&:text)
    dates = doc.search('h4.gel-minion').map(&:text)
    
  end
end