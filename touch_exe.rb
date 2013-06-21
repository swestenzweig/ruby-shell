#!/usr/bin/env ruby

class TouchExe

  # Run the touch routine, creating a new empty file
  # @param [Object] file_name
  def run (file_name)
    begin
      file_name = file_name.chomp
      if file_name.length < 1
        display_help
      else
        puts 'Creating a new file...'
        new_file = File.open(file_name, 'w+')
      end
    rescue
      # If an exception is encountered, simply report and continue
      puts "Exception encountered in \"touch\" routine " + $!
      raise
    ensure
      new_file.close unless new_file.nil?
    end
  end

  def display_help
    puts 'Usage: touch [FILENAME]'
  end
end