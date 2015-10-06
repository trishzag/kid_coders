class Resources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name, null: false, unique: true
      t.string :source, null: false
      t.belongs_to :assignment

      t.timestamps null: false
    end
  end
end
