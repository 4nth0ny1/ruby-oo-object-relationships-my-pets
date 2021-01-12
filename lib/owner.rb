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

  # def buy_cat(name)
  #   new_cat = Cat.new(name)
  # end

  def buy_cat(cat)
    cat.owner == self
  end


  




end

