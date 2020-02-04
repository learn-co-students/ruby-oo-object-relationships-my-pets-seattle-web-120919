class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    cat_obj = Cat.new(cat, self)
  end

  def buy_dog(dog)
    dog_obj = Dog.new(dog, self)
  end

  def walk_dogs()
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats()
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets()
    dogs.each {|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }

    cats.each {|cat| 
      cat.mood = "nervous"
      cat.owner = nil
    }
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end