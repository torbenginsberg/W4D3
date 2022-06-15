require_relative "./all_pieces.rb"

class Board
    def initialize
        @board = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.instance
        populate_board
    end

    attr_reader :board, :null_piece

    @@black_king_pos = []
    @@white_king_pos = []

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        board[row][col] = value
    end

    def valid_position?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    def populate_back_rows
        seq = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        seq.each_with_index do |ele, idx|
            ele.new(:black, self, [0, idx])
            ele.new(:white, self, [7, idx])
            if ele == King
                if ele.color == :black
                    @@black_king_pos = [0, idx]
                else
                    @@white_king_pos = [7, idx]
                end
            end
        end
        self
    end

    def populate_pawn_rows
        (0..7).each do |col_idx|
            Pawn.new(:black, self, [1, col_idx])
            Pawn.new(:white, self, [6, col_idx])
        end
    end

    def populate_null_rows
        (2..5).each do |row_idx|
            @board[row_idx].each_with_index { |ele, idx| @board[row_idx][idx] = @null_piece}
        end
    end

    def populate_board
        populate_back_rows
        populate_null_rows
        populate_pawn_rows
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def dup
        dupe = []
        board.each do |subarr|
            new_row = []
            subarr.each { |ele| new_row << ele}
            dupe << new_row
        end
        dupe
    end

    def move_piece(start_pos, end_pos)
        # begin
        #     raise EmptyStartPositionError if self[start_pos] == null_piece
            # if !valid_position?(end_pos)
            #     raise "Invalid move"
            # end
        piece = self[start_pos]
        self[start_pos] = @null_piece
        self[end_pos] = piece
        if piece.instance_of?(King)
            if piece.color == :black
                @@black_king_pos = end_pos
            else
                @@white_king_pos = end_pos
            end
        end
        piece.pos = end_pos
        # rescue EmptyStartPositionError
        #     puts "No piece at start position."
        #     retry
        # end
    end

    def in_check?(color)
        if color == :black
            
    end

    # def inspect
        
    # end
end

class EmptyStartPositionError < StandardError ; end

# b = Board.new
# b.move_piece([6,4], [4,4])
# p b
# b.move_piece([1,3], [3,3])
# p b 
# b.move_piece([4,4], [3,3])
# p b 

