require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "normal price" do
    assert_equal 9.99, products(:test).price
  end
end
