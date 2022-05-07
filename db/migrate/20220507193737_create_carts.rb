class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string "title"
      t.float "total"
      t.string "number"
      t.index :number, unique: true,name: "index_carts_on_number"
      t.timestamps
    end
  end
end
