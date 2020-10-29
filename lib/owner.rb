class Owner

  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    # Owner.all.count
    self.all.count
  end

  def self.reset_all
    self.all.clear()
  end

  def cats
    Cat.all.select {|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog|dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = dogs + cats

    all_pets.each do |all_pet|
      all_pet.mood = "nervous"
      all_pet.owner = nil
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# a = [ "a", "b", "c", "d", "e" ]
# a.clear    #=> [ ]

# a = "abcde"
# a.clear    #=> ""