class Piece
    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #board instance
        @pos = pos
        add_to_board
    end

    attr_reader :color, :board
    attr_accessor :pos

    def to_s
        self.color
    end

    def empty?
        return true if self == NullPiece
        false
    end

    def valid_moves
        arr = []
        # self.moves.each do |move|

    end

    def pos=(val)
        pos = val
    end

    def add_to_board
        @board[pos] = self
    end

    def move_into_check?(end_pos)
    end

    def inspect
        self.symbol
    end
end