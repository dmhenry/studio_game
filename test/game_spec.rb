# frozen_string_literal: true

require_relative "../src/game"

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

    @game.play

    expect(@player.health).to eq(@initial_health + 15)
  end

  it "skips the player if a medium number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)

    @game.play

    expect(@player.health).to eq(@initial_health)
  end
end
