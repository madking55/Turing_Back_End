class Board
  attr_reader :cells

  def initialize
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")
    }
  end

  # Validating Coordinates
  def vaild_coordinate?(cell)
    @cells.keys.include?(cell)
  end

  # Validating Placements
  def valid_placement?(ship, coordinates)
    coordinates_and_ship_size_equal?(ship, coordinates) && 
    consecutive_coordinates?(ship, coordinates)
  end

  def coordinates_and_ship_size_equal?(ship, coordinates)
    ship.length == coordinates.count
  end

  def consecutive_coordinates?(ship, coordinates)
    horizontal_check(ship, coordinates) || vertical_check(ship, coordinates)
  end

  def horizontal_check(ship, coordinates)
    # find the first cell in coordinates
    c = coordinates[0]  

    # find index of c in cells
    index_of_c_in_cells = @cells.keys.index(coordinates[0]) 

    # check if coordinates array is equal to array in rows starting from c
    coordinates == @cells.keys[index_of_c_in_cells...coordinates.size + index_of_c_in_cells]
  end

  def vertical_check(ship, coordinates)
    row_size = Math.sqrt(@cells.size).to_i

    # check if coordinates array is equal to array in columns starting from c
    expected = []
    expected[0] = coordinates[0] 
  
    while expected.size < coordinates.size do 
      expected << @cells.keys[@cells.keys.index(expected.last) + row_size]
    end
    expected 

    expected == coordinates
  end

end