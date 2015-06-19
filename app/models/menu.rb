class Menu < ActiveRecord::Base

  belongs_to :restaurant
  has_many :order
  has_many :tables, through: :orders
  validates_presence_of :dish_name, :description

end