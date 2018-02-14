require 'ostruct'

class BitmapEditor
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def run(command)
    split_command = command.split(" ")
    case split_command[0]
    when 'I'
      create(split_command)
    when 'L'
      add_colour(split_command)
    when 'V'
      draw_vertical_colour_line(split_command)
    else
      return "Unknown command"
    end
  end

  def create(split_command)
    width = split_command[1].to_i
    height = split_command[2].to_i

    image.create({width: width, height: height})
  end

  def add_colour(split_command)
    colour = split_command[3]
    point = coordinates(split_command[1].to_i, split_command[2].to_i)

    image.paint(point, colour)
  end

  def draw_vertical_colour_line(split_command)
    x = split_command[1].to_i
    y1 = split_command[2].to_i
    y2 = split_command[3].to_i
    colour = split_command[4]

    from, to = [y1, y2].minmax
    line = (from..to).map { |y| coordinates(x, y) }

    image.draw_vertical_colour_line(line, colour)
  end

  def coordinates(x, y)
    OpenStruct.new(x: x, y: y)
  end
end
