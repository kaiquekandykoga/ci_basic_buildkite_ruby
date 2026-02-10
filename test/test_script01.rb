require "test/unit"
require_relative "../script_01.rb"

class TestScript01 < Test::Unit::TestCase
  def test_call
    assert(call == 2)
  end
end
