# handles scraping and collecting values, probably also going to create Amiibos. It's NOT going to puts.
class Scraper

#attr_accessor :doc

  def get_page
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    doc.css('.item-heading a').map {|el| el.text}.sort.each_with_index.map {|el, i| "#{i + 1}. #{el}"} #generates numbered list of games in alphabetical order
    binding.pry
  end
end
