class Board

  attr_reader :size, :grid

  def initialize(size)
    @size = size
    @grid = create_grid
  end

  def create_grid
    (1..@size).to_a
  end

  def mark_board(number, mark)
    @grid[number - 1] = mark
  end
end
