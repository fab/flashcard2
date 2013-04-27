class Deck < ActiveRecord::Base
  has_many :cards
  validates :name, :presence => true
  validates :image_url, :presence => true
end
