class Game

  PLAYER_ONE_MARK = "X"
  PLAYER_TWO_MARK = "O"

  def initialize(display, board)
    @display = display
    @board = board
  end

  def play
    welcome_players
    present_board
    player_turns
    present_winner
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board
    @display.present_board(@board.grid)
  end

  def player_turns
    current_player = PLAYER_ONE_MARK
    opponent = PLAYER_TWO_MARK
    until @board.end_of_game
      one_turn(current_player)
      current_player, opponent = opponent, current_player
    end
  end

  def one_turn(mark)
    @display.choose_cell
    number = @display.receive_cell_choice
    @board.mark_board(number, mark)
    @display.present_board(@board.grid)
  end

  def present_winner
    if @board.winning_mark == PLAYER_ONE_MARK
      @display.player_one_wins
    elsif @board.winning_mark == PLAYER_TWO_MARK
      @display.player_two_wins
    else
      @display.draw
    end
  end
end
