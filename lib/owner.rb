class Owner 
  attr_reader :name, :species
  attr_accessor :cats
  @@all = []

  def initialize(name, species = "human")
    @name = name 
    @species = species
    save
  end 

  #Instance Methods
  def say_species
    "I am a #{@species}."
  end 

  def save
    @@all << self
  end

  #Class Methods 
  def self.all
    @@all
  end

  def self.count 
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end

  #Associations 
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.map {|cat| cat.mood = "happy"}
  end  

  def sell_pets 
    Dog.all.map {|dog| dog.mood = "nervous"}
    Cat.all.map {|cat| cat.mood = "nervous"}
    Dog.all.map {|dog| dog.owner = nil}
    Cat.all.map {|cat| cat.owner = nil}
  end
 
  def list_pets
#    "I have #{d} dog(s), and #{c} cat(s)."
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
  
end

