# frozen_string_literal: true

require 'studio_game/game'
require 'studio_game/die'

module StudioGame
  describe Game do
    before do
      $stdout = StringIO.new # redirect output during tests
      @game = Game.new("Knuckleheads")

      @initial_health = 100
      @player = Player.new("moe", @initial_health)

      @game.add(player: @player)
    end

    it "w00ts the player if a high number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)

      @game.play(2)

      expect(@player.health).to eq(@initial_health + (15 * 2))
    end

    it "skips the player if a medium number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)

      @game.play(2)

      expect(@player.health).to eq(@initial_health)
    end

    it "blams the player if a low number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)

      @game.play(2)

      expect(@player.health).to eq(@initial_health - (10 * 2))
    end

    it "computes total points as the sum of all player points" do
      game = Game.new("Knuckleheads")

      player1 = Player.new("moe")
      player2 = Player.new("larry")

      game.add(player: player1)
      game.add(player: player2)

      player1.found_treasure(Treasure.new(:hammer, 50))
      player1.found_treasure(Treasure.new(:hammer, 50))
      player2.found_treasure(Treasure.new(:crowbar, 400))

      expect(game.total_points).to eq(500)
    end
  end
end
