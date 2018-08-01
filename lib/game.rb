class Game

  PLAYER_ONE_MARK = "X"
  PLAYER_TWO_MARK = "O"

  def initialize(display, board, players)
    @display = display
    @board = board
    @players = players
  end

  def play
    turns
    present_result
  end

  private

  def turns
    current_player = @players[0]
    opponent = @players[1]
    until @board.end_of_game?
      current_player.turn
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
