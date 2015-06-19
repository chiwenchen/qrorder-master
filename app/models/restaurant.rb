class Restaurant < ActiveRecord::Base
  has_many :menus
  has_many :tables
  has_many :users
  validates_presence_of :name

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.gsub(' ', '_').downcase
  end

  def to_param
    self.slug
  end
  
end