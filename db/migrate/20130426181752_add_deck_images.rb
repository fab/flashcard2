class AddDeckImages < ActiveRecord::Migration
  def change
    add_column :decks, :image_url, :string
  end
end
