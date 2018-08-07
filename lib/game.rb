class Game

  def initialize(display, board, players)
    @display = display
    @board = board
    @players = players
  end

  def play
    turns
    present_result
  end

  def current_player
    @players[0]
  end

  def next_player
    @players.rotate!
  end

  private

  def turns
    until end_of_game?(@board.grid)
      @display.choose_cell
      number = current_player.get_cell
      mark_board(number, current_player.mark)
      @display.present_board_with_squares(@board)
      next_player
    end
  end

  def end_of_game?(grid)
    @board.end_of_game?(grid)
  end

  def mark_board(number, mark)
    @board.mark_board(number, mark)
  end

  def new_board(grid, cell_number, mark)
    grid[index_position(cell_number)] = mark
    grid
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
