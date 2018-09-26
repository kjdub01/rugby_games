class RugbyGames::CLI 
  
  def call 
    list_games
    menu
    goodbye
  end 
  
  def list_games
    puts "Today's rugby games"
    puts <<-DOC.gsub /^\s*/, ''
    
      1. Hawkes Bay vs Northland at McLean Park, Napier
      2. New Zealand vs Argentina at Welington
    DOC
  end
  
  def menu
    input = nil
    while input != "exit"
    puts "Enter the list number to get more information about a match or type list to list games or type exit to end"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Match 1 info..."
      when "2"
        puts "Match 2 info..."
      when "list"
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