class Admin::DashboardController < ApplicationController

  def index
    sql = %{
    select date(placed_at), count(*), sum(total_amount)
    from orders
    where placed_at > '#{30.days.ago}'
    group by date(placed_at)
    order by date(placed_at)}
    @days = Order.connection.select_rows(sql)
  end

end
