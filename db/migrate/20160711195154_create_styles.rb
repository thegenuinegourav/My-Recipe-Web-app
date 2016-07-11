class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
    end
  end
end
