# handles scraping and collecting values, probably also going to create Amiibos. It's NOT going to puts.
class Scraper
  include Capybara::DSL

#attr_accessor :doc

  def get_page
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
    # doc.css('nav ul.ul')
    binding.pry
  end
end
