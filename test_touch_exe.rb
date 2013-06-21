require 'test/unit'
require 'touch_exe'

class TestTouchExe < Test::Unit::TestCase

  def setup
    @touch_exe = TouchExe.new
  end

  def test_simple
    parameters = ''
    assert_nothing_raised do
      @touch_exe.run(parameters)
    end

    parameters = 'foo.out'
    @touch_exe.run(parameters)
    f = File.new(parameters)
    assert_not_nil(f)
  end
end