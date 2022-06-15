require_relative "./piece.rb"

class Pawn < Piece

    def symbol
        :P
    end

    def moves
        row, col = self.pos
        total_moves = []
        if col == 1 || col == 6
            total_moves.concat(first_move)
        else
            total_moves.concat(rest_of_moves)
        end
        total_moves.concat(attack_move)
        total_moves
    end

    def unblocked?(next_pos)
        if next_pos == self.board.null_piece
            return true
        else
            return false
        end
    end

    def first_move
        row, col = self.pos
        moves = []
        one_space =  [5, col]
        two_spaces =  [4, col]
        if self.color == :black
            one_space =  [2, col]
            two_spaces =  [3, col]
        end
        moves << one_space if unblocked?(one_space)
        moves << two_spaces if unblocked?(two_spaces)
        moves
    end

    def rest_of_moves
        row, col = self.pos
        self.color == :black ? next_pos = [row + 1, col] : next_pos = [row + 1, col]
        return next_pos if row <= 7 && row >= 0 && unblocked?(next_pos)
        return []
    end

    def attack_move
        row, col = self.pos
        # if self.board.valid_position?(row, col)
        possible_moves = [[1,1], [1, -1]]
        moves = []
        self.color == :white ? temp_color = :black : temp_color = :white
        possible_moves.each do |move|
            move_row, move_col = move
            temp_pos = [move_row + row, move_col + col]
            temp_pos = [row - move_row, col - move_col] if self.color == :white
            moves << temp_pos if self.board[temp_pos].color == temp_color && self.board.valid_position?(temp_pos)
        end
        moves
    end
end 