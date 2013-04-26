class Card < ActiveRecord::Base
  belongs_to :deck
  validates :definition, :presence => true
  validates :answer, :presence => true
end
