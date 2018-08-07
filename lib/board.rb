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
    (NUMBER_ONE..(max_number_of_cells)).to_a
  end

  def mark_board(cell_number, mark)
    @grid[index_position(cell_number)] = mark
  end

  def new_board(grid, cell_number, mark)
    grid[index_position(cell_number)] = mark
    grid
  end

  def possible_rows(grid)
    grid.each_slice(@dimension).to_a
  end

  def possible_columns(grid)
    possible_rows(grid).transpose
  end

  def possible_diagonals(grid)
    diagonals = []
    position = FIRST_ELEMENT
    diagonals << add_diagonal(grid, position, :+)
    diagonals << add_diagonal(grid, position + @dimension - NUMBER_ONE, :-)
    diagonals
  end

  def end_of_game?(grid)
    win?(grid) || draw?(grid)
  end

  def win?(grid)
    all_winning_combinations(grid).any? { |line| includes_identical_elements?(line)}
  end

  def winning_mark(grid)
    if win?(grid)
      winning_line = all_winning_combinations(grid).find { |line| includes_identical_elements?(line)}
      winning_line[FIRST_ELEMENT]
    end
  end

  def max_number_of_cells
    @dimension ** NUMBER_TWO
  end

  def draw?(grid)
    !win?(grid) && grid.all? { |i| i == Mark::PLAYER_ONE_MARK || i == Mark::PLAYER_TWO_MARK }
  end

  private

  def index_position(cell_number)
    cell_number - NUMBER_ONE
  end

  def add_diagonal(grid, position, operation)
    cells = []
    until cells.count == @dimension
      cells << grid[position]
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

  def all_winning_combinations(grid)
    combinations = []
    combinations << possible_rows(grid)
    combinations << possible_columns(grid)
    combinations << possible_diagonals(grid)
    combinations.flatten(NUMBER_ONE)
  end

  def includes_identical_elements?(line)
    line.all? { |cell| cell == line[FIRST_ELEMENT] }
  end
end
