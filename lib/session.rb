class Session

  REPLAY_CHOICE = "y"

  def initialize(game_factory, display)
    @game_factory = game_factory
    @display = display
  end

  def start
    game = @game_factory.create_game
    game.play
    replay
  end

  private

  def replay
    @display.play_again
    choice = @display.valid_play_again_response
    if choice == REPLAY_CHOICE
      start
    end
  end
end
