require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all.push(self)
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.find_all do |cat_own|
      cat_own.owner == self
    end   
  end

  def dogs
    Dog.all.find_all do |dog_own|
      dog_own.owner == self
    end   
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    # self.dogs.each do |dog|
    #   dog.mood = "happy"
    # end
    pet_mood(dogs, "happy")
  end

  def feed_cats
    # self.cats.each do |cat|
    #   cat.mood = "happy"
    # end
    pet_mood(cats, "happy")
  end

  def sell_pets
    allpets = cats + dogs
    # pet_mood(cats, "nervous")
    # pet_mood(dogs, "nervous")
    pet_mood(allpets, "nervous")
    allpets.each do |animal|
      animal.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    # binding.pry
  end

  def pet_mood(pet, moodis)
    pet.each do |animal|
      animal.mood = moodis
    end
  end

end