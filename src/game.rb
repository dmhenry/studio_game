# frozen_string_literal: true

require_relative "player"
require_relative "die"

class Game
  attr_reader :name

  def initialize(name)
    @name = name
    @players = []
  end

  def add(player:)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in : "
    @players.each do |p|
      puts p
    end

    @players.each do |p|
      die = Die.new
      roll = die.roll

      case roll
      when 1..2
        p.blam
      when 5..6
        p.w00t
      else
        puts "#{p.name} was skipped."
      end
      puts p
    end
  end
end
