require "player_factory"

describe PlayerFactory do

  before :each do
    @board = Board.new(3)
    console = Console.new
    message = Message.new
    @display = Display.new(console, message)
    @player_factory = PlayerFactory.new
  end

  it "returns 2 human players" do
    choice = 1
    expect(@player_factory.set_up_players(choice, @board, @display)[0]).to be_a(HumanPlayer)
    expect(@player_factory.set_up_players(choice, @board, @display)[1]).to be_a(HumanPlayer)
  end

  it "returns a human player and a computer player" do
    choice = 2
    expect(@player_factory.set_up_players(choice, @board, @display)[0]).to be_a(HumanPlayer)
    expect(@player_factory.set_up_players(choice, @board, @display)[1]).to be_a(ComputerPlayer)
  end

  it "returns a computer player and a human player" do
    choice = 3
    expect(@player_factory.set_up_players(choice, @board, @display)[0]).to be_a(ComputerPlayer)
    expect(@player_factory.set_up_players(choice, @board, @display)[1]).to be_a(HumanPlayer)
  end
end
