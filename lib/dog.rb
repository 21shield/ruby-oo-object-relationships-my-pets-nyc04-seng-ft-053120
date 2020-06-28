class Dog
  # code goes here
  @@all = []
  attr_reader :name
  attr_accessor :mood, :owner
  def initialize(name, owner)
      @name = name
      @owner = owner
      @mood = "nervous"
      save
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end