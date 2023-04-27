# frozen_string_literal: true

require_relative 'treasure_trove' 
require_relative 'playable' 

module StudioGame
  class Player
    include Playable
    
    attr_reader :name, :found_treasures
    attr_accessor :health

    def initialize(name, health = 100)
      self.name = name
      @health = health
      @found_treasures = Hash.new(0)
    end

    def self.from_csv(str)
      name, health = str.split(/\s*,\s*/)
      Player.new(name, Integer(health))
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
    
    def score
      @health + points
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        yield Treasure.new(name, points)
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  player = StudioGame::Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
