require 'pry'

class Owner
  attr_accessor :dog, :cat
  attr_reader :name, :species
  @@all = []

  #An Owner will know about all their pets
  def initialize(name)
    @name = name 
    @@all << self
    @species = 'human'
    Dog.all 
    Cat.all 
  end

  def say_species # can say its species
    "I am a #{@species}."
  end 

  def self.all # Returns all instances of Owner that have been created
    @@all 
  end

  def self.count #returns the # of owners that have been created
    @@all.count
  end

  def self.reset_all #reset the owners that have been created
    @@all = []
  end

  # ASSOCIATIONS.  Owner instance methods. 
  # returns a collection of all the cats that belong to the owner
  def cats
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|cats| cats.owner == self}
  end 
  
  # can buy a cat that is an instance of the Cat class. knows about its cats
  # accepts name and checks against Cat class 
  # Make a new instance of the pet with the name, initializing it with that name 
  # and the owner who is purchasing it.
  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end 

  # walks the dogs which makes the dogs' moods happy
  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|dog| dog.mood = "happy"}
  end 

  # can sell all its pets, which makes them nervous
  # can sell all its pets, which leaves them without an owner
  # iterate through all pets (cats + dogs)
  def sell_pets
  pets = Cat.all + Dog.all 
  pets.each {|pet| pet.mood = "nervous"}
  pets.each {|pet| pet.owner = nil }
  end 
      
  # can list off its pets
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end