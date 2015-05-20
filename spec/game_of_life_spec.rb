require "game_of_life"

describe "game of life" do 
    it "creates an empty world" do 
        empty_world = World.new
        expect(empty_world.cells).to eq([])
    end 

    it "takes a 2d game with no live cells and returns an empty world" do 
        game = World.new([0,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    it "takes a 2d game with no live cells and returns an empty world" do 
        game = World.new([1,0,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    it "takes a 2d game with no live cells and returns an empty world" do 
        game = World.new([1,1,0,0])
        game.tick
        expect(game.cells).to eq([0,0,0,0])
    end

    it "takes a 2d game with no live cells and returns an empty world" do 
        game = World.new([1,1,1,0])
        game.tick
        expect(game.cells).to eq([1,1,1,1])
    end
end
