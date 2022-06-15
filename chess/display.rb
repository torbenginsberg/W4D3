require "colorize"
require_relative "./board.rb"
require_relative "./cursor.rb"
require "byebug"

class Display
    def initialize(board)
        @theboard = board.board
        @cursor = Cursor.new([0,0], board)
    end

    attr_reader :theboard

    def render
        #@theboard[cursor_pos] = have a diff background color
        #as long as you dont hit space or return you can keep updating cursor positon

            #old pos = blank color
            #new pos = new color


            #once you hit one of those 2, a piece or board will do something
            #you interact with the piece and board
            #cursor movement until you hit space or enter again
        # board updates
        # next player

    end

    def inspect
        @theboard.each { |row| p row }
        nil
    end

end



a = Board.new
b = Display.new(a)
p b
b.render