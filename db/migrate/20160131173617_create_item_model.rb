class CreateItemModel < ActiveRecord::Migration
  def change
    create_table :items do |t|
  		t.string   "title"
  		t.text "description"
      t.timestamps null: false

    end
  end
end
