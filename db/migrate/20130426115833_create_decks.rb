class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, :null => false
      t.string :category
      t.references :user
    end
  end
end
