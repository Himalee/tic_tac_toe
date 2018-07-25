class Board

  def initialize(size)
    @size = size
    @grid = create_grid
  end

  def create_grid
    (0..@size - 1).to_a
  end
end
