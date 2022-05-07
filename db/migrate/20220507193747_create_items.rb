class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string "title"
      t.integer "quantity"
      t.string "img"
      t.float "price"
      t.bigint "cart_id", null: false
      t.index :cart_id,  name: "index_items_on_cart_id"
      t.timestamps
    end
  end
end
