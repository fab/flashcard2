class Game < ActiveRecord::Base
  has_many :rounds
  belongs_to :user
  belongs_to :deck

  # validates :definition, :presence => true
  # validates :answer, :presence => true
end
