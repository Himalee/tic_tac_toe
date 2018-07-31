class HumanPlayer < Player
  
  def get_cell
    choice = @display.receive_integer
    if !@board.valid_cell?(choice)
      @display.choose_cell
      get_cell
    else
      choice
    end
  end
end
