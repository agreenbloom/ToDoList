class AddViewCounterToItem < ActiveRecord::Migration
  def change
  	add_column :items, :view_counter, :integer, default: 0
  end
end
