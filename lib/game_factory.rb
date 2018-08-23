class GameFactory

  def initialize(player_factory, game_mode, display)
    @player_factory = player_factory
    @game_mode = game_mode
    @display = display
  end

  def create_game
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    welcome_players
    present_board(board)
    players = @player_factory.set_up_players(@game_mode.choose_game_mode, board, @display)
    game = Game.new(@display, board, players)
  end

  private

  def welcome_players
    @display.welcome
  end

  def present_board(board)
    @display.present_board_with_squares(board)
  end
end
