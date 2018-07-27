class Board

  attr_reader :dimension, :grid

  FIRST_ELEMENT = 0
  NUMBER_ONE = 1
  NUMBER_TWO = 2

  def initialize(size)
    @dimension = size
    @grid = create_grid
  end

  def create_grid
    (NUMBER_ONE..(@dimension ** NUMBER_TWO)).to_a
  end

  def mark_board(cell_number, mark)
    @grid[cell_number - NUMBER_ONE] = mark
  end

  def possible_rows
    @grid.each_slice(@dimension).to_a
  end

  def possible_columns
    possible_rows.transpose
  end

  def possible_diagonals
    diagonals = []
    position = FIRST_ELEMENT
    diagonals << add_diagonal(position, :+)
    diagonals << add_diagonal(position + @dimension - NUMBER_ONE, :-)
    diagonals
  end

  def end_of_game?
    win? || draw?
  end

  def win?
    all_winning_combinations.any? { |line| includes_identical_elements?(line)}
  end

  def winning_mark
    if win?
      winning_line = all_winning_combinations.find { |line| includes_identical_elements?(line)}
      winning_line[0]
    end
  end

  private

  def add_diagonal(position, operation)
    cells = []
    until cells.count == @dimension
      cells << @grid[position]
      position += calculation(@dimension, NUMBER_ONE, operation)
    end
    cells
  end

  def calculation(a, b, operation)
    a.send(operation, b)
  end

  def number_of_possible_combinations
    @dimension * NUMBER_TWO + NUMBER_TWO
  end

  def draw?
    @grid.all? { |i| i.is_a?(String) }
  end

  def all_winning_combinations
    combinations = []
    combinations << possible_rows
    combinations << possible_columns
    combinations << possible_diagonals
    combinations.flatten(NUMBER_ONE)
  end

  def includes_identical_elements?(line)
    line.all? { |cell| cell == line[0] }
  end
end
