require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix.push([pixel, x, y])
  end

  def at(x, y)
    value = @matrix.first{|p, xx, yy| xx == x && yy == y}

    value ? value.first : nil

  end

  private

  def inbounds(x, y)

  end

end