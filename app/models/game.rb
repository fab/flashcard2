class Game < ActiveRecord::Base
  

  has_many :rounds
  belongs_to :users, :decks

  # validates :definition, :presence => true
  # validates :answer, :presence => true
end
