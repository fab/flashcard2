class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :card
      t.references :user
      t.boolean :correct
    end
  end
end
