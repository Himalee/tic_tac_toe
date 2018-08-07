class Player

  attr_reader :mark

  def initialize(board, display, mark)
    @board = board
    @display = display
    @mark = mark
  end
end
