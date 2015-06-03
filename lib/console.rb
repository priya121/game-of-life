require "curses"
require "game_of_life"

class Console
    def initialize(world,input,output,timer)
        @world = world
        @input = input
        @output = output
        @timer = timer
        #Curses.init_screen
        #Curses.curs_set 0
    end

    def display
        @world.cells.each_with_index do |cell,i|
            if cell == 1 
                @output.print "☺"
            else @output.print " "
            end
            if (i+1) % @world.width == 0
                @output.print "\n"
            end
        end
    end

    def next_generation
        @world.tick
        display
        @timer.sleep(0.5)
    end

    def start

    end


end

