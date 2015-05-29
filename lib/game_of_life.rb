class Board
    def initialize(height,width)
        @height = height
        @width = width
    end

    def cell(x,y)
        @x = x
        @y = y
    end
end

class World
    attr_reader :cells

    def initialize(cells = [],width,height)
        @cells  = cells
        @width = width
        @height = height
    end

    def tick
        for i in 0..cells.length
            if cells[i] == 1 || cells[i] == 0
                if neighbour_count(i) == 2 || neighbour_count(i) == 3
                    cells[i] = 1
                else
                    cells[i] = 0
                end
            end
        end
    end

    def neighbours(index,x,y) 
        n = []
        n << index - @width - 1 if x > 0 && y > 0 
        n << index - @width if y > 0 
        n << index - @width + 1 if x < @width - 1 && y > 0 
        n << index - 1  if x > 0  
        n << index + 1 if x < @width - 1 
        n << index + @width - 1 if x > 0 || y < @height - 1
        n << index + @width if y < @height - 1
        n << index + @width + 1 if x < @width - 1 && y < @height - 1 

        return n
    end

    def neighbour_count(cell)
        count = 0  
        neighbours(cell).each do |index|
            count += cells[index] 
        end
        return count
    end
end

