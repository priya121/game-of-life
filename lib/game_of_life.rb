class World
    attr_reader :cells
    attr_reader :width

    def initialize(cells,width,height)
        @cells  = cells
        @width = width
        @height = height
    end

    def self.generate_cells(total_amount)
        cells = [] 
        (0..total_amount - 1).each do |cell|
            rand = Random.new.rand(0..1)
            cells << rand
        end
        return cells
    end

    def self.random_world(width,height)
        cells = generate_cells(width*height)
       world =  World.new((cells),20,20)
       return world
    end

    def tick
        new_cells = []
        for i in 0..@cells.length - 1
            if should_be_alive?(i)
                new_cells[i] = 1
            else
                new_cells[i] = 0
            end
        end
        @cells = new_cells
    end

    def alive?(cell)
        @cells[cell] == 1
    end

    def should_be_alive?(cell)
        neighbours = neighbour_count(cell)
        alive?(cell) && (2..3).include?(neighbours) || !alive?(cell) && neighbours == 3
    end

        def neighbours(index) 
            x = index % @width
            y = (index / @width).to_i
            n = []
            n << index - @width - 1 if x > 0 && y > 0 
            n << index - @width if y > 0 
            n << index - @width + 1 if x < @width - 1 && y > 0 
            n << index - 1  if x > 0  
            n << index + 1 if x < @width - 1 
            n << index + @width - 1 if x > 0 && y < @height - 1
            n << index + @width if y < @height - 1
            n << index + @width + 1 if x < @width - 1 && y < @height - 1 
            n
        end

        def neighbour_count(cell)
            count = 0  
            neighbours(cell).each do |index|
                count += @cells[index] 
            end
            return count
        end
    end

