# handles Amiibo info. it does not puts, it nevers scrapes, it only cares about amiibo.
class Amiibo

  attr_accessor :name, :url, :info

  @@all = []

  def initialize
    @name = name
    @url = url
    @info = info
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
