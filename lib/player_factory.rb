class PlayerFactory

  def set_up_players(choice, board, display)
    if choice == 1
      [HumanPlayer.new(board, display, Peg::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Peg::PLAYER_TWO_MARK)]
    elsif choice == 2
      [HumanPlayer.new(board, display, Peg::PLAYER_ONE_MARK), ComputerPlayer.new(board, display, Peg::PLAYER_TWO_MARK)]
    elsif choice == 3
      [ComputerPlayer.new(board, display, Peg::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Peg::PLAYER_TWO_MARK)]
    end
  end
end
