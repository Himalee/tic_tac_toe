require "player"
require "computer_player"

describe ComputerPlayer do
  it "returns number between 1 and 9" do
    board = Board.new(3)
    message = Message.new
    display = Display.new(message)
    computer_player = ComputerPlayer.new(board, display)
    expect(computer_player.get_cell).to be_between(1, 9)
  end
end
