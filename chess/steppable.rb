module Steppable
    KING_MOVES = [[0,1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, 0], [1, 0], [-1, -1]]
    KNIGHT_MOVES = [[1,2], [2,1], [-1,2], [2, -1], [-2, 1], [-2, -1], [-1, -2], [1, -2]]
 
    def in_board?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    def move_diffs
        [:king, :knight]
    end

    def moves
        arr = []
        move_diffs.each do |diffs|
            if diffs == :king
                arr.concat(king_diff)
            elsif diffs == :knight
                arr.concat(knight_diff)
            end
        end
        arr
    end

    def knight_diff
        self.get_moves(KNIGHT_MOVES)
    end

    def king_diff
        self.get_moves(KING_MOVES)
    end

    def get_moves(constant)
        arr = []
        constant.each do |pos|
            next_pos = [self.pos[0] + pos[0], self.pos[1] + pos[1]]
            if in_board?(next_pos) 
                if next_pos == self.board.null_piece
                    arr << next_pos
                elsif self.board[next_pos].color != self.color
                    arr << next_pos
                end
            end
        end
        arr
    end

end