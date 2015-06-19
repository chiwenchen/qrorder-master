class Table < ActiveRecord::Base
  has_many :orders
  has_many :menus, through: :orders
  belongs_to :restaurant

end