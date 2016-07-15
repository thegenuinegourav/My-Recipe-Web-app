class AddAdminToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :admin, :boolean, default: false
  end
end
