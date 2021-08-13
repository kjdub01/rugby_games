class RugbyGames::CLI 
  
  def call
    RugbyGames::Scraper.scrape_espn
    RugbyGames::Games.today
    if RugbyGames::Games.today == []
      puts "Sorry, there are no games."
      goodbye
  
    else
      list_games
      menu
    end
  end 
  
  def list_games
    date = RugbyGames::Dates.game_day.last
    puts "#{date.text}"

    RugbyGames::Games.today.each.with_index(1) do |game, i|
      puts "#{i}. #{game.time} -- #{game.home_team} vs #{game.away_team}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the list number to get more information about a match or type list to list games or type exit to end"
      input = gets.strip.downcase
      
      if input.to_i > 0 && input.to_i <= RugbyGames::Games.today.size
        selected_game = RugbyGames::Games.today[input.to_i - 1] 
        puts "#{selected_game.home_team}  #{selected_game.home_score}  #{selected_game.time}  #{selected_game.away_score}  #{selected_game.away_team}"
        puts "#{selected_game.url}"
      elsif input == "list"
        list_games
      elsif input == "exit"
        goodbye
      else 
        puts "Invalid entry."
      end
    end
  end 
  
  def goodbye
    puts "Come back for more games tomorrow!"
  end
end