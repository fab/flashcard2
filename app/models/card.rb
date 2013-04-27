class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :rounds
  validates :definition, :presence => true
  validates :answer, :presence => true
end
