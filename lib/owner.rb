require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def say_species
    p "I am a human."
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    # look through the cats cats @owner match self?
   Cat.all.select do |cats_instance|
      cats_instance.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name,self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name,self)
  end
  
  def walk_dogs
    self.dogs.map do |dog_inst|
      dog_inst.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cats_instance|
      cats_instance.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cats_instance|
      cats_instance.mood = "nervous" 
      cats_instance.owner = nil
    end

    self.dogs.map do |dog_instance|
      dog_instance.mood = "nervous" 
      dog_instance.owner = nil
    end
   
  end

  def list_pets
    cats = self.cats.count
    dogs = self.dogs.count
    p "I have #{dogs} dog(s), and #{cats} cat(s)."
  end

end

# o1 = Owner.new("tim")

# o1.buy_dog("Timone")
# o1.buy_cat("Ranger")
# o1.buy_cat("sass")
# o1.buy_cat("Ra")
# o1.buy_cat("isis")

# binding.pry