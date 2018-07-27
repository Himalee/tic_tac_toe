class Board

  attr_reader :size, :grid

  FIRST_ELEMENT = 0
  NUMBER_ONE = 1
  NUMBER_TWO = 2

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

  def dimension
    Math.sqrt(size)
  end

  def end_of_game
    win? || draw?
  end

  def win?
    position = FIRST_ELEMENT
    array_of_results = []
    until position == number_of_possible_combinations || array_of_results.include?(true)
      line = all_winning_combinations[position]
      array_of_results << includes_identical_elements?(line)
      position += NUMBER_ONE
    end
    array_of_results.include?(true)
  end

  def winning_mark
    position = FIRST_ELEMENT
    result = []
    until position == number_of_possible_combinations || result.include?(true)
      line = all_winning_combinations[position]
      position += NUMBER_ONE
      if includes_identical_elements(line)
        result << line
      end
    end
    result.flatten[0]
  end

  private

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

  def number_of_possible_combinations
    dimension * NUMBER_TWO + NUMBER_TWO
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

  def includes_identical_elements(line)
    if line.all? { |cell| cell == line[0] }
      line[0]
    end
  end
end
