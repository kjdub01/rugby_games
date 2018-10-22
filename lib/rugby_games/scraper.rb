class Scraper
  
  def self.scrape_games
    @doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?date=20181027"))
   
    @doc.search("a.competitors").each do |contest|
      game = Games.new
      game.url = contest.attr("href")
      game.time = contest.css("span.game-time").text
      game.home_team = contest.css("div.team.team-a.possession span.short-name").text
      game.home_score = contest.css("div.team.team-a.possession div.score.icon-font-after").text
      game.away_team = contest.css("div.team.team-b.possession span.short-name").text
      game.away_score = contest.css("div.team.team-b.possession div.score.icon-font-before").text
      game.save
    end
  end
  
  #def scrape_leagues
   # @doc.search("div#events").each do |league|
     # league = League.new
     # league.name = league.css("div a h2.date-heading.js-show").text 
     # league.save
    #end
  #end
end