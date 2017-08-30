class RemovePostiDfromSubs < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs,:post_id
  end
end
