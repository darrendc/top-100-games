# handles scraping and collecting values, probably also going to create Amiibos. It's NOT going to puts.
class AmiiboScraper
  include Capybara::DSL

#attr_accessor :doc

  def get_page
    doc = Nokogiri::HTML(open('https://www.ign.com/lists/top-100-games/'))
   # doc.css('section.compatible-group').css('ul.row.row-4cols.row-3cols-tab.row-2cols-mob.figures').text
   # binding.pry
   #visit('https://www.nintendo.com/amiibo/line-up/#release')
      #doc = Nokogiri::HTML(page.html)
           binding.pry

  end
end
