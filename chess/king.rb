require_relative "./piece.rb"
require_relative "./steppable.rb"

class King < Piece
    include Steppable

    def symbol
        :K
    end

    def move_diffs
        [:king]
    end
    
end