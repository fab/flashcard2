class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :definition, :null => false
      t.text :answer, :null => false
      t.references :deck
    end
  end
end
