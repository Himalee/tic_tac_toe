class Board

  attr_reader :size, :grid

  FIRST_ELEMENT = 0
  NUMBER_ONE = 1

  def initialize(size)
    @size = size
    @grid = create_grid
  end

  public

  def create_grid
    (NUMBER_ONE..@size).to_a
  end

  def mark_board(number, mark)
    @grid[number - NUMBER_ONE] = mark
  end

  def possible_rows
    rows = []
    position = FIRST_ELEMENT
    until rows.count == dimension
      rows << @grid.slice(position, dimension)
      position += dimension
    end
    rows
  end

  def possible_columns
    columns = []
    position = FIRST_ELEMENT
    until columns.count == dimension
      columns << add_column(position)
      position += NUMBER_ONE
    end
    columns
  end

  def possible_diagonals
    diagonals = []
    position = FIRST_ELEMENT
    diagonals << add_diagonal(position, :+)
    diagonals << add_diagonal(position + dimension - NUMBER_ONE, :-)
    diagonals
  end

  def add_column(position)
    cells = []
    until cells.count == dimension
      cells << @grid[position]
      position += dimension
    end
    cells
  end

  def add_diagonal(position, operation)
    cells = []
    until cells.count == dimension
      cells << @grid[position]
      position += calculation(dimension, NUMBER_ONE, operation)
    end
    cells
  end

  def calculation(a, b, operation)
    a.send(operation, b)
  end

  def dimension
    Math.sqrt(size)
  end

  def all_winning_combinations
    combinations = []
    combinations << possible_rows
    combinations << possible_columns
    combinations << possible_diagonals
    combinations.flatten(1)
  end
end
