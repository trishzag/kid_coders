class Grades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name, null: false, unique: true
      t.belongs_to :user
      t.belongs_to :assignment

      t.timestamps null: false
    end
    add_index :grades, [:user_id, :assignment_id], unique: true
  end
end
