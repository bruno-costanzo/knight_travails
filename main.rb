# frozen_string_literal: true

require_relative 'knight'
require_relative 'game_board'

def knight_moves(init_pos, target_pos)
  game_board = GameBoard.new
  game_board.knight_moves(init_pos, target_pos)
end

knight_moves([0, 0], [7, 3])
