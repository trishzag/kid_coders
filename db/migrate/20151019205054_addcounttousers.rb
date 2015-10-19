class Addcounttousers < ActiveRecord::Migration
  def change
    add_column :users, :assignment_complete, :integer, null: false, default: 0
  end
end
