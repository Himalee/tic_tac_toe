class ComputerPlayerRandom < Player

  def get_cell(board)
    board.available_positions(board.grid).sample
  end
end
