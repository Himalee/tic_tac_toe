class ComputerPlayerRandom < Player

  def get_cell
    @board.available_positions(@board.grid).sample
  end
end
