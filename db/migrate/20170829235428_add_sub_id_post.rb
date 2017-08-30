class AddSubIdPost < ActiveRecord::Migration[5.1]
  def change
   add_column :posts, :sub_id,:integer
   add_index :posts, :sub_id
  end

end
