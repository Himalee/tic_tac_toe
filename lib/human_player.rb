class HumanPlayer < Player

  def get_cell
   choice = @display.receive_integer
   until @board.valid_cell?(choice)
     @display.choose_cell
     choice = @display.receive_integer
   end
   choice
 end
end
