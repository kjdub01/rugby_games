class RugbyGames::Scraper
  BASE_URL = "http://www.espn.com"
  def self.scrape_espn
    @doc = Nokogiri::HTML(URI.open("http://www.espn.com/rugby/scoreboard?date=20210605"))
   
    @doc.css("a.competitors").each do |contest|
      game = RugbyGames::Games.new
      #game.url = BASE_URL + contest.attr("href")
      game.time = contest.css("span.game-time").text
      game.home_team = contest.css("div.team.team-a.possession span.short-name").text
      game.home_score = contest.css("div.team.team-a.possession div.score.icon-font-after").text
      game.away_team = contest.css("div.team.team-b.possession span.short-name").text
      game.away_score = contest.css("div.team.team-b.possession div.score.icon-font-before").text
      game.save
    end
  end
end