class Message

  def welcome
    "Welcome to Tic Tac Toe\nPlayer one = X\nPlayer two = O"
  end

  def prompt_for_cell
    "Pick a number between 1 and 9 to place your mark"
  end

  def player_one_wins
    "Player one wins!"
  end

  def player_two_wins
    "Player two wins!"
  end

  def draw
    "It's a draw"
  end

  def replay
    "Replay game? Type 'y' to replay or 'n' to end"
  end

  def game_mode
    "Would you like to play:\n1. Human vs Human\n2. Human vs ComputerRandom\n3. ComputerRandom vs Human\n4. Human vs ComputerMinMax\n5. ComputerMinMax vs Human"
  end
end
