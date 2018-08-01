class GameMode

  def initialize(display)
    @display = display
  end

  def choose_game_mode
    @display.choose_game_mode
    @display.valid_game_mode_response
  end
end
