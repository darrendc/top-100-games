# frozen_string_literal: true

class Game
  attr_accessor :name, :rating, :developer

  @@all = []

  def initialize(name, rating, developer)
    @name = name
    @rating = rating
    @developer = developer
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_first_letter(letter)
    Scraper.new.game_list.select do |char|
      char.split("").first.downcase == letter
    end
  end

  def self.create(number, chosen_list)
    index = number.to_i - 1
    name = chosen_list[index]
    rating = Scraper.new.rating(name)
    developer = Scraper.new.developer(name)
    Game.new(name, rating, developer)
  end
end
