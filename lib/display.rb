class Display

  def initialize(console = Console.new)
    @console = console
  end

  def present_board(grid)
    position_in_array = 0
    while position_in_array < grid.size
      @console.present(grid.slice(position_in_array, size_of_grid(grid)).join(" "))
      position_in_array += size_of_grid(grid)
    end
  end

  def size_of_grid(grid)
    Math.sqrt(grid.size)
  end

  def welcome
    @console.present("Welcome to Tic Tac Toe")
  end

  def choose_cell
    @console.present("Pick a number between 1 and 9 to place your mark")
  end

  def receive_cell_choice
    @console.receive.to_i
  end
end
