require 'test/unit'
require 'mkdir_exe'

class TestMkdirExe < Test::Unit::TestCase

  def setup
    @mkdir_exe = MkdirExe.new
  end

  def test_simple
    parameters = ''
    assert_nothing_raised do
      @mkdir_exe.run(parameters)
    end

    parameters = 'TestDir'
    @mkdir_exe.run(parameters)
    d = Dir.new(parameters)
    assert_not_nil(d)
  end
end