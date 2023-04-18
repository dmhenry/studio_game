# frozen_string_literal: true

class Player
  attr_reader :name, :health, :found_treasures

  def initialize(name, health = 100)
    self.name = name
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}."
  end

  def <=>(other)
     other.score <=> score
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
    @health + points
  end

  def strong?
    @health > 100
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end
end

if __FILE__ == $PROGRAM_NAME
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
