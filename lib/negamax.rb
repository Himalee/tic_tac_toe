class Negamax

  def initialize(board)
    @board = board
  end

  def get_best_move(grid, depth=0, best_score={}, mark)
    return 0 if @board.draw?(grid)
    return -1 if @board.win?(grid)
    available_positions(grid).each do |cell|
      possible_grid = grid.dup
      other_grid = @board.new_board(possible_grid, cell, mark)
      best_score[cell] = -1 * get_best_move(other_grid, depth + 1, {}, opponent_mark(mark))
    end
    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]
    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

  def opponent_mark(mark)
    if mark == "X"
      "O"
    else
      "X"
    end
  end

  def available_positions(grid)
    grid.reject { |cell| cell.to_s[/[^1-9]/] }
  end
end
