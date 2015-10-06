class Contents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.string :source, null: false
      t.belongs_to :assignment

      t.timestamps null: false
    end
    add_index :contents, [:title, :assignment_id], unique: true
  end
end
