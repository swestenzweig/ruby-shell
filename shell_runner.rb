#!/usr/bin/env ruby

$:.unshift '.' 
require 'ruby_shell'

# Run script to initiate the RubyShell
puts "Welcome to RubyShell! Please enter a command at the prompt"
puts "or type \"Exit\" to exit the shell."
rs = RubyShell.new
while true
 puts "\nRubyShell> "
 localCommand = gets

 if localCommand.length < 1
  puts "Please enter a command"
 else
   # Pass the command to the RubyShell Controller
   rs.execute localCommand
 end
end

