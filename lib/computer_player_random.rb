class ComputerPlayerRandom < Player

  def get_cell
    valid_options = @board.grid.reject { |cell| cell.to_s[/[^1-9]/] }
    valid_options.sample
  end
end
