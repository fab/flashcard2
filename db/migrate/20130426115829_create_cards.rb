class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :definition, :null => false
      t.string :answer, :null => false
      t.references :deck
    end
  end
end
