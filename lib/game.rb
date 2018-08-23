class Game

  FIRST_ELEMENT = 0

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
    until @board.end_of_game?(@board.grid)
      @display.choose_cell
      number = current_player.get_cell(@board)
      @board = @board.new_board(number, current_player.mark)
      @display.present_board_with_squares(@board)
      next_player
    end
  end

  def current_player
    @players[FIRST_ELEMENT]
  end

  def next_player
    @players.rotate!
  end

  def present_result
    if @board.winning_mark(@board.grid) == Mark::PLAYER_ONE_MARK
      @display.player_one_wins
    elsif @board.winning_mark(@board.grid) == Mark::PLAYER_TWO_MARK
      @display.player_two_wins
    else
      @display.draw
    end
  end
end
