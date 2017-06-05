class MissionVisualizer
  attr_reader :rovers, :landscape, :instructions

  def initialize(params)
    @landscape    = params[:terrain].landscape
    @rovers       = params[:rovers]
    @instructions = params[:instructions]
  end

  def run!
    @instructions.each_with_index do |commands, rover_index|
      commands.split("").each do |command|
        @rovers[rover_index].move(command)
        display_movement
      end
    end
  end

  private

  def display_movement
    clear_screen!
    move_to_home!
    reset_landscape!
    place_rovers
    print_landscape
    sleep(0.2)
  end

  def place_rovers
    @rovers.each do |rover|
      @landscape[rover.y_coord][rover.x_coord] = rover.name
    end
  end

  def reset_landscape!
    @landscape.each do |key, value|
      value.map! {|val| "-"}
    end
  end

  def print_landscape
    @landscape.each do |key, value|
      puts value.join("\t")  
    end
  end

  def clear_screen!
    print "\e[2J"
  end
   
  # Moves cursor to the top left of the terminal
  def move_to_home!
    print "\e[H"
  end

end