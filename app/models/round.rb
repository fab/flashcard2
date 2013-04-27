class Round < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, :presence => true
  belongs_to :user
  belongs_to :card
end
