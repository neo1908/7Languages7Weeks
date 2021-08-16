require 'minitest/autorun'
require 'minitest/pride'
require './Day1/hello-world'

class TestHello < Minitest::Test

  def test_hello_world
    assert_equal 'Hello, World!', say_hello
  end

  def test_hello_names
    names = %w[Ben Rachel Martin Tom James]
    names.each { |name| assert_equal "Hello, #{name}!", say_hello(name) }
  end

end
