  class RugbyGames::Games
  attr_accessor :first_team, :second_team, :time, :league, :url
  
  @@all = []
  
  def self.today
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.scrape_espn
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?date=20181005"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    times = doc.search('span.game-time').map(&:text).delete_if{|x| x !~ /\w/}
    leagues = doc.search('h2.date-heading').map(&:text).delete_if{|x| x !~ /\w/}
    urls = doc.search('a.button-alt').attr('href')
    
    a_teams = teams.values_at(*teams.each_index.select(&:even?))
    b_teams = teams.values_at(*teams.each_index.select(&:odd?))
    #games = a_teams.zip(times, b_teams)
    #the_games = games.collect { |game| game.join(" ") }
    
    
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
  
  
  
  
  def self.scrape_bbc
    doc = Nokogiri::HTML(open("https://www.bbc.com/sport/rugby-union/international-match/fixtures"))
    games = doc.search('a.fixture__block-link').map(&:text)
    dates = doc.search('h4.gel-minion').map(&:text)
    
  end
end