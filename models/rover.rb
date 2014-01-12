class Rover
  attr_reader :name, :x_coord, :y_coord, :heading, :starting_position

  def initialize(name, *starting_position)
    @name    = name
    @x_coord = starting_position[0].to_i
    @y_coord = starting_position[1].to_i
    @heading = starting_position[2]
    @COMPASS = %w(W N E S)
  end

  def current_positioning
    "#{@x_coord}, #{@y_coord}, #{@heading}"
  end

  def move(command)
    if command    == "L"
      turn_left
    elsif command == "R"
      turn_right
    elsif command == "M"
      go_forward
    else
      raise ArgumentError, "Commands must contain only 'L', 'R' or 'M'"
    end
  end

  private

  def turn_left
    current_index = @COMPASS.index(@heading)
    @heading      = @COMPASS[current_index - 1]
  end

  def turn_right
    current_index = @COMPASS.index(@heading)
    current_index >= @COMPASS.length-1 ? @heading = @COMPASS[0] : @heading = @COMPASS[current_index + 1]
  end

  def go_forward
    if @heading    == "W"
      @x_coord += -1
    elsif @heading == "N"
      @y_coord += 1
    elsif @heading == "E"
      @x_coord += 1
    elsif @heading == "S"
      @y_coord += -1
    end
  end
end