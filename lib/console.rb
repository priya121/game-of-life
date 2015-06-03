require "curses"
require "game_of_life"

class Console
    def initialize(world,input,output,timer,exiter,screen)
        @world = world
        @input = input
        @output = output
        @timer = timer
        @exiter = exiter
        @screen = screen
    end

    def display
        @world.cells.each_with_index do |cell,i|
            if cell == 1 
                @output.print "☺"
            else @output.print " "
            end
            if (i+1) % @world.width == 0
                @output.print "\n\r"
            end
        end
    end

    def next_generation
        @world.tick
        display
        @screen.refresh
        @timer.sleep(0.5)
    end

    def run
        display
        while !@exiter.exit? 
            next_generation
        end

    end

end

