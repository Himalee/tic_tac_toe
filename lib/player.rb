class Player

  def initialize(board, display)
    @board = board
    @display = display
  end

  def turn(mark)
    @display.choose_cell
    number = get_cell
    @board.mark_board(number, mark)
    @display.present_board_with_squares(@board)
  end
end
