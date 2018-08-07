class PlayerFactory

  def set_up_players(choice, board, display)
    if choice == 1
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    elsif choice == 2
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerRandom.new(board, display, Mark::PLAYER_TWO_MARK)]
    elsif choice == 3
      [ComputerPlayerRandom.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    elsif choice == 4
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerMinMax.new(board, display, Mark::PLAYER_TWO_MARK)]
    elsif choice == 5
      [ComputerPlayerMinMax.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    elsif choice == 6
      [ComputerPlayerMinMax.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerMinMax.new(board, display, Mark::PLAYER_TWO_MARK)]
    end
  end
end
