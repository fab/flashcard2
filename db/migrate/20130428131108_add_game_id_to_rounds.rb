class AddGameIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :game_id, :integer, :null => false
  end
end
