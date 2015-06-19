class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :name, :password, :role
  belongs_to :restaurant
end