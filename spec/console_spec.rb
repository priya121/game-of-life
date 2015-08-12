require "game_of_life"
require "console"

describe Console do

    class ExactTimesExiter
        def initialize(times)
            @times = times
        end

        def exit?
            @times -= 1
            @times == 0
        end
    end

    let(:input) { StringIO.new("") }
    let(:output) { StringIO.new("") }
    let(:world) { World.new([1,1,0,0],2,2) }
    let(:timer) { double().as_null_object }
    let(:exiter) { ExactTimesExiter.new(3) }
    let(:screen) { double().as_null_object }

    def console
        Console.new(world, input, output, timer, exiter, screen)
    end

    describe "#display" do
        it "shows a square world" do 
            console.display
            expect(output.string).to eq("☺☺\n  \n")
        end

    end

    describe "#next_generation" do
        describe "timer" do
            let(:timer) {double}
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
        describe "screen" do
            let (:screen) {double}
            it "refreshes screen" do
                expect(screen).to receive(:refresh)
                console.next_generation
            end
        end
    end

    describe "#run" do
        it "runs multiple generations" do
            console.run
            generation1 = "☺☺\n  \n"
            generation2 = "  \n  \n"
            generation3 = "  \n  \n"
            all = generation1 + generation2 + generation3
            expect(output.string).to eq(all)
        end
    end
end
