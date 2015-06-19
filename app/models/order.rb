class Order < ActiveRecord::Base
  #attr_accessible :quantity
  belongs_to :menu
  belongs_to :table

  def order_time
    self.created_at.strftime("%R")
  end

end