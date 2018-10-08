  class Games
  attr_accessor :first_team, :second_team, :time, :league, :url
  
  @@all = []
  
  def self.today
    @@all.reverse.drop(1).reverse
  end
  
  def save 
    @@all << self
  end
  
  def self.scrape_espn
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?date=20181013"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    times = doc.search('span.game-time').map(&:text).delete_if{|x| x !~ /\w/}
    leagues = doc.search('h2.date-heading').map(&:text).delete_if{|x| x !~ /\w/}
    urls = doc.search('a.button-alt').attr('href')
    
    a_teams = teams.values_at(*teams.each_index.select(&:even?))
    b_teams = teams.values_at(*teams.each_index.select(&:odd?))
   
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
    #binding.pry 
  end
  
end