# frozen_string_literal: true

require_relative "player"
require_relative "game_turn"

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
      GameTurn.take_turn(p)
    end
  end
end
