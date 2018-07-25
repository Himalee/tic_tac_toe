class Game
  def initialize(display, board)
    @display = display
    @board = board
  end

  def play
    @display.welcome
    @display.present_board(@board.grid)
    @display.choose_cell
    number = @display.receive_cell_choice
    @board.mark_board(number, "X")
    @display.present_board(@board.grid)
  end
end
