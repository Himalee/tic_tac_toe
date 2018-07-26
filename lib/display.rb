class Display

  def initialize(console = Console.new, message)
    @console = console
    @message = message
  end

  public

  def present_board_with_squares(grid)
    board = ""
    grid.each_with_index { |cell, index|
      board << "[#{cell}] "
    if (index + 1) % size_of_grid(grid) == 0
      board << "\n"
    end }
    @console.present(board)
  end

  def size_of_grid(grid)
    Math.sqrt(grid.size)
  end

  def welcome
    @console.present(@message.welcome)
  end

  def choose_cell
    @console.present(@message.prompt_for_cell)
  end

  def receive_cell_choice
    @console.receive.to_i
  end
end
