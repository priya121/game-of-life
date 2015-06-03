#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require "console"

world = World.new([],20,20)
Console.new(world,Kernel,Kernel,Kernel).start
