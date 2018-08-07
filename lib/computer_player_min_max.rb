class ComputerPlayerMinMax < Player

  def get_cell
    MinMax.new(@board).get_best_move(@board.grid, self.mark)
  end
end
