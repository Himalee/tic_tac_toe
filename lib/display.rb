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

  def get_valid_cell(board)
    choice = receive_integer
    until @validator.cell?(board, choice)
      choose_cell
      choice = receive_integer
    end
    choice
  end

  def valid_game_mode_response
    choice = receive_integer
    until @validator.game_mode?(choice)
      choose_game_mode
      choice = receive_integer
    end
    choice
  end

  def valid_play_again_response
    choice = receive_lower_case_character
    until @validator.play_again?(choice)
      play_again
      choice = receive_lower_case_character
    end
    choice
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
    @console.receive.downcase
  end
end
