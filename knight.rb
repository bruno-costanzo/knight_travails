# frozen_string_literal: true

# A kinght in a chess board
class Knight
  POS_MVS = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].freeze

  def initialize(position = nil)
    @position = position
  end

  def position_creator(result = [])
    POS_MVS.each do |possible_move|
      x = @position[0] + possible_move[0]
      y = @position[1] + possible_move[1]
      # puts "Rejected [#{x}, #{y}]" unless x.between?(0, 7) && y.between?(0, 7)
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result
  end
end
