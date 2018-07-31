class ComputerPlayer < Player

  def get_cell
    choice = @board.create_grid.sample
    if !@board.valid_cell?(choice)
      get_cell
    else
      choice
    end
  end
end
