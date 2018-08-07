class ComputerPlayerMinMax < Player

  def initialize(game)
    @game = game
  end

  def get_cell
    MinMax.new(@board, @game).minmax(@board.grid, 0, self.mark)
  end
end
