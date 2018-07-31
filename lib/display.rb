class Display

  def initialize(console = Console.new, message)
    @console = console
    @message = message
  end

  def present_board_with_squares(board)
    grid = board.grid
    presentable_board = ""
    grid.each_with_index { |cell, index|
    if (index + 1) == board.max_number_of_cells
      presentable_board << " #{cell}"
    elsif (index + 1) % board.dimension == 0
      presentable_board << " #{cell} #{insert_line(board)}"
    elsif (index + 1) > 9
      presentable_board << "#{cell} │"
    else
      presentable_board << " #{cell} │"
    end }
    @console.present(presentable_board)
  end

  def insert_line(board)
    line = "───┼" * (board.dimension - 1)
    "\n#{line}───\n"
  end

  def welcome
    @console.present(@message.welcome)
  end

  def choose_cell
    @console.present(@message.prompt_for_cell)
  end

  def valid_play_again_response
    response = receive_lower_case_character.downcase
    valid_options = ["y", "n"]
    if !valid_options.include?(response)
      play_again
      valid_play_again_response
    else
      response
    end
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

  def play_again
    @console.present(@message.replay)
  end

  def receive_integer
    @console.receive.to_i
  end

  private

  def receive_lower_case_character
    @console.receive
  end
end
