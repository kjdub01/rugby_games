class Games
  attr_accessor :home_team, :away_team, :time, :home_score, :away_score, :url
  
  @@all = []
  
  def self.today
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.scrape_espn
    doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard"))
   
    doc.search("a.competitors").each do |x|
      game = Games.new
      game.url = x.attr("href")
      game.time = x.css("span.game-time").text
      game.home_team = x.css("div.team.team-a.possession span.short-name").text
      game.home_score = x.css("div.team.team-a.possession div.score.icon-font-after").text
      game.away_team = x.css("div.team.team-b.possession span.short-name").text
      game.away_score = x.css("div.team.team-b.possession div.score.icon-font-before").text
      game.save
    end
  
    doc.search("div#events").each do |league|
      game.league_name = league.css("div a h2.date-heading.js-show").text 
      game.save
    end
  
   binding.pry
  end
end