class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :url 
      t.text   :content

      t.timestamps
    end
  end
end
