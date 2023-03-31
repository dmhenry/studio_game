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

class Game
  attr_reader :name

  def initialize(name)
    @name = name
    @players = Array.new
  end

  def add(player:)
    @players << player
  end

  def play
    @players.each do |p|
      puts p
    end

    @players.each do |p|
      p.blam
      2.times { p.w00t }
    end
  end
end

game = Game.new("Knuckleheads")
game.add(player: Player.new("moe"))
game.add(player: Player.new("curly"))
game.add(player: Player.new("larry"))
game.play
