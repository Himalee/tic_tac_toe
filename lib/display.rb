class Display

  def initialize(console = Console.new, message, validator)
    @console = console
    @message = message
    @validator = validator
  end

  def present_board_with_squares(board)
    presentable_board = ""
    board.grid.each_with_index { |cell, index|
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

  def get_valid_cell
    choice = receive_integer
    until @validator.valid_cell?(choice)
      choose_cell
      choice = receive_integer
    end
    choice
  end

  def valid_game_mode_response
    response = receive_integer
    valid_options = [1, 2, 3, 4, 5]
    until valid_options.include?(response)
      choose_game_mode
      response = receive_integer
    end
    response
  end

  def valid_play_again_response
    response = receive_lower_case_character.downcase
    valid_options = ["y", "n"]
    until valid_options.include?(response)
      play_again
      response = receive_lower_case_character.downcase
    end
    response
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

  def choose_game_mode
    @console.present(@message.game_mode)
  end

  private

  def receive_lower_case_character
    @console.receive
  end
end
