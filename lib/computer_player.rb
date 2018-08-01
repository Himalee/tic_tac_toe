class ComputerPlayer < Player

  def get_cell
   choice = @board.create_grid.sample
   until @board.valid_cell?(choice)
     choice = @board.create_grid.sample
   end
   choice
 end
end
