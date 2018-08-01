class MoveValidator

  def initialize(board)
    @board = board
  end

  def valid_cell?(choice)
    valid_options = @board.grid.reject { |cell| cell.to_s[/[^1-9]/] }
    valid_options.include?(choice)
  end
end
