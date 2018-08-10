class PlayerFactory

  HUMAN_VS_HUMAN = 1
  HUMAN_VS_RANDOM = 2
  RANDOM_VS_HUMAN = 3
  HUMAN_VS_AI = 4
  AI_VS_HUMAN = 5
  AI_VS_AI = 6

  def set_up_players(choice, board, display)
    case choice
    when HUMAN_VS_HUMAN
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    when HUMAN_VS_RANDOM
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerRandom.new(board, display, Mark::PLAYER_TWO_MARK)]
    when RANDOM_VS_HUMAN
      [ComputerPlayerRandom.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    when HUMAN_VS_AI
      [HumanPlayer.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerAI.new(board, display, Mark::PLAYER_TWO_MARK)]
    when AI_VS_HUMAN
      [ComputerPlayerAI.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
    when AI_VS_AI
      [ComputerPlayerAI.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerAI.new(board, display, Mark::PLAYER_TWO_MARK)]
    end
  end
end
