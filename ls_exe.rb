#!/usr/bin/env ruby

class LsExe

  # Run the ls routine, displaying the contents of a directory
  def run(directory)
    begin
      directory = directory.chomp

      # If no input parameters, just show the current directory
      if directory.length < 1
        puts 'Displaying the contents of the current directory...'
        puts Dir.pwd
        Dir.foreach(Dir.pwd) {|x| puts "File #{x}"}
      else
        puts "Displaying the contents of directory #{directory}"
        Dir.chdir(directory)
        puts Dir.pwd
        Dir.foreach(Dir.pwd) {|x| puts "File #{x}"}
      end
    rescue
      puts "Exception encountered in \"ls\" routine " + $!
      raise
    end
  end

end