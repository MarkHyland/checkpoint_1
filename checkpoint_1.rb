require 'minitest/autorun'

class Book

  def initialize title, price
    @title = title
    @price = price
   
  end

  def title
    @title
  end

  def price
    @price
  end

end

class Cart
  def initialize
    @cart = []
  end

  def cart
    @cart
  end

  def item_count
    cart.count
  end

  def add book
    cart.push(book)
  end

  def value
    running_total = 0
    cart.each do |book_x|
      running_total = book_x.price + running_total
    end
    running_total 
  end

end

class ShoppingTest < MiniTest::Test
  def test_books_have_a_title_and_price
    b = Book.new "War & Peace", 25
    assert_equal "War & Peace", b.title
    assert_equal 25, b.price
  end

  def test_carts_can_hold_books
    cart = Cart.new
    assert_equal 0, cart.item_count

    cart.add Book.new("Great Expectations", 10)
    cart.add Book.new("Oh, The Places You'll Go!", 8)
    assert_equal 2, cart.item_count
  end

  def test_carts_can_find_the_total_cost
    cart = Cart.new
    cart.add Book.new("Great Expectations", 10)
    cart.add Book.new("Oh, The Places You'll Go!", 8)
    assert_equal 18, cart.value
  end
end
