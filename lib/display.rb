class Display

  def initialize(console = Console.new, message)
    @console = console
    @message = message
  end

  def present_board_with_squares(board)
    grid = board.grid
    presentable_board = ""
    grid.each_with_index { |cell, index|
      presentable_board << "[#{cell}] "
    if (index + 1) % board.dimension == 0
      presentable_board << "\n"
    end }
    @console.present(presentable_board)
  end

  def dimension(board)
    board.dimension
  end

  def welcome
    @console.present(@message.welcome)
  end

  def choose_cell
    @console.present(@message.prompt_for_cell)
  end

  def receive_integer
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
