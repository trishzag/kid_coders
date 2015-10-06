class Assignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title, null: false, unique: true
      t.belongs_to :curriculum

      t.timestamps null: false
    end
    add_index :assignments, [:title, :curriculum_id], unique: true
  end
end
