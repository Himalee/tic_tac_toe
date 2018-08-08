class ComputerPlayerAI < Player

  def get_cell
    Negamax.new(@board).get_best_move(@board.grid, self.mark)
  end
end
