# frozen_string_literal: true

class Scraper
  def page
    @page ||= Nokogiri::HTML(open("https://www.ign.com/lists/top-100-games/"))
  end

  def game_list
    page.css(".item-heading a").map(&:text).slice(0, 50).reverse
    # generates numbered list of games
  end

  def rating(name)
    ranked_list = game_list.each_with_index.map do |game, index|
      rating = index + 1
      hash = {}
      hash[game] = rating
      hash
    end
    ranked_list.select { |hash| hash.keys.first == name }.first[name]
  end

  def developer(name)
    chunk = page.css(".item-heading a").select { |url| url.children.first.text == name }
    url = chunk.first.attributes["href"].value
    Nokogiri::HTML(open(url)).css(".jsx-2881975397.developer").first.children.text
  end
end
