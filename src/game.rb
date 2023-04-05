# frozen_string_literal: true

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
    @players.each do |p|
      puts p
    end

    @players.each do |p|
      p.blam
      2.times { p.w00t }
    end
  end
end
