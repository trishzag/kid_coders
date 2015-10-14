class Removegroupsfromusers < ActiveRecord::Migration
  def change
    remove_reference :users, :group, index: true
  end
end
