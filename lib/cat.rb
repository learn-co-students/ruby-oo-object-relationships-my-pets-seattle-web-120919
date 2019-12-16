#A Dog and a Cat are initialized with a name and an Owner object

class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner) #can change owner, can't change name 
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self 
  end

  # def mood=(mood)
  #   @mood = mood
  # end

  def self.all
    @@all
  end
end