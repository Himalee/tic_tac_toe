class Game

  PLAYER_ONE_MARK = "X"
  PLAYER_TWO_MARK = "O"

  def initialize(display, board)
    @display = display
    @board = board
  end

  public

  def play
    welcome_players
    present_board
    player_turns
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board
    @display.present_board_with_squares(@board.grid)
  end

  def player_turns
    one_turn(PLAYER_ONE_MARK)
    until @board.win?
      one_turn(PLAYER_TWO_MARK)
      player_turns
    end
  end

  def one_turn(mark)
    @display.choose_cell
    number = @display.receive_cell_choice
    @board.mark_board(number, mark)
    @display.present_board_with_squares(@board.grid)
  end
end
