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

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  
    1.upto(turns) do |t|
      if block_given?
        break if yield
      end

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

    sorted_players.each do |p|
      puts "\n#{p.name}'s point totals:"
      p.each_found_treasure do |t|
        puts "#{t.points} total #{t.name} points"
      end
      puts "#{p.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
end
