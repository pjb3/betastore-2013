require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "an order place yesterday is returned by recent" do
    assert Order.recent.where(id: orders(:yesterday).id).exists?
  end

  test "an order placed 10 days ago is not returned by recent" do
    assert !Order.recent.where(id: orders(:older).id).exists?
  end
end
