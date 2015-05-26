class World
    attr_reader :cells

    def initialize(cells = [] || cells = [[]])
        @cells  = cells
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

    def neighbours(cell)
         (0..cells.length - 1).to_a - [cell]
    end

    def neighbour_count(cell)
        count = 0
        neighbours(cell).each do |index|
            count += cells[index] 
        end
        return count
    end
end
