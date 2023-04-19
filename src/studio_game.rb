# frozen_string_literal: true

require_relative "player"
require_relative "game"

game = Game.new("Knuckleheads")
game.load_players(ARGV.shift || "src/players.csv")
 
loop do
  puts "How many game rounds? ('quit' to exit)"
  input = gets.chomp.downcase

  case input
  when /^\d+/
    game.play(input.to_i) { game.total_points >= 2000 }
  when 'quit', 'exit'
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
