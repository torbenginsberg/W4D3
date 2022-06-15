require_relative "./piece.rb"

class Knight < Piece
    include Steppable

    def symbol
        :N
    end

    def move_diffs
        [:knight]
    end
end