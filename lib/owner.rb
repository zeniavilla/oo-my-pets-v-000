require 'pry'

class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    self.class.all << self
  end
    
  def say_species
    "I am a human."
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end
  
  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end
  
  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end
  
  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end
  
  def sell_pets
    @pets.each { |type, pets| pets.each { |pet| pet.mood = "nervous" } }
    @pets.each { |type, pets| pets.clear }
  end

  def list_pets
    fish_num = @pets[:fishes].length
    dog_num = @pets[:dogs].length
    cat_num = @pets[:cats].length
    "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end
  
end