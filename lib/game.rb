class Game
  def initialize(display, board)
    @display = display
    @board = board
  end

  public

  def play
    welcome_players
    present_board
    turn
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board
    @display.present_board(@board.grid)
  end

  def turn
    @display.choose_cell
    number = @display.receive_cell_choice
    @board.mark_board(number, "X")
    @display.present_board(@board.grid)
  end
end
