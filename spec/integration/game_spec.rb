require "game"
require "player"
require "Mark"
require "board"
require "message"
require "console"
require "display"
require "human_player"

describe Game do

  before :each do
    dimension = 3
    @board = Board.new(dimension)
    @output = StringIO.new
    @message = Message.new
    @validator = MoveValidator.new(@board)
  end

  context "human vs human game" do
    it "returns marked board given numbers from console" do
      input = StringIO.new("1\n4\n2\n5\n3")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [HumanPlayer.new(@board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(@board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, @board, players)
      game.play
      expect(@output.string).to include(" X │ X │ X \n───┼───┼───\n O │ O │ 6 \n───┼───┼───\n 7 │ 8 │ 9\n")
    end

    it "returns win with invalid choices" do
      input = StringIO.new("1\n1\n4\nhello\n2\n5\n7\n6")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [HumanPlayer.new(@board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(@board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, @board, players)
      game.play
      expect(@output.string).to include("Player two wins")
    end

    it "returns draw" do
      input = StringIO.new("1\n2\n3\n4\n6\n9\n7\n5\n8")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [HumanPlayer.new(@board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(@board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, @board, players)
      game.play
      expect(@output.string).to include("draw")
    end
  end

  context "computer vs human game" do
    it "returns player one wins" do
      @board.mark_board(1, "X")
      @board.mark_board(2, "O")
      @board.mark_board(3, "X")
      @board.mark_board(4, "O")
      @board.mark_board(5, "X")
      @board.mark_board(6, "O")
      @board.mark_board(8, "X")
      @board.mark_board(7, "O")
      input = StringIO.new("2")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [ComputerPlayerRandom.new(@board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(@board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, @board, players)
      game.play
      expect(@output.string).to include("Player one wins")
    end
  end
end
