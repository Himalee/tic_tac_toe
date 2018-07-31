require "computer_player"

describe ComputerPlayer do
  it "returns number between 1 and 9" do
    computer_player = ComputerPlayer.new
    board = Board.new(3)
    expect(computer_player.get_random_cell(board)).to be_between(1, 9)
  end
end
