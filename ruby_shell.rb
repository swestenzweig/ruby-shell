#!/usr/bin/env ruby

class RubyShell

  # Require each of the command classes that the RubyShell supports
  $:.unshift '.'
  require 'ls_exe'
  require 'mkdir_exe'
  require 'touch_exe'
  require 'exit_exe'

  # Set up hash and class variables here
  def initialize 
    # Create a class variable to hold an instance of each command classes
    @ls_exe = LsExe.new
    @mkdir_exe = MkdirExe.new
    @touch_exe = TouchExe.new
    @exit_exe = ExitExe.new

    # Hash to hold each of the supporting classes
    @command_map = {
       'ls' => @ls_exe,
       'mkdir' => @mkdir_exe,
       'touch' => @touch_exe,
       'exit' => @exit_exe
    }

  end

  # Check if the command is supported
  # @return [Object] the command found (or nil)
  def search_for_command(command)
     @command_map[ command ]
  end

  def split_command(command_args)
    # Split the command_args string by whitespace. Only support 2 strings
    command_args = command_args.split(' ',2)
  end
  # Parse the command args and execute the corresponding command
  def execute(command_args)
     command_args = split_command(command_args)
     command = command_args[0].to_s
     parameter = command_args[1].to_s

     # Find the command to execute
     command_to_execute = search_for_command command.downcase

     # If the command is not found, show the help
     if command_to_execute == nil
       help command
     else
      # Create a pointer to the command's RUN method, and call it
      method = command_to_execute.method("run")
      method.call(parameter)
     end
  end

  # Display the errant command, along with a list of valid commands
  def help command
    puts "
The command you entered, #{command}, is not supported.
Valid commands: "
    @command_map.each_key{|key| puts "\t#{key}\n"}
  end

end

