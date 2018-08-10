require "game"
require "player"
require "mark"
require "board"
require "message"
require "console"
require "display"
require "human_player"
require "computer_player_ai"

describe Game do

  before :each do
    grid = (1..9).to_a
    @board = Board.new(grid)
    @output = StringIO.new
    @message = Message.new
    @validator = Validator.new
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
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", 9]
      board = Board.new(grid)
      input = StringIO.new("2")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [ComputerPlayerRandom.new(board, display, Mark::PLAYER_ONE_MARK), HumanPlayer.new(board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, board, players)
      game.play
      expect(@output.string).to include("Player one wins")
    end
  end

  context "computer vs computer game" do
    xit "returns player one wins" do
      grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      board = Board.new(grid)
      input = StringIO.new("6")
      console = Console.new(@output, input)
      display = Display.new(console, @message, @validator)
      players = [ComputerPlayerAI.new(board, display, Mark::PLAYER_ONE_MARK), ComputerPlayerAI.new(board, display, Mark::PLAYER_TWO_MARK)]
      game = Game.new(display, board, players)
      game.play
      expect(@output.string).to include("draw")
    end
  end
end
