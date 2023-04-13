# frozen_string_literal: true

require_relative "player"
require_relative "game_turn"

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add(player:)
    @players << player
  end

  def play(turns)
    puts "There are #{@players.size} players in #{@title}: "
    @players.each do |p|
      puts p
    end
  
    1.upto(turns) do |t|
      puts "\nRound #{t}"
      @players.each { |p| GameTurn.take_turn(p) }
    end

    print_stats
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }

    puts "\n#{title} Statistics:\n"

    puts "\n#{strong.length} strong players:\n"
    strong.each { |s| puts "#{s.name}\n" }

    puts "\n#{wimpy.length} wimpy players:\n"
    wimpy.each { |w| puts "#{w.name}\n" }

    puts "\n#{title} High Scores:\n"

    sorted_players = @players.sort
    sorted_players.each { |p| puts "#{p.name.ljust(20, '.')} #{p.score}" }
  end
end
