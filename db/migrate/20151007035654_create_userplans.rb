class CreateUserplans < ActiveRecord::Migration
  def change
    create_table :userplans do |t|
      t.belongs_to :user
      t.belongs_to :curriculum

      t.timestamps null: false
    end
    add_index :userplans, [:user_id, :curriculum_id], unique: true
  end
end
