#!/usr/bin/env ruby

class MkdirExe

  # Run the mkdir routine, making a directory
  def run(directory_name)
    begin
      # Remove any extra characters
      directory_name = directory_name.chomp
      puts 'Creating a new directory...'

      # Cursory check to ensure we have a directory name
      if directory_name.length < 1
        display_help
      else
        Dir.mkdir(directory_name) unless File.directory?(directory_name)
      end
    rescue
      puts "Exception encountered in \"mkdir\" routine " + $!
      raise
    end
  end

  def display_help
    puts 'Usage: mkdir [DIRNAME]'
  end
end