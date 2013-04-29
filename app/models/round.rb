class Round < ActiveRecord::Base
  # Remember to create a migration!
  validates :card_id, :presence => true
  belongs_to :card
  belongs_to :game
  has_many :user, :through => :game
end
