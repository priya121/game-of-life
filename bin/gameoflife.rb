#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require "console"
require "curses"

Curses.init_screen
Curses.curs_set 0

world = World.random_world(Curses.cols,Curses.lines - 1)

class NoExit
    def exit?
        false
    end
end

Console.new(world,Kernel,Kernel,Kernel,NoExit.new,Curses).run
