class Display

  def initialize(console = Console.new, message)
    @console = console
    @message = message
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
    @console.present(@message.welcome)
  end

  def choose_cell
    @console.present(@message.prompt_for_cell)
  end

  def receive_cell_choice
    @console.receive.to_i
  end

  def player_one_wins
    @console.present(@message.player_one_wins)
  end

  def player_two_wins
    @console.present(@message.player_two_wins)
  end

  def draw
    @console.present(@message.draw)
  end
end
