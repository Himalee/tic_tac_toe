class GameMode

  def initialize(display)
    @display = display
  end

  def choose_game_mode
    @display.choose_game_mode
    @display.receive_integer
  end
end
