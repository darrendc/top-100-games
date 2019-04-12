# handles scraping and collecting values, probably also going to create Amiibos. It's NOT going to puts.
class Scraper

#attr_accessor :doc

  def self.get_page
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    doc.css('.item-heading a').map { |el| el.text }.sort #generates numbered list of games in alphabetical order
  end

  def self.release_year
    doc1 = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    doc1.css('div.item-body').css('span.item-label-value').text
    binding.pry
  end

  def self.description
  end
end
