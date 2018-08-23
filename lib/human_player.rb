class HumanPlayer < Player

  def get_cell(board)
    @display.get_valid_cell(board)
  end
end
