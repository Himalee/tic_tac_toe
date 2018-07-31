class GameMode

  def set_up_game(choice, board, display)
    if choice == 1
      [HumanPlayer.new(board, display), HumanPlayer.new(board, display)]
    elsif choice == 2
      [HumanPlayer.new(board, display), ComputerPlayer.new(board, display)]
    end
  end
end
