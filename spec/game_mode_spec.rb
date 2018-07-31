require "game_mode"

describe GameMode do

  before :each do
    @game_mode = GameMode.new
    @board = Board.new(3)
    console = Console.new
    message = Message.new
    @display = Display.new(console, message)
  end

  it "returns 2 human players" do
    choice = 1
    expect(@game_mode.set_up_game(choice, @board, @display)[0]).to be_a(HumanPlayer)
    expect(@game_mode.set_up_game(choice, @board, @display)[1]).to be_a(HumanPlayer)
  end

  it "returns a human player and a computer player" do
    choice = 2
    expect(@game_mode.set_up_game(choice, @board, @display)[0]).to be_a(HumanPlayer)
    expect(@game_mode.set_up_game(choice, @board, @display)[1]).to be_a(ComputerPlayer)
  end
end
