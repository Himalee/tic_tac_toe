class Game

  PLAYER_ONE_MARK = "X"
  PLAYER_TWO_MARK = "O"

  def initialize(display, board, player)
    @display = display
    @board = board
    @player = player
  end

  def play
    welcome_players
    present_board
    turns
    present_result
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board
    @display.present_board_with_squares(@board)
  end

  def turns
    current_player = PLAYER_ONE_MARK
    opponent = PLAYER_TWO_MARK
    until @board.end_of_game?
      @player.turn(@display, @board, current_player)
      current_player, opponent = opponent, current_player
    end
  end

  def present_result
    if @board.winning_mark == PLAYER_ONE_MARK
      @display.player_one_wins
    elsif @board.winning_mark == PLAYER_TWO_MARK
      @display.player_two_wins
    else
      @display.draw
    end
  end
end
