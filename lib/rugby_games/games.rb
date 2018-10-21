class Games
  attr_accessor :first_team, :second_team, :time, :first_score, :second_score
  
  @@all = []
  
  def self.today
    @@all.reverse.drop(1).reverse
  end
  
  def save 
    @@all << self
  end
  
  def self.scrape_espn
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?"))
    teams = doc.search('span.short-name').map(&:text).delete_if{|x| x !~ /\w/}
    times = doc.search('span.game-time').map(&:text)
    scores = doc.search('div.score-container').map(&:text)
    
    
    games = doc.search("div#events")
    games.each do |game|
      league_name = game.css("div a h2.date-heading.js-show").text 
      binding.pry
    end
  
    a_teams = teams.values_at(*teams.each_index.select(&:even?))
    b_teams = teams.values_at(*teams.each_index.select(&:odd?))
    a_teams_scores = scores.values_at(*teams.each_index.select(&:even?))
    b_teams_scores = scores.values_at(*teams.each_index.select(&:odd?))
   
    (0..a_teams.size).to_a.each do |i|
      a_team_name = a_teams[i]
      b_team_name = b_teams[i]
      time = times[i]
      a_team_score = a_teams_scores[i]
      b_teams_score = b_teams_scores[i]
      
      game = Games.new 
      game.first_team = a_team_name
      game.second_team = b_team_name
      game.time = time
      game.first_score = a_team_score
      game.second_score = b_teams_score
      game.save
    end
  end
end