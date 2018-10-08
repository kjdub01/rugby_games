class RugbyGames::CLI 
  
  def call
    RugbyGames::Games.scrape_espn
    list_games
    menu
    goodbye
  end 
  
  def list_games
    puts "Today's Rugby Games"
  @games = RugbyGames::Games.today
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.time} -- #{game.first_team} vs #{game.second_team}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the list number to get more information about a match or type list to list games or type exit to end"
      input = gets.strip.downcase
      
      if input.to_i > 0 
        the_game = @games[input.to_i - 1]
        puts "#{the_game.league} -- #{the_game.name} -- #{the_game.location}"
      elsif "list"
        list_games
      else
        puts "Invalid entry."
      end
    end
  end 
  
  def goodbye
    puts "Come back for more games tomorrow"
  end
end