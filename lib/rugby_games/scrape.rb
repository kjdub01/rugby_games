class RugbyGames::Scrape
  
  
  
  def self.scrape_bbc
    doc = Nokogiri::HTML(open("https://www.bbc.com/sport/rugby-union/international-match/fixtures"))
    games = doc.search('a.fixture__block-link').map(&:text)
    dates = doc.search('h4.gel-minion').map(&:text)
    
  end
  
end