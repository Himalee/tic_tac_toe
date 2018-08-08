class Validator

  def initialize(board)
    @board = board
  end

  def cell?(choice)
    valid_options = @board.grid.reject { |cell| cell.to_s[/[^1-9]/] }
    valid_options.include?(choice)
  end

  def game_mode?(choice)
    [1, 2, 3, 4, 5, 6].include?(choice)
  end

  def play_again?(choice)
    ["y", "n"].include?(choice)
  end
end
