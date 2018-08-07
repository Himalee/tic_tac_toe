class MinMax

  def initialize(board)
    @board = board
  end

  def get_cell
    minmax(@board.grid, 0)
  end

  def minmax(grid, depth, mark)
    return score(grid) if @board.end_of_game?(grid)
    scores = []
    moves = []
    available_positions(grid).each do |cell|
      possible_grid = grid.dup
      other_grid = @board.new_board(possible_grid, cell, mark)
      scores.push minmax(other_grid, depth + 1, opponent_mark(mark))
      moves.push cell
    end
    position = scores.each_with_index.max[1]
    choice = moves[position]
    choice
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

  def score(grid)
    if @board.winning_mark(grid) == "X"
      +10
    elsif @board.winning_mark(grid) == "O"
      -10
    else
      0
    end
  end
end
