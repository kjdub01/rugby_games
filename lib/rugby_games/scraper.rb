class RugbyGames::Scraper
  
  def self.scrape_espn
    @doc = Nokogiri::HTML(open("http://www.espn.com/rugby/scoreboard?"))
   
    @doc.search("a.competitors").each do |contest|
      game = RugbyGames::Games.new
      #game.url = contest.attr("href")
      game.time = contest.css("span.game-time").text
      game.home_team = contest.css("div.team.team-a.possession span.short-name").text
      game.home_score = contest.css("div.team.team-a.possession div.score.icon-font-after").text
      game.away_team = contest.css("div.team.team-b.possession span.short-name").text
      game.away_score = contest.css("div.team.team-b.possession div.score.icon-font-before").text
      game.save
    end
  end
end