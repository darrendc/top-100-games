# handles Game info. it does not puts, it nevers scrapes, it only cares about games.
class Game

  attr_accessor :name, :description, :release_year

  @@all = []

  def initialize
    @name = name
    @description = description
    @release_year = release_year
    @@all << self
  end

  def self.all
    @@all
  end
end
