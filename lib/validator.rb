class Validator

  VALID_GAME_MODES = [1, 2, 3, 4, 5, 6]
  VALID_PLAY_AGAIN_RESPONSES = ["y", "n"]

  def initialize(board)
    @board = board
  end

  def cell?(choice)
    @board.available_positions(@board.grid).include?(choice)
  end

  def game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def play_again?(choice)
    VALID_PLAY_AGAIN_RESPONSES.include?(choice)
  end
end
