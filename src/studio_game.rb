# frozen_string_literal: true

require_relative "player"
require_relative "game"

game = Game.new("Knuckleheads")
game.add(player: Player.new("moe"))
game.add(player: Player.new("curly"))
game.add(player: Player.new("larry"))
game.play(10) { game.total_points >= 2000 }
