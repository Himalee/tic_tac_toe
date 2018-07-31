class Player

  def initialize(board, display, mark)
    @board = board
    @display = display
    @mark = mark
  end

  def turn
    @display.choose_cell
    number = get_cell
    @board.mark_board(number, @mark)
    @display.present_board_with_squares(@board)
  end
end
