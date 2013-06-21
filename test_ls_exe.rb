require 'test/unit'
require 'ls_exe'
require 'mkdir_exe'

class TestLsExe < Test::Unit::TestCase

  def setup
    @ls_exe = LsExe.new
    @mkdir_exe = MkdirExe.new
  end

  def test_simple
    parameters = ''
    assert_nothing_raised do
      @ls_exe.run(parameters)
    end

    parameters = 'TestDir'
    @mkdir_exe.run(parameters)
    assert_nothing_raised do
      @ls_exe.run(parameters)
    end
  end
end