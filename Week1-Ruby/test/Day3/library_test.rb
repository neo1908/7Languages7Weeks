# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './Day3/exercism_challenge'

class TestHello < Minitest::Test
  def initialize(name)
    @library = Library.new
    super
  end

  def test_lookup_title_returns_correct_title
    assert_equal @library.lookup_title('9780330319089'), 'Cosmicomics'
  end

  def test_book_stock_is_zero_when_borrowed_without_stock
    @library.borrow!("9780718198916")
    assert_equal @library.book_in_stock?("9780718198916"), false
  end

  def test_adding_stock_to_book_does_not_affect_other_stock
    @library.add_stock!("9780451524935", 30)
    assert_equal @library.lookup_stock("9780974514055"), 0
  end

  # TODO - Expand tests
end
