# handles Game info. it does not puts, it nevers scrapes, it only cares about games.
class Game

  attr_accessor :name, :rating, :developer

  @@all = []

  def initialize(name, rating, developer)
    @name = name
    @rating = rating
    @developer = developer
    @@all << self
  end

  def self.get_first_letter(letter)
    Scraper.get_page.select do |char|
      char.split('').first.downcase == letter
    end
  end

  def self.all
    @@all
  end

  def self.create(number, chosen_list)
    if number_valid?(number, chosen_list)
      index = number - 1
      name = chosen_list[index]
      rating = Scraper.rating(name)
      binding.pry
      # developer = Scraper.developer(name)
      Game.new(name, description, rating)
    end
  end

  def self.number_valid?(number, chosen_list)
    number > 0 && number <= chosen_list.length
  end
end
