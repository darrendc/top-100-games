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
    if number_valid?(number, chosen_list)
      index = number - 1
      name = chosen_list[index]
      rating = Scraper.new.rating(name)
      developer = Scraper.new.developer(name)
      # developer = Scraper.developer(name)
      Game.new(name, rating, developer)
    else puts "Select a game by entering its corresponding numbe"
    end
  end

  def self.number_valid?(number, chosen_list)
    # move this to cli
    number.positive? && number <= chosen_list.length
  end
end
