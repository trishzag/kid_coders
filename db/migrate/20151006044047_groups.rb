class Groups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
    add_index :groups, [:name, :id], unique: true
  end
end
