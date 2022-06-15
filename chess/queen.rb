require_relative "./piece.rb"

class Queen < Piece
    include Slideable

    def symbol
        :Q
    end
end