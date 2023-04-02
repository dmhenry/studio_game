require_relative '../src/player'

describe Player do

  before do
    $stdout = StringIO.new  # prevent console output during test execution
    @init_health = 150
    @player = Player.new("larry", @init_health)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(@init_health)
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@init_health + @player.name.length)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t

    expect(@player.health).to eq(@init_health + 15)
  end

  it "decreses health by 10 when blammed" do
    @player.blam

    expect(@player.health).to eq(@init_health - 10)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Larry with a health of #{@init_health} and a score of #{@init_health + @player.name.length}.")
  end
end
