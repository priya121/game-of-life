require "game_of_life"
require "console"

describe Console do

    describe "#display" do
        let(:input) { StringIO.new("") }
        let(:output) { StringIO.new("") }
        let(:world) { World.new([1,1,0,0],2,2) }
        let(:timer) { double() }
        let(:console) { Console.new(world,input,output,timer) }
        
        it "shows a square world" do 
            console.display
            expect(output.string).to eq("☺☺\n  \n")
        end

        it "shows next generation" do
            expect(timer).to receive(:sleep).with(0.5)
            console.next_generation
            expect(output.string).to eq("  \n  \n")
        end

        it "sleeps" do 
            expect(timer).to receive(:sleep).with(0.5)
            console.next_generation
        end
    end
end
