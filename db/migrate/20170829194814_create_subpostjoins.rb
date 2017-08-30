class CreateSubpostjoins < ActiveRecord::Migration[5.1]
  def change
    create_table :subpostjoins do |t|
      t.integer :post_id,null:false
      t.integer :sub_id, null:false
      t.timestamps
    end
    add_index :subpostjoins, :post_id
    add_index :subpostjoins, :sub_id
  end
end
