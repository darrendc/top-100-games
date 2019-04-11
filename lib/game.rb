# handles Game info. it does not puts, it nevers scrapes, it only cares about amiibo.
class Game

  attr_accessor :name, :description, :release_year

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
