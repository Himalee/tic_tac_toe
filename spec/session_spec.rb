require "session"
require "game_mode"
require "game_factory"

describe Session do
  it "returns draw given human vs human game mode" do
    grid = (1..9).to_a
    board = Board.new(grid)
    message = Message.new
    output = StringIO.new
    input = StringIO.new("1\n1\n2\n3\n4\n6\n9\n7\n5\n8\nn")
    console = Console.new(output, input)
    validator = Validator.new
    display = Display.new(console, message, validator)
    game_mode = GameMode.new(display)
    player_factory = PlayerFactory.new
    game_factory = GameFactory.new(player_factory, game_mode, display)
    session = Session.new(game_factory, display)
    session.start
    expect(output.string).to include("draw")
  end
end
