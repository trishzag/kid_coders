class Curricula < ActiveRecord::Migration
  def change
    create_table :curricula do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
    add_index :curricula, [:id, :name], unique: true
  end
end
