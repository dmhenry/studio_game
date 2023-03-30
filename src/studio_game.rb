# frozen_string_literal: true

class Player
  attr_reader :name, :health

  def initialize(name, health = 100)
    self.name = name
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def name=(name)
    @name = name.downcase.capitalize
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @name.length + @health
  end
end

player1 = Player.new("moe")
puts player1

player2 = Player.new("larry", 60)
player2.name = "lawrence"
puts player2

player3 = Player.new("curly", 125)
puts player3
