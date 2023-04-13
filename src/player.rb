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
    @name.length + @health
  end

  def strong?
    @health > 100
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
