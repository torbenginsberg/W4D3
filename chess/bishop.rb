require_relative "./piece.rb"

class Bishop < Piece
    include Slideable

    def symbol
        :B
    end

    def move_dirs
        [:diagonal]
    end
end