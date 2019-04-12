# handles scraping and collecting values, probably also going to create Amiibos. It's NOT going to puts.
class Scraper

#attr_accessor :doc

  def self.get_page
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    doc.css('.item-heading a').map { |el| el.text }.sort #generates numbered list of games in alphabetical order
  end

  def self.rating(name)
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    game_list = doc.css('.item-heading a').map { |el| el.text }
    ranked_list = game_list.each_with_index.map do |game, index|
      rating = index + 1
      hash = {}
      hash[game] = rating
      hash
    end
    ranked_list.select { |hash| hash.keys.first == name }.first[name]
  end

  def self.description
  end
end
