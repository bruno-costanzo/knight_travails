# frozen_string_literal: true

require_relative 'knight'

# class for each movement in the board
class Node
  attr_accessor :value, :parent

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
  end
end

# Class for the board
class GameBoard
  def initialize
    # A game board
  end

  def knight_moves(start, target)
    return if input_error(start, target)

    best_path_node = create_tree(start, target)
    best_path_generator(best_path_node)
  end

  def input_error(start, target)
    unless start[0].between?(0, 7) && start[1].between?(0, 7) && target[0].between?(0, 7) && target[1].between?(0, 7)
      puts 'Invalid Input. Numbers go to 0 to 7'

      return true
    end
    false
  end

  def create_tree(start, target, queue = [])
    queue << Node.new(start)
    current = queue.shift
    until current.value == target
      arr_of_moves = pos_moves_creator(current.value)
      queue += arr_of_moves.map do |next_move|
        Node.new(next_move, current)
      end
      current = queue.shift
    end
    current
  end

  def pos_moves_creator(position)
    knight = Knight.new(position)
    knight.position_creator
  end

  def best_path_generator(node, path = [])
    until node.nil?
      path << node.value
      node = node.parent
    end
    display_result(path)
  end

  def display_result(path)
    puts "Congrats! Made in #{path.size - 1} moves"
    idx = 0
    until path.empty?
      puts "##{idx}: #{path.pop}"
      idx += 1
    end
  end
end
