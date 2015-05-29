require "game_of_life"

describe "game of life" do 
    xit "creates an empty world" do 
        empty_world = World.new
        expect(empty_world.cells).to eq([])
    end 

    xit "takes a 2d game with no live cells and returns an empty world" do 
        game = World.new([0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    xit "takes a 2d game with one live cell and returns an empty world" do 
        game = World.new([1,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    xit "takes a 2d game with two live cells and returns an empty world" do 
        game = World.new([1,1,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    xit "takes a 2d game with one dead cell and returns four live cells" do 
        game = World.new([1,1,1,0])
        game.tick
        expect(game.cells).to eq([1,1,1,1])
    end

    xit "takes a 2d game with 4 live cells and all stay alive in the next generation" do 
        game = World.new([1,1,1,1])
        game.tick
        expect(game.cells).to eq([1,1,1,1])
    end

    xit "takes a 3d game with no live cells and returns an empty world" do
        game = World.new([0,0,0,0,0,0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0,0,0,0,0,0])
    end

    xit "takes a 9 cell game with one live cell and returns an empty world" do 
        game = World.new([1,0,0,0,0,0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0,0,0,0,0,0])
    end

    xit "takes a 9 cell game with two live cells and returns an empty world" do
        game = World.new([1,1,0,0,0,0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0,0,0,0,0,0])
    end

    xit "takes a 9 cell game with three live cells and returns four live cells and three dead cells" do
        game = World.new([1,1,1,0,0,0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,1,0,1,1,0,0,0,0])
    end

    it "takes a 5 by 5 board and for a cell with index returns neighbours indicies" do
        game = World.new([],5,5)
        expect(game.neighbours(7,2,2)).to eq([1,2,3,6,8,11,12,13])
        expect(game.neighbours(12,2,2)).to eq([6,7,8,11,13,16,17,18])
        #expect(game.neighbours(0,0,0)).to eq([1,5,6])
        expect(game.neighbours(4,4,0)).to eq([3,8,9])
        expect(game.neighbours(3,2,0)).to eq([2,4,7,8,9])
        expect(game.neighbours(17,2,3)).to eq([11,12,13,16,18,21,22,23])
    end
    
    it "takes a 6 by 6 board and for a given cell with index returns neighbours indicies" do 
        game = World.new([],6,6)
        expect(game.neighbours(1,1,0)).to eq([0,2,6,7,8])
    end

    it "takes a 7 by 7 board and for a given cell with an index returns neighbours indicies" do 
        game = World.new([],7,7)
        expect(game.neighbours(13,6,1)).to eq([5,6,12,19,20])
    end
    
end



