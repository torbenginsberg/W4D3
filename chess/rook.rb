require_relative "./piece.rb"
require_relative "./slideable.rb"

class Rook < Piece
    include Slideable

    def symbol
        :R
    end

    def move_dirs
        [:horizontal]
    end
end
