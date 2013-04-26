class Card < ActiveRecord::Base
  belongs_to :deck
  validates :description, :presence => true
  validates :answer, :presence => true
end
