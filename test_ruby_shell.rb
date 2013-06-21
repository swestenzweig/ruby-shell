require 'test/unit'
require 'ruby_shell'

class TestRubyShell < Test::Unit::TestCase

  def setup
    @ruby_shell = RubyShell.new
  end

  def test_simple
    parameters = 'ls'
    assert_not_nil(@ruby_shell.search_for_command(parameters))

    parameters = 'mkdir'
    assert_not_nil(@ruby_shell.search_for_command(parameters))

    parameters = 'exit'
    assert_not_nil(@ruby_shell.search_for_command(parameters))

    parameters = 'touch'
    assert_not_nil(@ruby_shell.search_for_command(parameters))

    parameters = 'touch test'
    expected0 = 'touch'
    expected1 = 'test'
    result = @ruby_shell.split_command(parameters)
    assert_equal(expected0,result[0])
    assert_equal(expected1,result[1])
  end
end