require "byebug"
module Slideable

   HORIZONTAL_DIRS = [[0, 1], [0, -1], [-1, 0], [1, 0]].freeze
   DIAGONAL_DIRS = [[-1, 1], [-1, -1], [1, 1], [1, -1]].freeze

    def moves
        arr = []
        move_dirs.each do |dirs|
            if dirs == :horizontal
                arr.concat(horizontal_dirs)
            elsif dirs == :diagonal
                arr.concat(diagonal_dirs)
            end
        end
        arr
    end

    def move_dirs
        [:horizontal, :diagonal]
    end

    def horizontal_dirs
        self.grow_unblocked_moves_in_dir(HORIZONTAL_DIRS)
    end

    def diagonal_dirs
        self.grow_unblocked_moves_in_dir (DIAGONAL_DIRS)
    end

    def in_board?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    def grow_unblocked_moves_in_dir(constant)
        arr = []
        constant.each do |pos|
            arr.concat(one_direction(pos))
        end
        arr
    end

    def one_direction(direction)
        unblocked = true
        arr = []
        next_pos = [self.pos[0] + direction[0], self.pos[1] + direction[1]]
        while unblocked
            if in_board?(next_pos) 
                if next_pos == self.board.null_piece
                    arr << next_pos
                elsif self.board[next_pos].color != self.color
                    arr << next_pos
                    unblocked = false
                else
                    unblocked = false
                end
            else
                unblocked = false
            end
            next_pos = [next_pos[0] + direction[0], next_pos[1] + direction[1]]
        end
        arr
    end
end

