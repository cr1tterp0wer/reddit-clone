class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.integer :post_id,uniqueness:true
      t.integer :moderator_id, null:false
      t.string  :title, null:false
      t.string  :description, null:false
      t.timestamps
    end
    add_index :subs, :post_id
    add_index :subs, :moderator_id
  end
end
