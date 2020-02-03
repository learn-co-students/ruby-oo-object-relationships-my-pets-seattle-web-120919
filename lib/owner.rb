require "pry"

class Owner
  # code goes here
  attr_reader :name, :human, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
    #binding.pry
  end

  def self.reset_all
    self.all.clear
    #binding.pry
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
    # binding.pry
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
    #binding.pry
    #binding.pry
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
    #binding.pry
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def owners_pets
    self.cats + self.dogs
  end

  def sell_pets
    owners_pets.each { |pet| pet.mood = "nervous" }
    owners_pets.each { |pet| pet.owner = nil }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
