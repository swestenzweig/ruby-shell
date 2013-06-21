require 'test/unit'
require 'exit_exe'

class TestExitExe < Test::Unit::TestCase

  def setup
    @exit_exe = ExitExe.new
  end

  def test_simple
    parameters = ''
    assert_nothing_raised(@exit_exe.run(parameters))
  end
end