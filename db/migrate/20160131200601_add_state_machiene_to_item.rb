class AddStateMachieneToItem < ActiveRecord::Migration
  def change
  	add_column :items, :state, :string
	add_index :items, :state
  end
end
