class GameFactory

  def initialize(player_factory, game_mode, display, board)
    @player_factory = player_factory
    @game_mode = game_mode
    @display = display
    @board = board
  end

  def create_game
    welcome_players
    present_board
    players = @player_factory.set_up_players(@game_mode.choose_game_mode, @board, @display)
    game = Game.new(@display, @board, players)
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board
    @display.present_board_with_squares(@board)
  end
end
