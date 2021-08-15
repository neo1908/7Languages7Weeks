require 'minitest/autorun'
require 'minitest/pride'
require './Day1/hello-world'

class TestHello < Minitest::Test
  def test_hello_world
    assert_equal 'Hello, World!', say_hello
  end
end
