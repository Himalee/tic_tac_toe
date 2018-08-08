class Board

  attr_reader :dimension, :grid

  FIRST_ELEMENT = 0

  def initialize(size)
    @dimension = size
    @grid = create_grid
  end

  def create_grid
    (1..(max_number_of_cells)).to_a
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
    diagonals << add_diagonal(grid, position + @dimension - 1, :-)
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
    @dimension ** 2
  end

  def draw?(grid)
    !win?(grid) && grid.all? { |i| i == Mark::PLAYER_ONE_MARK || i == Mark::PLAYER_TWO_MARK }
  end

  private

  def index_position(cell_number)
    cell_number - 1
  end

  def add_diagonal(grid, position, operation)
    cells = []
    until cells.count == @dimension
      cells << grid[position]
      position += calculation(@dimension, 1, operation)
    end
    cells
  end

  def calculation(a, b, operation)
    a.send(operation, b)
  end

  def all_winning_combinations(grid)
    combinations = []
    combinations << possible_rows(grid)
    combinations << possible_columns(grid)
    combinations << possible_diagonals(grid)
    combinations.flatten(1)
  end

  def includes_identical_elements?(line)
    line.all? { |cell| cell == line[FIRST_ELEMENT] }
  end
end
