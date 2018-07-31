class Session

  def initialize(game_factory, display)
    @game_factory = game_factory
    @display = display
  end

  def start
    game = @game_factory.create_game
    game.play
    replay
  end

  def replay
    @display.play_again
    choice = @display.valid_play_again_response
    if choice == "y"
      start
    end
  end
end
