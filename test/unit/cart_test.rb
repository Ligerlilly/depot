require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "adding duplicate products to cart" do
    cart = Cart.create
    book_one = products(:ruby)
    book_two = products(:ruby)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    
    assert_equal 2, cart.line_items[0].quantity
    assert_equal 1, cart.line_items.size
    assert_equal 2 * book_one.price, cart.total_price
  end
  
  test "adding unique products to cart" do
    cart = Cart.create
    book_one = products(:one)
    book_two = products(:ruby)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    
    assert_equal 2, cart.line_items.size
    
    assert_equal cart.line_items[0].product_price + cart.line_items[1].product_price, cart.total_price
  end
  
  
end
