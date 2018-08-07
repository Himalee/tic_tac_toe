class Game

  PLAYER_ONE_MARK = "X"
  PLAYER_TWO_MARK = "O"

  def initialize(display, board, players)
    @display = display
    @board = board
    @players = players
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
    current_player = @players[0]
    opponent = @players[1]
    until @board.end_of_game?
      @display.choose_cell
      number = current_player.get_cell
      @board.mark_board(number, current_player.mark)
      @display.present_board_with_squares(@board)
      current_player, opponent = opponent, current_player
    end
  end

  def present_result
    if @board.winning_mark == Peg::PLAYER_ONE_MARK
      @display.player_one_wins
    elsif @board.winning_mark == Peg::PLAYER_TWO_MARK
      @display.player_two_wins
    else
      @display.draw
    end
  end
end
