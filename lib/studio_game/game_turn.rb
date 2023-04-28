# frozen_string_literal: true

require_relative "die"
require_relative "treasure_trove"

module StudioGame
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      roll = die.roll

      case roll
      when 1..2
        player.blam
      when 5..6
        player.w00t
      else
        puts "#{player.name} was skipped."
      end
      puts player

      treasure = TreasureTrove.random
      player.found_treasure(treasure)
      puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
    end
  end
end
