class RemoveUserIdFromRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :user_id
  end
end
